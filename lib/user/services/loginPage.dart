import 'dart:convert';
import 'dart:developer';

import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:http/http.dart' as http;



 Future loginFunction(String email,String password)async{
  final response=await http.post(
    Uri.parse(ApiConfiguration.baseUrl+ApiConfiguration.login),
    body: <String,dynamic>{
      'signEmail':email,
      'signPassword':password,
    }
    );
    if (response.statusCode == 200 ) {
    final  jsonresponse=jsonDecode(response.body);
    return jsonresponse;
    }else{
      log('somethin went wrong');
    }
}