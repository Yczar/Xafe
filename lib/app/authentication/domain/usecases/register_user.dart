import 'package:dartz/dartz.dart';
import 'package:digicit_app/app/authentication/domain/params/post_params/post_params.dart';
import 'package:digicit_app/app/authentication/domain/repositories/authentication_repo.dart';
import 'package:digicit_app/core/error/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterUser {
  RegisterUser(this._repository);
  final AuthenticationRepo _repository;

  Future<Either<Failure, User>> call(EmailPasswordParams params) async =>
      await _repository.registerUser(params);
}
