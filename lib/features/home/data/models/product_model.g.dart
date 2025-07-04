// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  json['slug'] as String,
  ProductCategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  json['creationAt'] as String,
  json['updatedAt'] as String,
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  price: (json['price'] as num).toDouble(),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'images': instance.images,
      'creationAt': instance.creationAt,
      'updatedAt': instance.updatedAt,
    };

ProductCategoryModel _$ProductCategoryModelFromJson(
  Map<String, dynamic> json,
) => ProductCategoryModel(
  json['slug'] as String,
  json['creationAt'] as String,
  json['updatedAt'] as String,
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$ProductCategoryModelToJson(
  ProductCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
  'creationAt': instance.creationAt,
  'updatedAt': instance.updatedAt,
};
