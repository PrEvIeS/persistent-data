import 'package:flutter_template/data/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/constants/widget_keys.dart';
import 'package:flutter_template/generated/l10n.dart';
import 'package:flutter_template/usecases/category_detail/category_detail.dart';
import 'package:flutter_template/usecases/home/cubit/home_cubit.dart';
import 'package:flutter_template/widgets/add_category_form.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GetIt.instance<HomeCubit>(),
      child: Scaffold(
        key: const Key(WidgetKeys.homeScaffoldKey),
        appBar: AppBar(
          title: Text(S.of(context).home),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (BuildContext context, state) {
            return state.maybeMap(
              initial: (initState) {
                return initState.categories.isEmpty
                    ? const Text('isEmpty')
                    : ListView.separated(
                        padding: const EdgeInsets.all(8.0),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: initState.categories.length,
                        itemBuilder: (context, index) {
                          Category category = initState.categories[index];
                          return ListTile(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            title: Text(category.title),
                            onTap: () => GoRouter.of(context).pushNamed(
                              CategoryDetailPage.routeName,
                              pathParameters: {'categoryId': category.id},
                            ),
                          );
                        },
                      );
              },
              orElse: () => const Text('Failed'),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add new category',
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: AddCategoryForm(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
