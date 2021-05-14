import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xafe/app/authentication/data/models/user_model.dart';
import 'package:xafe/core/error/failures.dart';

abstract class AuthenticationRepo {
  Future<Either<Failure, User>> loginUser(UserModel params);

  Future<Either<Failure, User>> registerUser(UserModel params);

  Future<Either<Failure, void>> createUser(UserModel params);

  Future<Either<Failure, UserModel>> getUser(String id);
}
