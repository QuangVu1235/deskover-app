
import 'package:json_annotation/json_annotation.dart';
part 'signin_reponse.g.dart';

@JsonSerializable()
class SigninReponse{
  @JsonKey(name: 'token')
  String? token;
}