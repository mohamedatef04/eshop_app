import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String? id;
  final String? productCode;
  final String? arName;
  final String? arDescription;
  final String? enName;
  final String? enDescription;
  final String? image;
  final String? color;
  final String? category;
  final String? sellerId;
  final double? price;
  final double? weight;
  final num? rating;
  final int? stock;
  final int? discountPercentage;
  final int? reviewCount;

  const ProductModel({
    this.id,
    this.productCode,
    this.arName,
    this.arDescription,
    this.enName,
    this.enDescription,
    this.image,
    this.color,
    this.category,
    this.sellerId,
    this.price,
    this.weight,
    this.stock,
    this.discountPercentage,
    this.rating,
    this.reviewCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'] ?? '',
    productCode: json['productCode'] ?? '',
    arName: json['arabicName'] ?? '',
    arDescription: json['arabicDescription'] ?? '',
    enName: json['name'] ?? '',
    enDescription: json['description'] ?? '',
    image: json['coverPictureUrl'] ?? '',
    color: json['color'] ?? '',
    category: json["categories"] == null || json["categories"].isEmpty
        ? ""
        : json["categories"][0],

    sellerId: json['sellerId'] ?? '',
    price: json['price'] ?? 0.0,
    weight: json['weight'] ?? 0.0,
    stock: json['stock'] ?? 0,
    discountPercentage: json['discountPercentage'] ?? 0,
    rating: json['rating'] ?? 0.0,
    reviewCount: json['reviewsCount'] ?? 0,
  );
  factory ProductModel.placeHolder() {
    return const ProductModel(
      id: '',
      productCode: '',
      arName: '',
      arDescription: '',
      enName: '',
      enDescription: '',
      image: '',
      color: '',
      category: '',
      sellerId: '',
      price: 0.0,
      weight: 0.0,
      stock: 0,
      discountPercentage: 0,
      rating: 0.0,
      reviewCount: 0,
    );
  }

  @override
  List<Object?> get props => [
    id,
    productCode,
    arName,
    arDescription,
    enName,
    enDescription,
    image,
    color,
    category,
    sellerId,
    price,
    weight,
    stock,
    discountPercentage,
    rating,
    reviewCount,
  ];
}
