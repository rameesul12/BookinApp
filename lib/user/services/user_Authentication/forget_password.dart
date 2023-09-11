


// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../../../common/secure_storage/flutter_securestorage.dart';

//====================//====================
//get the value of otp from api
//====================//====================

Future getOtp(BuildContext context,String email  )async{
 // log("entho");
  // ignore: no_leading_underscores_for_local_identifiers
  final _token=await storegeRead();
  log("$_token");
   
final http.Response response;


response = await http.get(Uri.parse('${ApiConfiguration.baseUrl+ApiConfiguration.forgetPass}/$email'),
headers: {
   'Content-type': 'application/json;charset=utf-8',
         'Accept': 'application/json',
         'Authorization': 'Bearer $_token'

});
log(response.body);
return response;
}
//====================//====================
//post the value of otp to api
//====================//====================


Future postOtp(BuildContext context,String email,String otp)async{

final payload={
  "forgotEmail":email,
  "forgotOTP":otp
};
final http.Response response;

response=await http.post(Uri.parse(ApiConfiguration.baseUrl+ApiConfiguration.sendOtpEmail),
headers: {
  'Content-type': 'application/json;charset=utf-8',
         'Accept': 'application/json',
},
body: jsonEncode(payload),
encoding: Encoding.getByName('utf-8')
);

log(response.body);
return response;
}

Future resetPasswordPost( BuildContext context,String email,String password,String confirmPassword ) async{

final  payload={
  "forgotData":{
    "forgotEmail":email,
  "forPassword1":password,
  "forPassword2":confirmPassword}
};

final http.Response response;
try {
  response =await http.post(Uri.parse(ApiConfiguration.baseUrl+ApiConfiguration.resertPassword),
headers: {
  'Content-type': 'application/json;charset=utf-8',
         'Accept': 'application/json'
},
 body: jsonEncode(payload),
 encoding: Encoding.getByName("utf-8")
);
log(response.body);
final status=jsonDecode(response.body)as Map<String,dynamic>;
if (status["success"]==true) {
 
  getError("Password Changed", context);
  Navigator.pop(context);
  Navigator.pop(context);
}else{
  getError("please Check Password Or Email", context);
}
} catch (e) {
  log(e.toString());
}
 
}




