abstract class CategoriesRepo {
  Future<Either<Failure, User>> loginUser(EmailPasswordParams params);

  Future<Either<Failure, User>> registerUser(EmailPasswordParams params);

  Future<Either<Failure, void>> createUser(UserModel params);

  Future<Either<Failure, UserModel>> getUser(String id);
}
