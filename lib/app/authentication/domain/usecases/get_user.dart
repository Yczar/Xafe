import 'package:dartz/dartz.dart';
import 'package:xafe/app/authentication/data/models/user_model.dart';
import 'package:xafe/app/authentication/domain/repository/authentication_repo.dart';
import 'package:xafe/core/error/failures.dart';

class CreateUser {
  CreateUser(this._repository);

  final AuthenticationRepo _repository;

  Future<Either<Failure, UserModel>> call(String id) async =>
      await _repository.getUser(id);
}
