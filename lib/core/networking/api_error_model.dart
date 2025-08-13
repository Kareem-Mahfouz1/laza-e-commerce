import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  @JsonKey(fromJson: _messageFromJson, toJson: _messageToJson)
  final String? message;
  final int? statusCode;
  ApiErrorModel({this.message, this.statusCode});
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  static String? _messageFromJson(dynamic value) {
    if (value == null) return 'Unknown error occurred';
    if (value is String) return value;
    if (value is List) {
      return value.join('\n');
    }
    return value.toString();
  }

  static dynamic _messageToJson(String? value) => value;
}
