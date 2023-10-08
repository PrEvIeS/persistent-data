import 'package:flutter_template/data/models/category.dart';
import 'package:flutter_template/data/repositories/category_repository_interface.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CategoryRepository implements CategoryRepositoryInterface {
  late Box _categoryBox;

  CategoryRepository({required Box categoryBox}) {
    _categoryBox = categoryBox;
  }

  @override
  Future<Future<int>> addCategory(Category category) async {
    return _categoryBox.add(category);
  }

  @override
  List<Category> getCategories() {
    return _categoryBox.values.toList() as List<Category>;
  }

  @override
  Category getCategory(String key) {
    return _categoryBox.values.firstWhere((element) => element.id == key);
  }
}
