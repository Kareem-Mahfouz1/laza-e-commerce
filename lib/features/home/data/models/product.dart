import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String title;
  final String slug;
  final double price;
  final String description;
  final ItemCategorey category;
  final List<String> images;
  final String creationAt;
  final String updatedAt;

  Product(
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

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@JsonSerializable()
class ItemCategorey {
  final int id;
  final String name;
  final String slug;
  final String image;
  final String creationAt;
  final String updatedAt;

  ItemCategorey(
    this.slug,
    this.creationAt,
    this.updatedAt, {
    required this.id,
    required this.name,
    required this.image,
  });

  factory ItemCategorey.fromJson(Map<String, dynamic> json) =>
      _$ItemCategoreyFromJson(json);
}
