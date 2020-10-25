import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_store/model/compra_model.dart';
import 'package:fl_store/view/compras/compras_detalhe_page.dart';
import 'package:fl_store/view/layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fl_store/functions.dart';

class ComprasPage extends StatelessWidget {
  static String tag = '/compras-page';



  @override
  Widget build(BuildContext context) {
    var content = StreamBuilder(
        stream: Firestore.instance.collection('compra').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('erro: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data.documents.length == 0) {
            return Center(child: Text('Nenhum compra'));
          }

          return ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int i) {

                var docSnp = snapshot.data.documents[i];
                var item = CompraModel.fromJson(docSnp.reference, docSnp.data);

                return Container(
                  margin: EdgeInsets.fromLTRB(20, (i == 0 ? 10 : 0), 20, 10),
                  decoration: BoxDecoration(
                      color: Layout.Light(),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    isThreeLine: true,
                    title: Text('#${item.sequence} - ${item.valorTotal.toBRL()}'),
                    subtitle: Text('${item.data.toFormat()} \n${item.status}'),
                    trailing: IconButton(
                        icon: FaIcon(FontAwesomeIcons.clipboardList),
                        color: Layout.primary(),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ComprasDetalhePage(item.docRef)));
                        }),
                  ),
                );
              });
        });

    return Layout.render(
        context,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Minhas compras',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Layout.Light(),
                    ),
              ),
            ),
            Expanded(child: content)
          ],
        ),
        bottomItemSelected: 1);
  }
}
