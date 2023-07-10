// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_signup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerLoginModel _$OwnerLoginModelFromJson(Map<String, dynamic> json) =>
    OwnerLoginModel(
      theatreName: json['theatreName'] as String,
      email: json['email'] as String,
      licenceNumber: json['licenceNumber'] as String,
      phone: json['phone'] as String,
      location: json['location'] as String,
      idProof: json['idProof'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$OwnerLoginModelToJson(OwnerLoginModel instance) =>
    <String, dynamic>{
      'theatreName': instance.theatreName,
      'email': instance.email,
      'licenceNumber': instance.licenceNumber,
      'phone': instance.phone,
      'location': instance.location,
      'idProof': instance.idProof,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
