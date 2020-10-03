import 'package:fl_store/controller/user_controller.dart';
import 'package:fl_store/view/home/home_page.dart';
import 'package:fl_store/view/layout.dart';
import 'package:fl_store/view/login/cadastro_page.dart';
import 'package:fl_store/view/login/login_recuperar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static String tag = '/loginPage';

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final Map<String, dynamic> _data = {};

  @override
  Widget build(BuildContext context) {

    var userControler = Provider.of<UserController>(context);

    return Scaffold(
      key: _scaffold,
      backgroundColor: Layout.secundary(),
      body: Form(
        key: _form,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/bg-image.png'),
                fit: BoxFit.cover,
              )),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 100, left: 40, right: 40, bottom: 20),
                  child: Image.asset('assets/images/logo-sem-fundo.png'),
                ),
                Expanded(
                    child: ListView(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Layout.Light(),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                spreadRadius: 2,
                                color: Layout.Dark(.4),
                                offset: Offset(0, 5))
                          ]),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Layout.primary()))),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Informe seu Email';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _data['email'] = value;
                              }),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Senha',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Layout.primary()))),
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Informe a senha';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _data['senha'] = value;
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(LoginRecuperarPage.tag),
                                child: Text(
                                  'Esqueci minha senha',
                                  style:
                                      TextStyle(color: Layout.secundaryDark()),
                                )),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: FlatButton(
                                onPressed: () async {
                                  if (_form.currentState.validate()) {
                                    _form.currentState.save();

                                    String error =
                                        await userControler.entrarPorEmailSenha(
                                      email: _data['email'],
                                      senha: _data['senha'],
                                    );

                                    if (error != null) {
                                      _scaffold.currentState.showSnackBar(
                                          SnackBar(content: Text(error)));
                                    } else {
                                      //mata toda navegação anterior e
                                      //substitui esse com a home page
                                      Navigator.of(context)
                                          .popUntil((route) => route.isFirst);
                                      Navigator.of(context)
                                          .pushReplacementNamed(HomePage.tag);
                                    }
                                  }
                                },
                                color: Layout.primary(),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                child: Text(
                                  'Entrar',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                        color: Layout.Light(),
                                        fontSize: 18,
                                      ),
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, right: 20),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                            onPressed: () => Navigator.of(context)
                                .pushNamed(CadastroPage.tag),
                            child: Text('Não tem uma conta? Cadastre-se')),
                      ),
                    )
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
