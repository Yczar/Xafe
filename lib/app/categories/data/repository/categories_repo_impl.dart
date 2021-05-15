import 'package:dartz/dartz.dart';
import 'package:xafe/app/categories/data/datasource/categories_datasource.dart';
import 'package:xafe/app/categories/data/model/category_model.dart';
import 'package:xafe/app/categories/domain/repository/categories_repo.dart';
import 'package:xafe/core/error/failures.dart';
import 'package:xafe/core/error/helpers/helpers.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  CategoriesRepoImpl(this._categoriesDataSource);

  final CategoriesDataSource _categoriesDataSource;

  @override
  Future<Either<Failure, void>> createCategory(CategoryModel params) {
    return successFailureInterceptor(
      () => _categoriesDataSource.createCategory(params),
    );
  }

  @override
  Stream<List<CategoryModel>> listenToCategories({String uid}) {
    return _categoriesDataSource.listenToCategories(uid);
  }

}