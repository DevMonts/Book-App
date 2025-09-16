import 'package:firebase_auth/firebase_auth.dart';

class AppException implements Exception {
  final String errorMessage;
  AppException(this.errorMessage);

  @override
  String toString() => errorMessage;
}

class AuthFirebaseException {
  static AppException authFirebaseException(
    dynamic e,
  ) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case "account-exists-with-different-credential":
          return AppException(
            'Conta existente com credenciais diferentes',
          );
        case "credential-already-in-use":
          return AppException(
            'Conta existente com credenciais diferentes',
          );
        case "email-already-in-use":
          return AppException(
            'Outra pessoa já está usando esse email',
          );
        case "internal-error":
          return AppException(
            'Erro interno. Entre em contato com o desenvolvedor: (75) 9 9954-2609',
          );
        case "invalid-credential":
          return AppException(
            'Credenciais inválidas',
          );
        case "invalid-email":
          return AppException(
            'Email inválido',
          );
        case "invalid-password":
          return AppException(
            'Senha inválida',
          );
        case "invalid-verification-code":
          return AppException(
            'Código de verificação inválido',
          );
        case "invalid-verification-id":
          return AppException(
            'ID de verificação inválido',
          );
        case "network-request-failed":
          return AppException(
            'Falha na conexão',
          );
        case "null-user":
          return AppException(
            'Usuário nulo',
          );
        case "operation-not-allowed":
          return AppException(
            'Erro: "operationNotAllowed". Entre em contato com o desenvolvedor: (75) 9 9954-2609',
          );
        case "requires-recent-login":
          return AppException(
            'Erro: "requiresRecentLogin". Entre em contato com o desenvolvedor: (75) 9 9954-2609',
          );
        case "too-many-requests":
          return AppException(
            'Tentativas excedidas',
          );
        case "user-disabled":
          return AppException(
            'Usuário desativado',
          );
        case "user-not-found":
          return AppException(
            'Usuário não encontrado',
          );
        case "weak-password":
          return AppException(
            'Senha fraca',
          );
        case "wrong-password":
          return AppException(
            'Senha errada',
          );
        case "user-token-expired":
          return AppException(
            'Usuário não encontrado',
          );
        case "user-cancelled-operation":
          return AppException(
            'Usuário não encontrado',
          );
        default:
          return AppException(
            'Conta existente com credenciais diferentes',
          );
      }
    }
    return AppException(
      'Erro',
    );
  }
}
