import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../apiConfigurationclass/configuration.dart';

class SignUp {
  static Future otpSignUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String cpassword,
    required String signotp,
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
      log('$response');
    log('${response.statusCode}');
      if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
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
