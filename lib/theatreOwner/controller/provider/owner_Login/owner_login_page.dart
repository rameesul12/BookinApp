

import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../view/homePage/dashboard.dart';

class OwnerLoginPageProvider extends ChangeNotifier{

   TextEditingController ownerName=TextEditingController();
     TextEditingController ownerPassword=TextEditingController();
     final formkey=GlobalKey<FormState>();

     Future ownerLoginRequest({
      required String email,
      required String password,
      required BuildContext context

     }) async{

     Map<String,dynamic> payload={
       "email":email,
        "password":password
     };
      
        
     try {
       final response=await http.post(Uri.parse(
        ApiConfiguration.baseUrl+ApiConfiguration.ownerLogin
      ),
      body:jsonEncode( payload
      ),
      encoding: Encoding.getByName('utf-8')
      
      );
log(response.body);
log('${response.statusCode}');
      if(response.statusCode==200){
        log("data ethi");
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomePage(),));
      }else{
        log("something Wrong");
      }
       
     } catch (e) {
       log(e.toString());
     }
      
     }
  
  
}