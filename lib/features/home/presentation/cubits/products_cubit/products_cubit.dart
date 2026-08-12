import 'package:equatable/equatable.dart';
import 'package:eshop_app/core/utils/safe_emit.dart';
import 'package:eshop_app/features/home/data/models/product_model.dart';
import 'package:eshop_app/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.homeRepo) : super(ProductsInitial());
  final HomeRepo homeRepo;

  Future<void> fetchProducts({String? searchItem, String? category}) async {
    safeEmit(ProductsLoading());
    final result = await homeRepo.getProducts(searchItem, category);
    result.fold(
      (failure) => safeEmit(ProductsFailure(errMessage: failure.errorMessage)),
      (products) {
        if (products.isEmpty) {
          safeEmit(ProductsEmptyState());
        } else {
          safeEmit(ProductsSuccess(products: products));
        }
      },
    );
  }
}
