import 'package:json_annotation/json_annotation.dart';
part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String name;
  final String email;
  final String password;
  final String avatar;
  SignupRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
  });
  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
