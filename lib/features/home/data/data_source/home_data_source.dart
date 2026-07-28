import 'package:eshop_app/core/api/api_service.dart';
import 'package:eshop_app/core/api/endpoints.dart';
import 'package:eshop_app/features/home/data/models/category_model.dart';
import 'package:eshop_app/features/home/data/models/offer_model.dart';
import 'package:eshop_app/features/home/data/models/product_model.dart';

abstract class HomeDataSource {
  Future<List<OfferModel>> getOffers();
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProducts();
}

class HomeDataSourceImpl extends HomeDataSource {
  final ApiService apiService;
  HomeDataSourceImpl(this.apiService);
  @override
  Future<List<OfferModel>> getOffers() async {
    final response = await apiService.getRequest(
      endpoint: Endpoints.getOffers,
      queryParams: {"page": 1, "pageSize": 20},
    );
    final jsonData = response.data;
    final List<dynamic> offersJson = jsonData['offers']['items'] ?? [];
    if (offersJson.isEmpty) {
      return [];
    }
    return offersJson
        .map((offerJson) => OfferModel.fromJson(offerJson))
        .where((offer) => offer.image != null && offer.image!.endsWith('crop'))
        .toList();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final result = await apiService.getRequest(
      endpoint: Endpoints.getCategories,
    );
    final jsonData = result.data;
    final List<dynamic> categoriesJson = jsonData['categories'] ?? [];
    return categoriesJson
        .map((categoryJson) => CategoryModel.fromJson(categoryJson))
        .toList();
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final result = await apiService.getRequest(
      endpoint: Endpoints.getProducts,
      queryParams: {
        "searchTerm": "",
        "category": "",
        "minPrice": 0,
        "maxPrice": 10000,
        "isInStock": true,
        "sortBy": "date",
        "sortOrder": "asc",
        "page": 1,
        "pageSize": 20,
      },
    );
    final jsonData = result.data;
    final List<dynamic> productsJson = jsonData['items'] ?? [];
    return productsJson.map((e) => ProductModel.fromJson(e)).toList();
  }
}
