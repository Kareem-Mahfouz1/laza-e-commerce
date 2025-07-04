import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;
  final String title;
  final String slug;
  final double price;
  final String description;
  final ProductCategoryModel category;
  final List<String> images;
  final String creationAt;
  final String updatedAt;

  ProductModel(
    this.slug,
    this.category,
    this.images,
    this.creationAt,
    this.updatedAt, {
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@JsonSerializable()
class ProductCategoryModel {
  final int id;
  final String name;
  final String slug;
  final String image;
  final String creationAt;
  final String updatedAt;

  ProductCategoryModel(
    this.slug,
    this.creationAt,
    this.updatedAt, {
    required this.id,
    required this.name,
    required this.image,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryModelFromJson(json);
}
