import 'package:bookingapp/user/View/loginPages/otpPage.dart';
import 'package:flutter/material.dart';

import '../../Model/loginAnd_SignUp/login_PageModel.dart';
import '../../services/otpSignup.dart';


class FuncionsPage1 extends ChangeNotifier{

  // navigateFunctions(BuildContext context,FuncionsPage1 providerpage){
    
  // }
    UserSighnUp? signUp;

    
      TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
   bool loading=false;
    
  Future <bool> otpChecking(BuildContext context)async{
    
    bool loading= await SignUp.otpSignUp(
      name: username.text , 
      email: email.text,
       phone: phone.text,
        password: password.text,
         cpassword:confirmPassword.text,
          signotp: otpController.text,
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