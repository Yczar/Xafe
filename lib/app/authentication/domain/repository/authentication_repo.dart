import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xafe/app/authentication/data/models/user_model.dart';
import 'package:xafe/app/authentication/domain/params/post_params/post_params.dart';
import 'package:xafe/core/error/failures.dart';

abstract class AuthenticationRepo {
  Future<Either<Failure, User>> loginUser(EmailPasswordParams params);

  Future<Either<Failure, User>> registerUser(EmailPasswordParams params);

  Future<Either<Failure, void>> createUser(UserModel params);

  Future<Either<Failure, UserModel>> getUser(String id);
}
