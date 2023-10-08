import 'package:flutter/material.dart';
import 'package:flutter_template/data/models/category.dart';
import 'package:flutter_template/usecases/home/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

class AddCategoryForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  AddCategoryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter category title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter category title';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter category name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter category name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter category description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter category description';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      GetIt.instance<HomeCubit>().addCategory(
                        Category(
                          const Uuid().v4(),
                          titleController.text,
                          nameController.text,
                          descriptionController.text,
                        ),
                      );
                      Navigator.of(context, rootNavigator: true).pop();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
