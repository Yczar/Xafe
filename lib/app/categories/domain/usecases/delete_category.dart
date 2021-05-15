import 'package:dartz/dartz.dart';
import 'package:xafe/app/categories/domain/repository/categories_repo.dart';
import 'package:xafe/core/error/failures.dart';

class DeleteCategory {
  DeleteCategory(this._repository);

  final CategoriesRepo _repository;

  Future<Either<Failure, void>> call(String categoryId) async =>
      await _repository.deleteCategory(categoryId);
}
