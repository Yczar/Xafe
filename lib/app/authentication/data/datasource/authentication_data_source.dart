import 'package:firebase_auth/firebase_auth.dart';
import 'package:xafe/app/authentication/data/models/user_model.dart';
import 'package:xafe/app/authentication/domain/params/post_params/post_params.dart';

abstract class AuthenticationDataSource {
  Future<User> postLoginUser(EmailPasswordParams params);

  Future<User> postRegisterUser(EmailPasswordParams params);

  Future<void> postCreateUser(UserModel params);

  Future<UserModel> postGetUser(String email);
}
