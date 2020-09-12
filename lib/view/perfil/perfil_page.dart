import 'package:fl_store/view/layout.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  static String tag = '/perfil-page';

  @override
  Widget build(BuildContext context) {
    var container = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Editar perfil',
            style: Theme.of(context).textTheme.headline6.copyWith(
              color: Layout.Light(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Layout.Light(),
            ),
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Nome',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Layout.primary(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Layout.primary(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Endereço de entrega',
                  style: Theme.of(context).textTheme.caption.copyWith(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'CEP',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Layout.primary(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Rua',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Layout.primary(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Número',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Layout.primary(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Complemento',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Layout.primary(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Bairro',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Layout.primary(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Cidade',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Layout.primary(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Estado',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Layout.primary(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: FlatButton(
              onPressed: () => null,
              color: Layout.primary(),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: Text(
                'Salvar',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Layout.Light(),
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );

    return Layout.render(context, container);
  }
}
