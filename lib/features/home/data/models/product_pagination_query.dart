import 'package:json_annotation/json_annotation.dart';
part 'product_pagination_query.g.dart';

@JsonSerializable()
class ProductPaginationQuery {
  final int offset;
  final int limit;

  ProductPaginationQuery({required this.offset, required this.limit});

  factory ProductPaginationQuery.fromJson(Map<String, dynamic> json) =>
      _$ProductPaginationQueryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPaginationQueryToJson(this);
}
