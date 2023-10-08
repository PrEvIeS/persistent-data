import 'package:flutter/material.dart';
import 'package:flutter_template/data/models/category.dart';
import 'package:flutter_template/data/repositories/category_repository_interface.dart';
import 'package:get_it/get_it.dart';

class CategoryDetailPage extends StatelessWidget {
  final String categoryId;
  static const String routeName = '/category';

  const CategoryDetailPage({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    Category category =
        GetIt.instance<CategoryRepositoryInterface>().getCategory(categoryId);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(category.title),
      ),
      body: Column(
        children: [
          Text(
            category.name,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Text(category.description),
        ],
      ),
    );
  }
}
