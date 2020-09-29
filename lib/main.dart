import 'package:fl_store/controller/user_controller.dart';
import 'package:fl_store/view/carrinho/carrinho_page.dart';
import 'package:fl_store/view/compras/compras_page.dart';
import 'package:fl_store/view/favoritos/favoritos_page.dart';
import 'package:fl_store/view/home/home_page.dart';
import 'package:fl_store/view/layout.dart';
import 'package:fl_store/view/login/cadastro_page.dart';
import 'package:fl_store/view/login/login_page.dart';
import 'package:fl_store/view/login/login_recuperar.dart';
import 'package:fl_store/view/perfil/perfil_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserController>(create: (_) => UserController(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'JosefinSans',
            primarySwatch: Colors.blue,
            accentColor: Layout.Light(),
            textTheme: TextTheme(
                headline6: TextStyle(shadows: [
              BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 2,
                  color: Layout.Dark(.3),
                  offset: Offset(1, 2)),
            ]))),
        initialRoute: LoginPage.tag,
        routes: {
          LoginPage.tag: (context) => LoginPage(),
          LoginRecuperarPage.tag: (context) => LoginRecuperarPage(),
          CadastroPage.tag: (context) => CadastroPage(),
          HomePage.tag: (context) => HomePage(),
          FavoritosPage.tag: (context) => FavoritosPage(),
          PerfilPage.tag: (context) => PerfilPage(),
          CarrinhoPage.tag: (context) => CarrinhoPage(),
          ComprasPage.tag: (context) => ComprasPage(),
        },
      ),
    );
  }
}
