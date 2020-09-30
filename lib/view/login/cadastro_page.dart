import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_store/controller/user_controller.dart';
import 'package:fl_store/view/layout.dart';
import 'package:fl_store/view/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CadastroPage extends StatelessWidget {
  static String tag = '/cadastroPage';

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _senha = TextEditingController();

  final Map<String, dynamic> _data = {};

  @override
  Widget build(BuildContext context) {
    var userController = Provider.of<UserController>(context);

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
                          ///------------------------------------------------------------------------
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Nome',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Layout.primary()))),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Campo obrigatorio';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _data['nome'] = value;
                            },
                          ),

                          ///------------------------------------------------------------------------
                          SizedBox(height: 20),

                          ///------------------------------------------------------------------------
                          TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Layout.primary()))),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Campo obrigatorio';
                                } else if (!value.contains('@')) {
                                  return 'Preencha com um email Válido';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _data['email'] = value;
                              }),
                          SizedBox(height: 20),

                          ///------------------------------------------------------------------------
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Senha',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Layout.primary()))),
                            controller: _senha,
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Campo obrigatorio';
                              } else if (value.length < 6) {
                                return 'minimo de 6 caracteres';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _data['senha'] = value;
                            },
                          ),

                          ///------------------------------------------------------------------------
                          SizedBox(height: 20),

                          ///------------------------------------------------------------------------
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Confirmar Senha',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Layout.primary()))),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Campo obrigatorio';
                              } else if (value != _senha.text) {
                                return 'As senhas não são iguais';
                              }
                              return null;
                            },
                          ),

                          ///------------------------------------------------------------------------
                          SizedBox(height: 20),

                          ///------------------------------------------------------------------------
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: FlatButton(
                                onPressed: () async {
                                  if (_form.currentState.validate()) {
                                    // Ao salvar os dados do formulario ficarao
                                    // retidos em _data automaticamente
                                    _form.currentState.save();

                                    String error = await userController.criarContaPorEmailSenha(
                                      _data['nome'],
                                      _data['email'],
                                      _data[_senha],
                                    );
                                    if (error != null) {
                                      _scaffold.currentState.showSnackBar(
                                        SnackBar(content: Text(error)),
                                      );
                                      return;
                                    }
                                    //se até aqui nao deu nenhum erro
                                    //é por que deu tudo certo
                                    //joga ele para a pagina de login
                                    Navigator.of(context).pushReplacementNamed(LoginPage.tag);
                                  }
                                },
                                color: Layout.primary(),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                child: Text(
                                  'Criar Conta',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                        color: Layout.Light(),
                                        fontSize: 18,
                                      ),
                                ),),
                          ),

                          ///------------------------------------------------------------------------
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, right: 20),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                            onPressed: () =>
                                Navigator.of(context).pushNamed(LoginPage.tag),
                            child: Text('Fazer login')),
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

  criarConta(BuildContext context) async {}
}
