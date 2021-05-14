import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xafe/app/authentication/data/models/user_model.dart';
import 'package:xafe/app/authentication/domain/repository/authentication_repo.dart';
import 'package:xafe/core/error/failures.dart';

class LoginUser {
  LoginUser(this._repository);

  final AuthenticationRepo _repository;

  Future<Either<Failure, User>> call(UserModel params) async =>
      await _repository.loginUser(params);
}
