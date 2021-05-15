import 'package:firebase_auth/firebase_auth.dart';
import 'package:xafe/app/authentication/data/models/user_model.dart';
import 'package:xafe/app/authentication/domain/params/post_params/post_params.dart';
import 'package:xafe/core/config/firebase/firebase.dart';

import '../authentication_data_source.dart';

@override
class AuthenticationDataSourceImpl extends AuthenticationDataSource {
  AuthenticationDataSourceImpl(this.xafeAuthService, this.xafeFireStoreService);

  final XafeAuthService xafeAuthService;
  final XafeFireStoreService xafeFireStoreService;

  @override
  Future<void> postCreateUser(UserModel params) {
    final response = xafeFireStoreService.createDocument(
      collectionName: 'users',
      docId: params.id,
      data: params.toJson(),
    );
    return response;
  }

  @override
  Future<UserModel> postGetUser(String id) async {
    final response = await xafeFireStoreService.getDocument(
      collectionName: 'users',
      docId: id,
    );
    return UserModel.fromJson(response);
  }

  @override
  Future<User> postLoginUser(EmailPasswordParams params) {
    final response = xafeAuthService.loginWithEmail(
      email: params.email,
      password: params.password,
    );
    return response;
  }

  @override
  Future<User> postRegisterUser(EmailPasswordParams params) {
    final response = xafeAuthService.signUpWithEmail(
      email: params.email,
      password: params.password,
    );
    return response;
  }
}
