import 'package:book_app/common/constants/app_strings.dart';
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
            AppStrings.accountExistsWithDifferentCredential,
          );
        case "credential-already-in-use":
          return AppException(
            AppStrings.credentialAlreadyInUse,
          );
        case "email-already-in-use":
          return AppException(
            AppStrings.emailAlreadyInUse,
          );
        case "internal-error":
          return AppException(
            AppStrings.internalError,
          );
        case "invalid-credential":
          return AppException(
            AppStrings.invalidCredential,
          );
        case "invalid-email":
          return AppException(
            AppStrings.invalidEmail,
          );
        case "invalid-password":
          return AppException(
            AppStrings.invalidPassword,
          );
        case "invalid-verification-code":
          return AppException(
            AppStrings.invalidVerificationCode,
          );
        case "invalid-verification-id":
          return AppException(
            AppStrings.invalidVerificationId,
          );
        case "network-request-failed":
          return AppException(
            AppStrings.networkRequestFailed,
          );
        case "null-user":
          return AppException(
            AppStrings.nullUser,
          );
        case "operation-not-allowed":
          return AppException(
            AppStrings.operationNotAllowed,
          );
        case "requires-recent-login":
          return AppException(
            AppStrings.requiresRecentLogin,
          );
        case "too-many-requests":
          return AppException(
            AppStrings.tooManyRequests,
          );
        case "user-disabled":
          return AppException(
            AppStrings.userDisabled,
          );
        case "user-not-found":
          return AppException(
            AppStrings.userNotFound,
          );
        case "weak-password":
          return AppException(
            AppStrings.weakPassword,
          );
        case "wrong-password":
          return AppException(
            AppStrings.wrongPassword,
          );
        case "user-token-expired":
          return AppException(
            AppStrings.userNotFound,
          );
        case "user-cancelled-operation":
          return AppException(
            AppStrings.userNotFound,
          );
        default:
          return AppException(
            AppStrings.accountExistsWithDifferentCredential,
          );
      }
    }
    return AppException(
      AppStrings.generalError,
    );
  }
}
