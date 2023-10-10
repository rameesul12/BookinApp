
import 'dart:convert';
import 'dart:developer';

import 'package:bookingapp/common/secure_storage/flutter_securestorage.dart';
import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http ;

class APiCallPage{



static Future apiGet({required url,required id,required BuildContext context})async{

  final String baseUrl=ApiConfiguration.baseUrl+url;
 String token=await storegeRead();
log(token);
final http.Response response;
 
 try {
   
response=await http.get(Uri.parse('$baseUrl/$id'),headers: {
  'Content-type': 'application/json;charset=utf-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
   
});
//log(response.body);
   return response;
 } catch (e) {
   log(e.toString());
 }


 
} 
static Future apiPost({required String uri,required Map<String,dynamic>body,})async{
 
 final String baseUrl=ApiConfiguration.baseUrl;
 String  token=await storegeRead();
 log(token);
 

 final http.Response response;

try {
  
   response=await http.post(Uri.parse(baseUrl+uri),
 headers: {
  'Content-type': 'application/json',
       'Accept': 'application/json',
       'Authorization':'Bearer $token'
      },
 body:jsonEncode(body),
 encoding: Encoding.getByName('utf-8')
   );   
log(response.body);
 return response;

} catch (e) {
  log(e.toString());
}

}


static Future apiPostCall({required String uri,required Map<String,dynamic>body,required String token})async{
 
 final String baseUrl=ApiConfiguration.baseUrl;

 
 

 final http.Response response;

try {
  
   response=await http.post(Uri.parse(baseUrl+uri),
 headers: {
  'Content-type': 'application/json',
       'Accept': 'application/json',
       'Authorization':'Bearer $token'
      },
 body:jsonEncode(body),
 encoding: Encoding.getByName('utf-8')
   );   
log(response.body);
 return response;

} catch (e) {
  log("error catch try");
  log(e.toString());
}

}

}