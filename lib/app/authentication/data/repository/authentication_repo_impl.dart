import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xafe/app/authentication/data/models/user_model.dart';
import 'package:xafe/app/authentication/domain/params/post_params/post_params.dart';
import 'package:xafe/app/authentication/domain/repository/authentication_repo.dart';
import 'package:xafe/core/error/failures.dart';
import 'package:xafe/core/error/helpers/helpers.dart';

class AuthenticationRepoImpl implements AuthenticationRepo {
  AuthenticationRepoImpl({
    this.authenticationDataSource,
  });

  final AuthenticationDataSource authenticationDataSource;

  @override
  Future<Either<Failure, User>> loginUser(EmailPasswordParams params) async {
    return successFailureInterceptor(
      () => authenticationDataSource.postLoginUser(params),
    );
  }

  @override
  Future<Either<Failure, User>> registerUser(EmailPasswordParams params) {
    return successFailureInterceptor(
      () => authenticationDataSource.postRegisterUser(params),
    );
  }

  @override
  Future<Either<Failure, void>> createUser(UserModel params) {
    return successFailureInterceptor(
      () => authenticationDataSource.postCreateUser(params),
    );
  }

  @override
  Future<Either<Failure, UserModel>> getUser(String id) {
    return successFailureInterceptor(
      () => authenticationDataSource.postGetUser(id),
    );
  }
}
