import 'package:appwrite/appwrite.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:appwrite/models.dart' as model;

abstract class IAuthAPI {
  FutureEither<Account> signUp({
    required String email,
    required String password,
  });
}

class AuthField implements IAuthAPI {
  //This is so the account instanc is not availible outside clase
  //Unique accounts
  final Account _account;
  AuthField({required Account account}) : _account = account;
  @override
  FutureEither<model.User> signUp(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
        userId: 'unique()',
        email: email,
        password: password,
      );
      return right(account);
    } catch (e,stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
