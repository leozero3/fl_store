import 'package:fl_store/view/layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProdutoPage extends StatelessWidget {
  static String tag = '/produto-page';

  int currentPic = 0;
//keytool -list -v -keystore "C:\Users\leo\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
  @override
  Widget build(BuildContext context) {
    var sController = ScrollController();
    var listViewItemWidth = MediaQuery.of(context).size.width - 40;

    var content = Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Stack(
              children: [
                ListView.builder(
                  controller: sController,
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      width: listViewItemWidth,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        child: Image.asset(
                          'assets/images/produtos/prod-${i + 1}.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  width: listViewItemWidth,
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FlatButton(
                      onPressed: () => null,
                      child: FaIcon(
                        FontAwesomeIcons.solidHeart,
                        color: Layout.Light(),
                      ),
                      color: Colors.red[300],
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                Container(
                  width: listViewItemWidth,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.chevronLeft,
                        color: Layout.Light(),
                      ),
                      onPressed: () {
                        sController.animateTo(
                          (currentPic - 1) * listViewItemWidth,
                          duration: Duration(milliseconds: 700),
                          curve: Curves.ease,
                        );
                        currentPic--;
                      },
                    ),
                  ),
                ),
                Container(
                  width: listViewItemWidth,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.chevronRight,
                        color: Layout.Light(),
                      ),
                      onPressed: () {
                        sController.animateTo(
                          (currentPic + 1) * listViewItemWidth,
                          duration: Duration(milliseconds: 700),
                          curve: Curves.ease,
                        );
                        currentPic++;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: Layout.Light(),
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 60) * .65,
                      child: Text(
                        'Título bem bonito',
                        style: Theme.of(context).textTheme.headline6.copyWith(),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'R\$ 150,00',
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Layout.primary(),
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Chip(
                        label: Text('Vermelho'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Chip(
                        label: Text('Preto',
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: Layout.primaryDark(.6),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Chip(
                        label: Text('Azul'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                    child: ListView(
                  children: [
                    Text('Detalhes',
                        style: Theme.of(context).textTheme.headline6),
                    SizedBox(height: 10),
                    Text('A população ela precisa da Zona Franca de Manaus, '
                        'porque na Zona franca de Manaus, '
                        'não é uma zona de exportação,'
                        ' é uma zona para o Brasil. '
                        'Portanto ela tem um objetivo, '
                        'ela evita o desmatamento, '
                        'que é altamente lucravito. '
                        'Derrubar arvores da natureza é muito lucrativo!')
                  ],
                ))
              ],
            ),
          )),
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Layout.primary(),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'COMPRAR',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );

    return Layout.render(context, content);
  }
}
