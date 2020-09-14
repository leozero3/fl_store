import 'package:fl_store/view/compras/compras_detalhe_page.dart';
import 'package:fl_store/view/layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ComprasPage extends StatelessWidget {
  static String tag = '/compras-page';

  @override
  Widget build(BuildContext context) {
    var content = ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 9,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            margin: EdgeInsets.fromLTRB(20, (i == 0 ? 10 : 0), 20, 10),
            decoration: BoxDecoration(
                color: Layout.Light(), borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              isThreeLine: true,
              title: Text('#125 - R\$ 125,80'),
              subtitle: Text('Em 15/05/2020 as 20:54 \nEm analise'),
              trailing: IconButton(
                  icon: FaIcon(FontAwesomeIcons.clipboardList),
                  color: Layout.primary(),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ComprasDetalhePage(123)));
                  }),
            ),
          );
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
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6
                    .copyWith(
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
