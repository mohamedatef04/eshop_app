import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? image;

  const CategoryModel({this.id, this.name, this.description, this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    description: json['description'] ?? '',
    image: json['coverPictureUrl'] ?? '',
  );
  factory CategoryModel.placeHolder() {
    return const CategoryModel(
      id: '',
      name: '',
      description: '',
      image: '',
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    image,
  ];
}
