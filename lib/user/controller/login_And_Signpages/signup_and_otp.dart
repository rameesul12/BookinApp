import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/common/dialogues.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../View/loginPages/otpPage.dart';
import '../../apiConfigurationclass/configuration.dart';

class LoginPageProvider with ChangeNotifier{

  Future createAccount({
  required  String username,
  required  String email,
  required  String phone,
  required  String password,
  required  String cpassword,
  required BuildContext context
  }) async {
   

   // isLoading=true;
    try {
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

  log(response.body);
    final status=jsonDecode(response.body)as Map<String,dynamic>;
    if (response.statusCode == 200) {
    //  final decodedResponse = jsonDecode(response.body);
       // ignore: use_build_context_synchronously
       Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         const OtpVerificationPage()));
 
// isLoading=false;
    
    
    } else {
      if (status["userExist"]==true|| response.statusCode==201) {
        // ignore: use_build_context_synchronously
        getError("User Already Exist", context);
      }
    }
    } catch (e) {
      getError(e.toString(),context);
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
