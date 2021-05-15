import 'package:dartz/dartz.dart';
import 'package:xafe/app/categories/data/model/category_model.dart';
import 'package:xafe/app/categories/domain/repository/categories_repo.dart';
import 'package:xafe/core/error/failures.dart';

class CreateCategory {
  CreateCategory(this._repository);

  final CategoriesRepo _repository;

  Future<Either<Failure, void>> call(CategoryModel params) async =>
      await _repository.createCategory(params);
}
