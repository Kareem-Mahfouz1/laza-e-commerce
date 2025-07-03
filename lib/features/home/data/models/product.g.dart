// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  json['slug'] as String,
  ItemCategorey.fromJson(json['category'] as Map<String, dynamic>),
  (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  json['creationAt'] as String,
  json['updatedAt'] as String,
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  price: (json['price'] as num).toDouble(),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
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

ItemCategorey _$ItemCategoreyFromJson(Map<String, dynamic> json) =>
    ItemCategorey(
      json['slug'] as String,
      json['creationAt'] as String,
      json['updatedAt'] as String,
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ItemCategoreyToJson(ItemCategorey instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'creationAt': instance.creationAt,
      'updatedAt': instance.updatedAt,
    };
