import 'package:firebase_auth/firebase_auth.dart';

class UserController {

  FirebaseUser user;

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
      user = auth.user;
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

}

  void singOut() {
    FirebaseAuth.instance.signOut();
  }

