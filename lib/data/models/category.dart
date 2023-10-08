import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 1,adapterName: 'CategoryAdapter')
class Category extends HiveObject {
  @HiveField(0, defaultValue: '')
  String id;

  @HiveField(1)
  String title;

  @HiveField(2, defaultValue: '')
  String name;

  @HiveField(3, defaultValue: '')
  String description;

  Category(this.id, this.title, this.name, this.description);
}
