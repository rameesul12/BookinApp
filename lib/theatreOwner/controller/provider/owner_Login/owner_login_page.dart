

import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../../view/homePage/dashboard.dart';

class OwnerLoginPageProvider extends ChangeNotifier{

   TextEditingController ownerName=TextEditingController();
     TextEditingController ownerPassword=TextEditingController();
     final formkey=GlobalKey<FormState>();

     FlutterSecureStorage secureStorage=const FlutterSecureStorage();
    // final token= storegeRead(secureStorage);

     Future ownerLoginRequest({
      required String email,
      required String password,
      required BuildContext context

     }) async{

     Map<String,dynamic> payload={
       "email":email,
        "password":password
     };
      
        
     try {
       final response=await http.post(Uri.parse(
        ApiConfiguration.baseUrl+ApiConfiguration.ownerLogin
      ),
      body: payload,
      
      encoding: Encoding.getByName('utf-8')
      
      );
  Map<String,dynamic>tokenSaver=jsonDecode(response.body);
  log(tokenSaver.toString());
  String  token=tokenSaver["token"];
  log(token);
  secureStorage.write(key: "token", value: token);
log(response.body);
log('${response.statusCode}');
final status=jsonDecode(response.body) as Map<String,dynamic>;

   if(response.statusCode==200){
        log("data ethi");
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const HomePage(),));
      }else{
        
  if (status.containsKey("noUser")) {
    // ignore: use_build_context_synchronously
    getError("User Doesnt existing", context);
  }else if(status['incPass']==true){
    // ignore: use_build_context_synchronously
    getError("Wrong Email or Password", context);
        log("something Wrong");
      }
      }
     } catch (e) {
       getError(e.toString(), context);
     }
      
     }
  
  
}