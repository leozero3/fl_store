import 'package:fl_store/view/layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarrinhoPage extends StatelessWidget {
  static String tag = '/carrinho';

  @override
  Widget build(BuildContext context) {

    var temFrete = false;

    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: Text(
            'Carrinho',
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Layout.Light(),
                ),
          ),
        ),
        Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 18,
                itemBuilder: (BuildContext context, int i) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    decoration: BoxDecoration(
                      color: Layout.Light(),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(2, 3),
                            color: Layout.Dark(.1))
                      ],
                    ),
                    child: Container(
                      height: 70,
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            child: Image.network(
                                'https://picsum.photos/id/${i + 30}/70/70.jpg'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Nome do produto'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Um subtitulo',
                                  style: TextStyle(color: Layout.Dark(.6)))
                            ],
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('R\$ 125,50'),
                              Container(
                                width: 70,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: null,
                                      child: FaIcon(
                                        FontAwesomeIcons.chevronLeft,
                                        size: 16,
                                      ),
                                    ),
                                    Text('1', style: TextStyle(fontSize: 18)),
                                    GestureDetector(
                                      onTap: null,
                                      child: FaIcon(
                                          FontAwesomeIcons.chevronRight,
                                          size: 16),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  );
                })),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Layout.Light(),
          ),
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      color: Layout.Dark(.1),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: temFrete
                          ? Text('PAC', style: TextStyle(fontSize: 24))
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: FaIcon(FontAwesomeIcons.truck),
                                  onPressed: null,
                                ),
                                Text(
                                  'Selecione o Frete',
                                  style: TextStyle(color: Colors.red),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                    ),
                    Expanded(
                        child: Container(
                      child: Column(
                        children: [
                          Text('5 produtos:'),
                          Text('Frete'),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Total:',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    )),
                    Container(
                      child: Column(
                        children: [
                          Text('R\$ 150,00'),
                          Text('R\$ 50,00'),
                          SizedBox(height: 10),
                          Text(
                            'R\$ 200,00',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: FlatButton(
              onPressed: null,
              color: Layout.primary(),
              disabledColor: Layout.primary(.3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'Finalizar Compra',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Layout.Light(),
                      fontSize: 18,
                    ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10)
      ],
    );

    return Layout.render(context, content);
  }
}
