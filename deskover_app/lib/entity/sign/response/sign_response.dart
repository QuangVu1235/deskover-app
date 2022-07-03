import 'package:json_annotation/json_annotation.dart';

part 'sign_response.g.dart';

@JsonSerializable()
class SigninResponses {

  SigninResponses();

  @JsonKey(name: 'token')
  String? token;

  factory SigninResponses.fromJson(Map<String, dynamic> json) =>
      _$SigninResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$SigninResponsesToJson(this);
}