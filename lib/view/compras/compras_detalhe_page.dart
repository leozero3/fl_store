import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_store/view/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComprasDetalhePage extends StatelessWidget {
  static String tag = '/compra-detalhe-page';

  final DocumentReference id;

  ComprasDetalhePage(this.id);

  @override
  Widget build(BuildContext context) {
    var content = Container(
      decoration: BoxDecoration(
          color: Layout.Light(), borderRadius: BorderRadius.circular(25)),
      margin: const EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Em 20/03/2020 às 14:36'),
          SizedBox(height: 10),
          Text('Status: Em análise'),
          Text('Total em Itens: R\$ 70,00'),
          Text('Frete por PAC: R\$ 30,00'),
          SizedBox(height: 10),
          Text('Total: R\$ 100,00'),
          SizedBox(height: 20),
          Text('Itens:', style: TextStyle(fontSize: 18)),
          Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 8,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: Layout.Dark(.1),
                          borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                              'https://picsum.photos/id/${i + 50}/70/70.jpg'),
                        ),
                        title: Text('Óculos Lindão'),
                        subtitle: Text('3 X R\$ 15,00'),
                        trailing: Text('R\$45,00'),
                      ),
                    );
                  }))
        ],
      ),
    );

    return Layout.render(
        context,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Compra #',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Layout.Light()),
              ),
            ),
            Expanded(child: content)
          ],
        ));
  }
}
