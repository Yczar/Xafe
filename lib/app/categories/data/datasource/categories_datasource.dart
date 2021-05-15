import 'package:xafe/app/categories/data/model/category_model.dart';

abstract class CategoriesDataSource {
  Future<void> createCategory(CategoryModel params);

  Stream<List<CategoryModel>> listenToCategories(String uId);
}