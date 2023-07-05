import 'dart:convert';

import 'package:bookingapp/user/View/loginPages/sighnUp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../apiConfigurationclass/configuration.dart';
class LoginPageProvider with ChangeNotifier{

  Future createAccount({
  required  String username,
  required  String email,
  required  String phone,
  required  String password,
  required  String cpassword,
  }) async {
   

   // isLoading=true;
    final response = await http.post(
      Uri.parse(ApiConfiguration.baseUrl + ApiConfiguration.getOtp),
     
      body:{
      'signName': username,
      'signEmail': email,
      'signPhone': phone,
      'signPassword': password,
      'signCPassword': cpassword,
      },
    );
    notifyListeners();

    print('************');
    print(response.statusCode);
    
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      print(decodedResponse);
// isLoading=false;
      return decodedResponse;
    
    } else {
      throw Exception('Failed to create account');
    }
      
  }
  }



//   Future<void> postAll({
//     String? username,
//     String? email,
//     String? phone,
//     String? password,
//     String? cpassword,
//   }) async {
//     isLoading = true;
//     notifyListeners();

//     final response = await createAccount(
//       username: username,
//       email: email,
//       phone: phone,
//       password: password,
//       cpassword: cpassword,
//     );

//     users = response;

//     isLoading = false;
//     notifyListeners();
//   }
// }
