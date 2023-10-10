

// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/theatreOwner/server_Side/common_Api_Call/api_call.dart';
import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../model/screen_Adding/screen_adding.dart';
import '../../../server_Side/get_owner_details.dart';


class AddScreenProvider extends ChangeNotifier{
   
TextEditingController screenController=TextEditingController();

TextEditingController rowController=TextEditingController();
TextEditingController columnController=TextEditingController();
Map<String,dynamic>? currentOwner;
List<ScreenDeatails>screenInfo=[];
ScreenDeatails ? details;
List<String>screens=[];


  getCurrentOwner(BuildContext context)async{
    final http.Response response;

     response=await getOwnerDetails(context);

    if(response.statusCode==200){
      Map<String,dynamic>owner;
      owner=jsonDecode(response.body) as Map<String,dynamic>;
       currentOwner=owner["data"] ;
      notifyListeners();
    log("book my show$currentOwner");

      //  currentOwner;
    }else{
log("somthing went wrong in api");
    }
  }

Future  addScreenPost(BuildContext context) async{
  String screen=screenController.text;
  String row=rowController.text;
  String column=columnController.text;
  String postUri=ApiConfiguration.postScreen;
  final ownerId=currentOwner!["_id"];
 // log(ownerId);
  // log("====");
   Map<String,dynamic> payload={
     
     "owner":{"_id":ownerId},
     "screen":screen,
     "rows":row,
     "columns":column 
   };

 if (ownerId!=null) {
   
 final http.Response response;
 response=await APiCallPage.apiPost(uri:postUri , body:payload);
 final status=jsonDecode(response.body)as Map<String,dynamic>;
log("rameez");

 log(status.toString());
 if ( status['success']==true ) {
  
 //  String message=status["message"];
  // getError(message, context);
   notifyListeners();
 }else{
   String message=status["message"];
   getError(message, context);
 }
 }else{
   getError("please check the field is empty", context);
 }

}

 Future<void> getScreen(BuildContext context) async {
  try {
    //log('Fetching screen data...');
    String getScreen = ApiConfiguration.getScreen;
    final http.Response response;
    final ownerId = currentOwner!["_id"];

    response = await APiCallPage.apiGet(url: getScreen, id: ownerId, context: context);
    final status = jsonDecode(response.body) as Map<String, dynamic>;
   // log("screen response=${response.body}");
      screenInfo.clear();
    if (status["success"] == true) {
      // Clear the list before adding new data
       // screens=status["data"]["screen"] as List;
        
      AddingScreen addingScreen = AddingScreen.fromJson(status);
      screenInfo.addAll(addingScreen.data);
     // log(screenInfo.toString());
    //  screenFetching();
      notifyListeners();
      log("Screen data fetched successfully.");
    } else {
      String message = status["message"];
      getError(message, context);
    }
  } catch (e) {
    log("Error while fetching screen data: $e");
    getError("An error occurred while fetching screen data.", context);
  }
}

// screenFetching(){

//  for (var data in screenInfo) {
//    screens.add(data.screen.toString());

//    final List<String>list=screens.map((dynamic items) =>items as String ).toList();

//  }
//  log(screens.toString());
//  notifyListeners();

// }

Future<void> screenDeleting(String id, int index, BuildContext context) async {
  try {
    String deleteScreen = ApiConfiguration.deleteScreen;
    Map<String, dynamic> payload = {
      "screenId": id,
    };

    final http.Response response = await APiCallPage.apiPost(uri: deleteScreen, body: payload);
    final status = jsonDecode(response.body) as Map<String, dynamic>;

    if (status["success"] == true) {
      if (index >= 0 && index < screenInfo.length) {
        screenInfo.removeAt(index);
        notifyListeners();
      } else {
        log("Invalid index: $index");
      }
      log(response.body);
      String message = status["message"];
      Navigator.pop(context);
      getError(message, context);
    } else {
      String message = status["message"];
      getError(message, context);
    }

    log(response.body);
    log("success");
  } catch (e) {
    log("Error while deleting screen: $e");
    getError("An error occurred while deleting the screen.", context);
  }
}


Future editScreen(BuildContext context,int index)async{

  // ignore: non_constant_identifier_names
  String Screen=screenController.text;
  String row=rowController.text;
  String column=columnController.text;

  String message;
  http.Response response;
String editingScreen=ApiConfiguration.editScreen;
log(currentOwner.toString());
List<ScreenDeatails>temp=[];
final payload={ 
  "owner":currentOwner,
  "newId":{"_id":screenInfo[index].id},
  "screen":Screen,
  "rows":row,
  "columns":column

};

 response=await APiCallPage.apiPost(uri: editingScreen, body: payload);

 log(response.body);
 dynamic status=jsonDecode(response.body)as Map<String,dynamic>;
 if (status["success"]==true) {
   message=status["message"];
   getError(message, context);
   temp.clear();
   AddingScreen addingScreen=AddingScreen.fromJson(status);

   for (var element in addingScreen.data) {
     temp.add(element);
   }
   screenInfo[index]=temp[0];
   notifyListeners();
   Navigator.pop(context);
 }else{
  message=status["message"];
  getError(message, context);
 }




}


}