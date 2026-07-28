import 'package:equatable/equatable.dart';

class OfferModel extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? image;

  const OfferModel({this.id, this.name, this.description, this.image});

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    description: json['description'] ?? '',
    image: json['coverUrl'] ?? '',
  );
  factory OfferModel.placeHolder() {
    return const OfferModel(
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
