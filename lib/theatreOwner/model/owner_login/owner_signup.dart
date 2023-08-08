
import 'package:json_annotation/json_annotation.dart';
part 'owner_signup.g.dart';

@JsonSerializable()
class OwnerLoginModel{

  String theatreName;
  String email;
  String licenceNumber;
  String phone;
  String location;
  String idProof;
  String password;
  String confirmPassword;
  String? status;

  OwnerLoginModel({
    required this.theatreName,
    required this.email,
    required this.licenceNumber,
    required this.phone,
    required this.location,
    required this.idProof,
    required this.password,
    required this.confirmPassword,
    this.status
  });

 factory OwnerLoginModel.fromJson(Map<String,dynamic>json)=>_$OwnerLoginModelFromJson(json);
 Map<String,dynamic>tojson()=>_$OwnerLoginModelToJson(this);

} 