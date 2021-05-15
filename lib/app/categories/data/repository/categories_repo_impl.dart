import 'package:dartz/dartz.dart';
import 'package:xafe/app/categories/data/model/category_model.dart';
import 'package:xafe/app/categories/domain/repository/categories_repo.dart';
import 'package:xafe/core/error/failures.dart';

class CategoriesRepoImpl implements CategoriesRepo{
  @override
  Future<Either<Failure, void>> createCategory(CategoryModel params) {
    // TODO: implement createCategory
    throw UnimplementedError();
  }

  @override
  Stream<List<CategoryModel>> listenToCategories({String uid}) {
    // TODO: implement listenToCategories
    throw UnimplementedError();
  }

}