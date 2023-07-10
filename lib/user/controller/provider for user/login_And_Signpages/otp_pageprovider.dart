import 'package:bookingapp/user/View/loginPages/otpPage.dart';
import 'package:flutter/material.dart';
import '../../../services/otpSignup.dart';


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
  
   

  
  //  Future<bool> loginChecking() async{

  //   //bool loading=

  //  }

 

}