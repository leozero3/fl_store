import 'package:firebase_auth/firebase_auth.dart';

class UserController {

  final String teste = 'texto lololol';


  FirebaseUser user;

  void singOut() {
    FirebaseAuth.instance.signOut();
  }

}