import 'package:equatable/equatable.dart';
import 'package:eshop_app/core/utils/safe_emit.dart';
import 'package:eshop_app/features/home/data/models/category_model.dart';
import 'package:eshop_app/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());
  final HomeRepo homeRepo;

  Future<void> fetchCategories() async {
    safeEmit(CategoriesLoading());
    final result = await homeRepo.getCategories();
    result.fold(
      (failure) =>
          safeEmit(CategoriesFailure(errMessage: failure.errorMessage)),
      (categories) => safeEmit(CategoriesSuccess(categories: categories)),
    );
  }
}
