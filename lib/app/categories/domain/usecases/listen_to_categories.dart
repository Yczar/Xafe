import 'package:xafe/app/categories/data/model/category_model.dart';
import 'package:xafe/app/categories/domain/repository/categories_repo.dart';

class ListenToCategories {
  ListenToCategories(this._repo);

  final CategoriesRepo _repo;

  Stream<List<CategoryModel>> call({
    String uid,
  }) =>
      _repo.listenToCategories(
        uid: uid,
      );
}
