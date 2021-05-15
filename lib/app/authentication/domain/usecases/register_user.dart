import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xafe/app/authentication/domain/params/post_params/post_params.dart';
import 'package:xafe/app/authentication/domain/repository/authentication_repo.dart';
import 'package:xafe/core/error/failures.dart';

class RegisterUser {
  RegisterUser(this._repository);
  final AuthenticationRepo _repository;

  Future<Either<Failure, User>> call(EmailPasswordParams params) async =>
      await _repository.registerUser(params);
}
