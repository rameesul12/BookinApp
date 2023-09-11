import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/common/secure_storage/flutter_securestorage.dart';
import 'package:bookingapp/user/services/api_call_functions.dart/api_call_functions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../Model/current_user/current_user_model.dart';
import '../../View/loginPages/otp_page.dart';
import '../../apiConfigurationclass/configuration.dart';

class LoginPageProvider with ChangeNotifier{

  CurrentUserModal? userData;

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

  //get current user

  Future currentUserGet() async{


    final http.Response response;
    String url=ApiConfiguration.getCurrentUser;
    final token=await storageUser();
    log(url);
  //  log(token);
  log("oke");


    response =await ApiFunctions.apiGetFunction(url, token);
    log(response.body);
    final status=jsonDecode(response.body)as Map<String,dynamic>;

  if (response.statusCode==200) {
    userData=CurrentUserModal.fromJson(status);
    log(userData.toString());
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
