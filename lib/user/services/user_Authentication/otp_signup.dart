import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/common/dialogues.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../View/homePage/home.dart';
import '../../apiConfigurationclass/configuration.dart';

class SignUp {




  //fumctions==========


  static Future otpSignUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String cpassword,
    required String signotp,
    required BuildContext context
  }) async {
    log(signotp);
    try {
       final response = await http.post(
      Uri.parse(ApiConfiguration.baseUrl + ApiConfiguration.signup),
       headers: {
         'Content-type': 'application/json;charset=utf-8',
         'Accept':'application/json',
       },
      body:jsonEncode(
        {
        "userSignup" : {
          "signName": name,
          "signEmail": email,
          "signPhone": phone,
          "signPassword": password,
          "signCPassword": cpassword,
        },
        "otp": signotp,
      }),
      encoding: Encoding.getByName('utf-8'),
    );
    final status=jsonDecode(response.body) as Map<String,dynamic>;
    log(response.body);
    log('${response.statusCode}');
      if (status["status"]==true) {
      // final jsonResponse = jsonDecode(response.body);
       // ignore: use_build_context_synchronously
       Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ));
      log('rameez $status');
      return status;
    } else {
      // ignore: use_build_context_synchronously
      getError("Incorrect Otp", context);
      throw Exception("Failed the process");
      
    }

    } catch (e) {
      log('$e');
  
    }
   
  
  }
    
}
