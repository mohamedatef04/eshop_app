import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eshop_app/core/errors/failures.dart';
import 'package:eshop_app/features/home/data/data_source/home_data_source.dart';
import 'package:eshop_app/features/home/data/models/category_model.dart';
import 'package:eshop_app/features/home/data/models/offer_model.dart';
import 'package:eshop_app/features/home/data/models/product_model.dart';

class HomeRepo {
  final HomeDataSource homeDataSource;
  HomeRepo(this.homeDataSource);

  Future<Either<Failures, List<OfferModel>>> getOffers() async {
    try {
      final result = await homeDataSource.getOffers();
      return right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  Future<Either<Failures, List<CategoryModel>>> getCategories() async {
    try {
      final result = await homeDataSource.getCategories();
      return right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  Future<Either<Failures, List<ProductModel>>> getProducts(
    String? searchItem,
    String? category,
  ) async {
    try {
      final result = await homeDataSource.getProducts(
        searchTerm: searchItem,
        category: category,
      );
      return right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
