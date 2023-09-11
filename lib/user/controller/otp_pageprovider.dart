// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/user/View/loginPages/otp_page.dart';
import 'package:bookingapp/user/services/user_Authentication/resend_otp.dart';
import 'package:flutter/material.dart';
import '../services/user_Authentication/otp_signup.dart';
import 'package:http/http.dart' as http;

class OtpPageProvider extends ChangeNotifier{

  // navigateFunctions(BuildContext context,FuncionsPage1 providerpage){
    
  // }
   

    
      TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
   bool loading=true;

    
  Future <bool> otpChecking(BuildContext context)async{
    
    bool loading= await SignUp.otpSignUp(
      name: username.text , 
      email: email.text,
       phone: phone.text,
        password: password.text,
         cpassword:confirmPassword.text,
          signotp: otpController.text, context: context,
          );
          notifyListeners();
          if (loading==true) {
            return true;
            
          }else{
            return false;
          }
  }


 Future otpResend(BuildContext context)async{

  final http.Response response;
  try {
    
   response=await resendOtp(context, email.text);
   final status=jsonDecode(response.body) as Map<String,dynamic>;
  
   if (status["status"]==true) {
     getError("OTP Sended", context);
   }else{
    log("api function not ready");
   }
  } catch (e) {
    log(e.toString());
    getError(e.toString(), context);
  }

  
 }
  
   

  
  //  Future<bool> loginChecking() async{

  //   //bool loading=

  //  }

 

}