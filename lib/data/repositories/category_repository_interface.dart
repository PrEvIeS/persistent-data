import 'package:flutter_template/data/models/category.dart';

abstract class CategoryRepositoryInterface {
  List<Category> getCategories();

  Future<Future<int>> addCategory(Category category);
  Category getCategory(String index);
}
