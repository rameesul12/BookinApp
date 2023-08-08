// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/common/secure_storage/flutter_securestorage.dart';
import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

Future getOwnerDetails(BuildContext context) async{
 // FlutterSecureStorage secureStorage=FlutterSecureStorage();
  final storage=await storegeRead();

 

  final http.Response response;

 try {
   if (storage != null ) {
      response=await http.get(Uri.parse(ApiConfiguration.baseUrl+ApiConfiguration.getCurrentOwner),
  
  headers: {
    'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $storage'
  });

  return response;
   }else{
    log("token is inavallid");
   }
 } catch (e) {
   getError(e.toString(), context);
 }
}