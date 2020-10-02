import 'package:fl_store/controller/user_controller.dart';
import 'package:fl_store/view/home/home_page.dart';
import 'package:fl_store/view/layout.dart';
import 'package:fl_store/view/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  static String tag = '/splash-page';

  @override
  Widget build(BuildContext context) {

    //recupera a instancia do controller
    var userController = Provider.of<UserController>(context);
    
    userController.checkIsLoggedIn().then((UserAuthStatus status) {
      
      Future.delayed(Duration(milliseconds: 2000), (){

        //mata todas as rotas anteriores
        Navigator.of(context).popUntil((route) => route.isFirst);

        if( status == UserAuthStatus.loggedIn){
          Navigator.of(context).popAndPushNamed(HomePage.tag);
        }else{
          Navigator.of(context).popAndPushNamed(LoginPage.tag);
        }
      });
      

    });
    
    return Scaffold(
      backgroundColor: Layout.secundary(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg-image.png'),
                  fit: BoxFit.cover,
                )),
          ),
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
