


import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future resendOtp(BuildContext context,String email)async{

final http.Response response;

response=await http.post(Uri.parse(ApiConfiguration.baseUrl+ApiConfiguration.resendOtp),
body: {
  "signEmail":email
}
);

return response;

}