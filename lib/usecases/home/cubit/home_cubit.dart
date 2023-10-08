import 'package:flutter_template/data/models/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/data/repositories/category_repository_interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';

part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  CategoryRepositoryInterface categoryRepository;

  HomeCubit({required this.categoryRepository})
      : super(HomeState.initial(
          categories: categoryRepository.getCategories(),
        ));

  void addCategory(Category category) async {
    emit(const HomeState.loading());
    await categoryRepository.addCategory(category);
    emit(HomeState.initial(categories: categoryRepository.getCategories()));
  }
}
