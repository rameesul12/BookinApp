// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:http/http.dart' as http;




class OwnerSignUpProvider extends ChangeNotifier{

 TextEditingController theatreName = TextEditingController();
    TextEditingController ownerEmail = TextEditingController();
     TextEditingController licenceNumber = TextEditingController();
      TextEditingController phone = TextEditingController();
       TextEditingController adharNumber= TextEditingController();
     TextEditingController place=TextEditingController();
     String? location;
    TextEditingController ownerPassword = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    

    final formkey=GlobalKey<FormState>();


    Future ownerSignUp({
      required String theatrename,
      required String owneremail,
      required String licence,
      required String phone,
      required String adharNumber,
      required String location,
      required String password,
      required String confirmPassword,
     required BuildContext context

    }) async{
// bool isLoading=true;
  
   try {
     final response=await http.post(Uri.parse(ApiConfiguration.baseUrl+ApiConfiguration.ownerSignUp),
   body: {
    "Name":theatrename,
    "Email":owneremail,
    "Adhaar":adharNumber,
    "Licence":licence,
    "Location":location,
    "Phone":phone,
    "Password":password
   }
   );
   final status=jsonDecode(response.body) as Map<String,dynamic>;
   log('$response');
   log('${response.statusCode}');
   if (status["Approved"]=='Approved'){
     getError("Admin approved your account", context);
   }
   if (response. statusCode==200) {
     
    //  isLoading=false;
     notifyListeners();

   }else{

    log("api not completed");
   }
   } catch (e) {
    log("$e");
     
   }



    }



}