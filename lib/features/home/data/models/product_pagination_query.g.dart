// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_pagination_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPaginationQuery _$ProductPaginationQueryFromJson(
  Map<String, dynamic> json,
) => ProductPaginationQuery(
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
);

Map<String, dynamic> _$ProductPaginationQueryToJson(
  ProductPaginationQuery instance,
) => <String, dynamic>{'offset': instance.offset, 'limit': instance.limit};
