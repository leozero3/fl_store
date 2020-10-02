import 'package:firebase_auth/firebase_auth.dart';

enum  UserAuthStatus { waiting, loggedIn, loggedOut}

class UserController {
  FirebaseUser user;
  UserAuthStatus status = UserAuthStatus.waiting;

  Future<UserAuthStatus>checkIsLoggedIn() async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await setUser(firebaseUser);

    return status;
  }

  Future setUser(FirebaseUser firebaseUser) async {
    user = firebaseUser;

    status = UserAuthStatus.loggedOut;
    if (user != null){
      status = UserAuthStatus.loggedIn;
    }
  }

  Future<String> criarContaPorEmailSenha(String nome, String email, String senha) async {
    String msg;
    try {
      // Criamos o usuario diretamente la no firebase
      var auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      var updateInfo = UserUpdateInfo();
      updateInfo.displayName = nome;

      // Adicionamos a ele o nome de exibicao
      await auth.user.updateProfile(updateInfo);

      // Envia email para usuario confirmar
      await auth.user.sendEmailVerification();

      // Atribui ao objeto os dados de login dele
      setUser(auth.user);
      //
    } catch (e) {
      msg = 'Erro desconhecido, tente novamente';

      if (e.code != null) {
        switch (e.code) {
          case 'ERROR_WEAK_PASSWORD':
            msg = 'Senha muito fraca';
            break;
          case 'ERROR_INVALID_EMAIL':
            msg = 'Email inválido';
            break;
          case 'ERROR_EMAIL_ALREADY_IN_USE':
            msg = 'Este email já está em uso';
            break;
        }
      }
    }
    return msg;
  }
  void singOut() {
    FirebaseAuth.instance.signOut();
  }
}