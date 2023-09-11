

import 'package:json_annotation/json_annotation.dart';
  part 'login_page_model.g.dart';

@JsonSerializable()
class UserSighnUp  {
  String signName;
  String signEmail;
  String signPhone;
  String signPassword;
  String signCPassword;
  String? otp;
  UserSighnUp(
      {required this.signName,
      required this.signEmail,
      required this.signPhone,
      required this.signPassword,
      required this.signCPassword,
      this.otp
      });
 factory UserSighnUp.fromJson(Map<String,dynamic>json)=> _$UserSighnUpFromJson(json);
 Map<String,dynamic>tojson() =>_$UserSighnUpToJson(this);
}
