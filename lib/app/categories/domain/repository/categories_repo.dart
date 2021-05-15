import 'package:dartz/dartz.dart';
import 'package:xafe/app/categories/data/model/category_model.dart';
import 'package:xafe/core/error/failures.dart';

abstract class CategoriesRepo {
  Stream<List<CategoryModel>> listenToCategories({
    String uid,
  });

  Future<Either<Failure, void>> createCategory(CategoryModel params);

  Future<Either<Failure, void>> deleteCategory(String categoryId);
}
