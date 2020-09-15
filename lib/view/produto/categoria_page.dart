import 'package:fl_store/view/layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriaPage extends StatelessWidget {
  static String tag = '/categoria-page';

  final int id;

  CategoriaPage(this.id);

  @override
  Widget build(BuildContext context) {
    print(Layout.categoriaPorId(id));

    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextFormField(
            decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  color: Layout.primary(),
                ),
                hintText: 'pesquisa',
                contentPadding: const EdgeInsets.only(left: 20),
                isDense: true,
                fillColor: Layout.Light(.6),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Layout.primary(.3)),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Layout.primary(.3),
                  ),
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Chip(
                  label: Text(
                    'Maior valor',
                    style: TextStyle(color: Layout.Light()),
                  ),
                  backgroundColor: Layout.Dark(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Chip(
                  label: Text(
                    'Menor valor',
                    style: TextStyle(color: Layout.Light()),
                  ),
                  backgroundColor: Layout.Dark(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Chip(
                  label: Text(
                    'de A - Z',
                    style: TextStyle(color: Layout.Light()),
                  ),
                  backgroundColor: Layout.Dark(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Chip(
                  label: Text(
                    'de Z - A',
                    style: TextStyle(color: Layout.Light()),
                  ),
                  backgroundColor: Layout.Dark(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Chip(
                  label: Text(
                    'Favoritos',
                    style: TextStyle(color: Layout.Light()),
                  ),
                  backgroundColor: Layout.Dark(),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
          child: Text(
            'Categoria: ${Layout.categoriaPorId(id)['text']}',
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Layout.Light(),
                ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, int i) {
              return Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 20, 10),
                decoration: BoxDecoration(
                    color: Layout.Light(),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(2, 3),
                          color: Layout.Dark(.3)),
                    ]),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      child: Image.network(
                          'https://picsum.photos/id/${i + 50}/70/70.jpg'),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nome do produto'),
                          Text('R\$ 125,00',
                              style: TextStyle(
                                  fontSize: 18, color: Layout.primaryLight())),
                          Text(
                            'Um subitulo',
                            style: TextStyle(color: Layout.Dark(.6)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.angleDoubleRight),
                      onPressed: () {},
                    ),
                    SizedBox(width: 10)
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );

    return Layout.render(context, content);
  }
}
