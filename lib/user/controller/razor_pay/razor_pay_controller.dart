// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/common/secure_storage/flutter_securestorage.dart';
import 'package:bookingapp/theatreOwner/server_Side/common_Api_Call/api_call.dart';
import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:bookingapp/user/services/api_call_functions.dart/api_call_functions.dart';
import 'package:http/http.dart'as http;

import 'package:bookingapp/user/services/razorpay/razorpay_api_call.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/tickets_model/show_tickets_model.dart';
import '../login_And_Signpages/signup_and_otp.dart';

class RazorPayController extends ChangeNotifier{
 String bookingId='';
 ShowTicketModel? ticketsModal;
 bool isLoaded=true;
 bool ticketsAvailable=false;



 Future razorPayResponse(BuildContext context)async{
  
  final http.Response response;

  response=await RazorpayApi().razorpaymentApi(context);
  final status=jsonDecode(response.body)as Map<String,dynamic>;

    if (status["success"]==true) {
    bookingId =status["data"]["bookings"]["bookingId"];
    ticketsModal=ShowTicketModel.fromJson(status);
    isLoaded=false;
    ticketsAvailable=true;
    notifyListeners();

 }


}


 
//=======================================
// Razor pay cancelling order
//=======================================
 
 Future cancelOrderApi() async{

  final http.Response response;
  final uri=ApiConfiguration.cancelingorder;
  final id=ticketsModal!.data.bookings.id;
  final token=await storageUser();

try {
    response=await ApiFunctions.apiGetFunctionWithId(uri,id,token);

  if (response.statusCode==200) {
    ticketsAvailable=false;
    notifyListeners();

  }
} catch (e) {
  log(e.toString());
  
}
      
   
 }



 //=======================================
// setting page edit page api call
//=======================================
 
 Future editApiCall(BuildContext context,String editName,String editEmail,String editPhone)async{

  final http.Response response;

  final provider=Provider.of<LoginPageProvider>(context,listen: false);
  log(provider.userData!.data.id.toString());
  log(editName);
  log(editEmail);
  log(editPhone);
  final user={
    "_id":provider.userData!.data.id
  };
    String url=ApiConfiguration.userEdit;
   final Map<String,dynamic> body={
     "user":user,
     "editName":editName,
     "editEmail":editEmail,
     "editPhone":editPhone
   };
   log("oke");
   final token=await storageUser();
   log(token);

  response=await APiCallPage.apiPostCall(uri:url , body:body,token:token );
  final status=jsonDecode(response.body)as Map<String,dynamic>;

  if (status["success"]) {
    getError(status["message"], context);
    

  }else{
    log("somthing went wrong");
  }

 }


 



}
