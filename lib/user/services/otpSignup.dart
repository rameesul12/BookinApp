import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../View/homePage/home.dart';
import '../apiConfigurationclass/configuration.dart';

class SignUp {
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
         'Accept': 'application/json',
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
    log('rameese moonji${response.body}');
    log('${response.statusCode}');
      if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
       Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ));
      log('rameez $jsonResponse');
      return jsonResponse;
    } else {
      throw Exception("Failed the process");
    }

    } catch (e) {
      log('$e');
  
    }
   
  
  }
    
}
