

import 'dart:developer';

import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:http/http.dart'as http;

class ApiFunctions{

  static apiGetFunction(String uri,String token) async{

    final http.Response response;
     final String baseUrl=ApiConfiguration.baseUrl+uri;


    response =await http.get(Uri.parse(baseUrl),
     headers: {'Content-type': 'application/json;charset=utf-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
     }
    );

    return response;
  }

   static apiGetFunctionWithId(String uri,String id,String token) async{

    final http.Response response;
    log(uri);
     final String baseUrl=ApiConfiguration.baseUrl+uri;


    response =await http.get(Uri.parse("$baseUrl/$id"),
     headers: {'Content-type': 'application/json;charset=utf-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
     }
    );

    return response;
  }
}