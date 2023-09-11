// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSighnUp _$UserSighnUpFromJson(Map<String, dynamic> json) => UserSighnUp(
      signName: json['signName'] as String,
      signEmail: json['signEmail'] as String,
      signPhone: json['signPhone'] as String,
      signPassword: json['signPassword'] as String,
      signCPassword: json['signCPassword'] as String,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$UserSighnUpToJson(UserSighnUp instance) =>
    <String, dynamic>{
      'signName': instance.signName,
      'signEmail': instance.signEmail,
      'signPhone': instance.signPhone,
      'signPassword': instance.signPassword,
      'signCPassword': instance.signCPassword,
      'otp': instance.otp,
    };
