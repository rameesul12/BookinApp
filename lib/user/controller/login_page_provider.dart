// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:bookingapp/user/dialogues/forget_password_dialogu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../services/user_Authentication/forget_password.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController userEmailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  final formKeys = GlobalKey<FormState>();

  bool isloading = true;

 //=============================
//userlogin
//=============================
  Future loginFunction(
      String email, String password, BuildContext context) async {
  FlutterSecureStorage secureStorage=const FlutterSecureStorage();

  

         Map payload={
          'loginEmail': email,
          'loginPassword': password,
        };
    final response = await http.post(
        Uri.parse(ApiConfiguration.baseUrl + ApiConfiguration.login),
        body: payload,
        encoding: Encoding.getByName('utf-8')
        );

        log(response.body);
        log('${response.statusCode}');
    if (response.statusCode == 200) {
      Map<String,dynamic>tokenSaver=jsonDecode(response.body);
      String token=tokenSaver['token'];
      secureStorage.write(key: "Token", value: token);
     // log("ram$token");
      
      
      isloading = false;
      notifyListeners();
      final jsonresponse = jsonDecode(response.body);
      return jsonresponse;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password or Email is incorrect ',style: TextStyle(color: Colors.red),)));
      log('somethin went wrong');
      getError("somthing went wrong Please check your Username Or Password", context);
    }
  }
//======================================
  Future<Widget> getLoading() async {
    return const Center(
      child: Column(
        children: [
          SpinKitPouringHourGlass(
            color: Colors.white,
            size: 50.0,
          ),
          Text(
            "Loading...",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

//========================================
//forget otp==========
//========================================

Future changingPassword(BuildContext context)async
{
  final provider=Provider.of<DialogueProvider>(context,listen: false);
 final http.Response response;
log("hooi");
try {
   response=await getOtp(context,provider.emailController.text);
   final status=jsonDecode(response.body);

if (response.statusCode==200) {
  getError("otp sended", context);
  notifyListeners();
}else{
  if (status["success"]==false) {
    
  getError("Please Check your Email",context);
  }
}
} catch (e) {
  log(e.toString());
}

}
//=========================
//otp and email sending to api
//=========================
Future  otpAndEmailPost(BuildContext context,String otp) async{
  final provider=Provider.of<DialogueProvider>(context,listen: false);

 final http.Response response;

 try {
  response=await postOtp(context,provider.emailController.text, otp);

   
   if (response.statusCode==200) {
     log("Ok");
    
   }else{
    log("api integeration failed");
  
   }

   
 } catch (e) {
   log(e.toString());
   return true;
 }
}
//*************************** */
//reset pssword
//*************************** */
 
 


}
