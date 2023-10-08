part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial({@Default([]) List<Category> categories}) = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success() = _Success;
  const factory HomeState.addCategory({required Category category}) = _AddCategory;
}
