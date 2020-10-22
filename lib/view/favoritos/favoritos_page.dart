import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_store/controller/user_controller.dart';
import 'package:fl_store/model/favorito_model.dart';
import 'package:fl_store/model/produto_model.dart';
import 'package:fl_store/view/layout.dart';
import 'package:fl_store/view/produto/produto_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FavoritosPage extends StatelessWidget {
  static String tag = '/favoritos-page';

  @override
  Widget build(BuildContext context) {
    var userController = Provider.of<UserController>(context);

    var favoritoSnapshot = Firestore.instance
        .collection('favorito')
        .where('uid', isEqualTo: userController.user.uid)
        .where('excluido', isEqualTo: false)
        .snapshots();

    Firestore.instance
        .document('/favorito/7wn7tOpD7DgLqyH4VrXD')
        .get()
        .then((docSnp) {

          var favorito = FavoritoModel.fromJson(docSnp.reference, docSnp.data);

          favorito.loadProduto(docSnp.data['fk_produto']).then((value) {
            print(favorito.toJson());
          });

    });

    Widget content = StreamBuilder(
      stream: favoritoSnapshot,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('erro: ${snapshot.error}'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.data.documents.length == 0) {
          return Center(child: Text('nenhum favorito ainda'));
        }

        return ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: snapshot.data.documents.length,
          itemBuilder: (BuildContext context, int i) {
            var favoritoDoc = snapshot.data.documents[i];

            var item =
                FavoritoModel.fromJson(favoritoDoc.reference, favoritoDoc.data);

            print(item.toJson());
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProdutoPage(125),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(20, (i == 0 ? 10 : 0), 20, 10),
                decoration: BoxDecoration(
                  color: Layout.Light(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FutureBuilder(
                  future: item.loadProduto(favoritoDoc.data['fk_produto']),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<ProdutoModel> snpsProd,
                  ) {
                    if (snpsProd.hasError) {
                      return Center(
                        child: Text('erro: ${snpsProd.error}'),
                      );
                    }
                    if (snpsProd.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: Padding(
                              padding: const EdgeInsets.all(25),
                              child: LinearProgressIndicator()));
                    }
                    //print(snpsProd.data.data);

                    return ListTile(
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      dense: true,
                      leading: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            'assets/images/produtos/prod-1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(snpsProd.data.titulo),
                      subtitle: Text(snpsProd.data.chamada),
                      trailing: IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.red[300],
                          ),
                          onPressed: () {
                            // marca o registro como excluido
                            item.docRef.updateData({
                              'excluido': true,
                            });
                          }),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );

    return Layout.render(
      context,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 0),
            child: Text(
              'Favoritos',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Layout.Light(),
                  ),
            ),
          ),
          Expanded(child: content)
        ],
      ),
      bottomItemSelected: 2,
    );
  }
}
