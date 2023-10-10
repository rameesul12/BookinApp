// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:developer';

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/common/secure_storage/flutter_securestorage.dart';
import 'package:bookingapp/theatreOwner/model/show_Adding/show_adding.dart';
import 'package:bookingapp/theatreOwner/server_Side/common_Api_Call/api_call.dart';
import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:provider/provider.dart';
import '../../../model/movieShows/filim_getting.dart';
import '../add_Screen/current_owner_provider.dart';

class AddShowProvider extends ChangeNotifier {
  TextEditingController movieNameController = TextEditingController();
  TextEditingController showTimeController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController ticketPriceController = TextEditingController();
  TextEditingController screenNumberController = TextEditingController();
  String screen='';
  bool isSearch=false;
   List<SearchResult>movieList=[];
   List<SearchResult>list=[];
  // int? index;
  List<ShowDetails>shows=[];


  valueChanging(String value){

    screenNumberController.text=value;
    notifyListeners();
  }
 
  

  AddScreenProvider addScreenProvider = AddScreenProvider();
  //===========================
//posting shows Movie suggestion
//==============================

  Future addShowApi(BuildContext context) async {
  final owner= Provider.of<AddScreenProvider>(context,listen: false);

   final token=await storegeRead();

    final https.Response response;
   // String addShow = ApiConfiguration.addShow;
    String timer=showTimeController.text;
   // final time=int.parse(timer);
    String _prices=ticketPriceController.text;
    int price=int.parse(_prices);
    String _screen=screenNumberController.text;
    int screen=int.parse(_screen);
   
    final payload = {  
      "owner":{"_id": owner.currentOwner!["_id"]},
      "inputValue":movieNameController.text,
      "time":timer,
      "startDate":startDateController.text,
      "endDate":endDateController.text,
      "price": price ,
      "screen":screen ,
     // "time"
     // :
     };
   try {
      final baseurl=ApiConfiguration.baseUrl+ApiConfiguration.addShow;

    response=await https.post(Uri.parse(baseurl),
    headers: {'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
    },
    body: jsonEncode(payload)
    // encoding: Encoding.getByName('utf-8');
    );
    final status=jsonDecode(response.body) as Map<String,dynamic>;

    if (status["success"]==true) {
      
    
    notifyListeners();
      log('Is List visible =$shows');
      getError("show Added", context);
    }else{
      getError("Show already Exist", context);
    }

   notifyListeners();
 log(response.body);

   } catch (e) {
     log(e.toString());
   }
   
    //   response=await APiCallPage.apiPost(uri:addShow, body: payload);


  }


//===========================
//textField Movie suggestion
//===========================

Future suggectionGet(BuildContext context)async{
  
  final baseurl = ApiConfiguration.baseUrl + ApiConfiguration.getMovies;
 // FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final token = await storegeRead();
  
  https.Response response;


  response=await https.get(Uri.parse(baseurl),
  headers:{
       'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
  }
  );
  log(response.body);
 if (response.statusCode == 200) {
   Map<String, dynamic> jsonValue = jsonDecode(response.body);
        movieList = (jsonValue["data"] as List).map((e) => SearchResult.fromJson(e)).toList();
        notifyListeners();
        log(movieList.toString());
         
      } else {
        log('No movie data found');
        getError("No movie data found",context);
        return [];
      }

      
    
  } 
  valuechanger(int index){

     movieNameController.text=list[index].originalTitle;
                  isSearch=false;
    notifyListeners();
  }
  
 
//  suggestion(String values){
//    list.clear();
//    String filimName=values.toLowerCase();
//   List<SearchResult>temp=[];
//   //String movieDatas=element.toString().toLowerCase();
//  // int j=0;
//    for (var i = 0; i < movieList.length-1; i++) {
//     if (filimName.contains(movieList[i].originalTitle.toLowerCase())) {
//       temp.add(movieList[i]);
//     }
//     log('evide${temp.toString()}');
//      list=temp;
//    }
//    log("listle values${list.toString()}");
//   isSearch=true;
// notifyListeners();   
   
//  }





suggestion(String name){
list.clear();
  for (var element in movieList) {
    list.add(element);
  }
  isSearch=true;
  notifyListeners();

}


//=========//========================
//   GEtiing values from api
//=============================

Future showGetting(BuildContext context) async{
final currentOwner= Provider.of<AddScreenProvider>(context,listen: false).currentOwner;
final ownerId=currentOwner!["_id"];


// ignore: prefer_interpolation_to_compose_strings
final baseUrl=ApiConfiguration.getShow;

final https.Response response;
try {
  response =await APiCallPage.apiGet(url:baseUrl, id: ownerId, context: context);
 
 dynamic status=jsonDecode(response.body);
// log("response of show details${response.body}");
shows.clear();
 if (status["success"]==true) {

 ShowAdding showAdding=ShowAdding.fromJson(status);
  for (var element in showAdding.data) {
    shows.add(element);
   // notifyListeners();
  }
 notifyListeners();
  log(shows.toString());
  //  shows=(status["data"] as List).map((element) =>ShowDetails.fromJson(element)).toList();
  //  log(shows.toString());
   getError("success", context);
   log('is that rocky Kgf$shows');
   
 }else{

   getError("Failed", context);
 }
} catch (e) {
  log(e.toString());
}
}

//============================
//Show List Deleting
//=============================

 Future showDeleting(BuildContext context,int index) async{

  // final token = await storegeRead();
  log("${shows[index].id}");
  final https.Response response;
  final payload={
   "showId":shows[index].id
  };
   
   String deleteShow=ApiConfiguration.showDeleting;

  response=await APiCallPage.apiPost(uri:deleteShow, body:payload , );
  final status=jsonDecode(response.body);
  if (status["success"]==true) {
    
     shows.removeAt(index);
     notifyListeners();
     getError("Show Deleted", context);
  }else{
     getError("SOmthing Went wrong", context);
  }


 }


//=================================//
// Edit shows=====
//=================================//


Future editShow(BuildContext context,index)async{
  String messages;
  final https.Response response;
  final editShow=ApiConfiguration.showEdit;
final currentOwner= Provider.of<AddScreenProvider>(context,listen: false).currentOwner;
    String _timer=showTimeController.text;

   // final time=int.parse(timer);
    String _prices=ticketPriceController.text;
    log(_prices);
    int price=int.parse(_prices);
    String _screen=screenNumberController.text;
    log(_screen);
    int screen=int.parse(_screen);
    String movieName=movieNameController.text;
    log(movieName);
    String startDate=startDateController.text;

    String endDate=endDateController.text;
    final showId=shows[index].id;

  final payload={
    "owner":currentOwner,
      "inputValue":movieName,
      "time":_timer,
      "startDate":startDate,
      "endDate":endDate,
      "price": price ,
      "screen":screen ,
      "showId":showId,
  };

 try {
     response=await APiCallPage.apiPost(uri:editShow, body:payload );
  final status=jsonDecode(response.body) as Map<String,dynamic>;
  if (status["success"]==true) {
    
     messages=status["message"];
     log(status.toString());
     getError(messages, context);
     notifyListeners();
  }else{
    messages=status["message"];
    getError(messages, context);
  }

 } catch (e) {
   log(e.toString());
 }
}




 values(int index){

  movieNameController.text=shows[index].movieName!;
  showTimeController.text=shows[index].showTime!;
  startDateController.text=shows[index].startDate.toString();
  endDateController.text=shows[index].endDate.toString();
 ticketPriceController.text=shows[index].price.toString();
 screenNumberController.text=shows[index].screen.toString();
 }




}



