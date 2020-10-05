import 'package:firebase_auth/firebase_auth.dart';

enum UserAuthStatus { waiting, loggedIn, loggedOut }

class UserController {
  FirebaseUser user;
  UserAuthStatus status = UserAuthStatus.waiting;

  Future<UserAuthStatus> checkIsLoggedIn() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await setUser(firebaseUser);

    return status;
  }

  Future setUser(FirebaseUser firebaseUser) async {
    user = firebaseUser;

    status = UserAuthStatus.loggedOut;
    if (user != null) {
      status = UserAuthStatus.loggedIn;
    }
  }

  Future<String> entrarPorEmailSenha({String email, String senha}) async {
    String msg;
    try {
      var auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );

      setUser(auth.user);
    } catch (e) {
      msg = 'Erro desconhecido, tente novamente';

      if (e.code != null) {
        switch (e.code) {
          case 'ERROR_INVALID_EMAIL':
            msg = 'Este email é inválido';
            break;
          case 'ERROR_WRONG_PASSWORD':
            msg = 'A senha não está correta';
            break;
          case 'ERROR_USER_NOT_FOUND':
            msg = 'Usuário não encontrado';
            break;
          case 'ERROR_USER_DISABLED':
            msg = 'Usuário não está habilitado a acessar o sistema';
            break;
          case 'ERROR_TOO_MANY_REQUESTS':
            msg = 'Muitas requisições em pouco tempo';
            break;
          case 'ERROR_OPERATION_NOT_ALLOWED':
            msg = 'Isso não é permitido';
            break;
        }
      }
    }

    return msg;
  }

  Future<String> criarContaPorEmailSenha(
      {String nome, String email, String senha}) async {
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

  Future<String> recuperarSenhaPorEmail(String email) async {
    String msg;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      msg = 'Erro desconhecido, tente novamente';

      if (e.code != null) {
        switch (e.code) {
          case 'ERROR_INVALID_EMAIL':
            msg = 'informe um Email válido';
            break;
          case 'ERROR_USER_NOT_FOUND':
            msg = 'Usuário não encontrado';
            break;
        }
      }
    }
  }

  void singOut() {
    FirebaseAuth.instance.signOut();
  }
}
