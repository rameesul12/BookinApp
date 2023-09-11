// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'dart:developer';

import 'package:bookingapp/common/secure_storage/flutter_securestorage.dart';
import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:bookingapp/user/services/api_call_functions.dart/api_call_functions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';
import '../../Model/home_Page_Movies/get_movies.dart';
import '../../Model/search_screen_model/search_mode.dart';
import '../../Model/search_screen_model/shows_displaying.dart';
import '../../services/search_api_data/search_api.dart';
import '../movie_pages_provider/home_page_providerr.dart';


class SearchScreenProvider extends ChangeNotifier{


  List<Details>searchList=[];
 // List<dynamic>search=[];
  List<Details>locationList=[];
  List<Details>movieLists=[];
  bool textLoaded=false;
  List<int>indexList=[];
  List<SearchShowDisplaying>showData=[];
  List<dynamic>showDatas=[];
  List<dynamic>images=[];
//  List<dynamic>availableShowsAndOwnerList=[];
 SearchShowDisplaying? displaying;


//  bool filimAdded=false;

 

Future searchDataGet( BuildContext context,String query)async{

//log(query);
final http.Response response;
try {

  response=await searchApi(query);
 
 
  final values=jsonDecode(response.body)as Map<String,dynamic>;

log(response.body);

if (values['success']==true) {

 
  searchList.clear();
   textLoaded=true;
notifyListeners();
 searchList=(values["data"] as List).map((e) => Details.fromJson(e)).toList();

 movieSearch(query);
 // ignore: use_build_context_synchronously
 indexListValueAdding(context);
// log("oke molu");
 

//
 //log(search.toString());
 notifyListeners();
}
} catch (e) {
  log(e.toString());
}
}

  locationSearch(String location){
    log('ok ramees');
    locationList.clear();
    String query=location.toLowerCase().toString().trim();
    log(searchList.length.toString());
   // List<dynamic>temp;
   for (var i = 0; i < searchList.length; i++) {
    String location=searchList[i].location!.toLowerCase();
     // log(searchList[i].data[i].location.toString());
     if (location.contains(query.toLowerCase())) {
       locationList.add(searchList[i]);
       log("broto${locationList.toString()}");
     //  textLoaded=false;
   notifyListeners();
     }
   }
    }

    movieSearch(String name){
       log("azgaee");
    String movieName=name.toLowerCase().trim();

  movieLists.clear();
    for (var i = 0; i <searchList.length ; i++) {
    String titlle=searchList[i].title!.toLowerCase();
      if (titlle.contains(movieName)) {
        movieLists.add(searchList[i]);
      //  indexList.add(i);
      //  log("ok vave ${indexList[i]}");
     //   filimAdded=true;
    notifyListeners();
      }
    }
    }
    indexListValueAdding(BuildContext context) async{
  
      final provider=Provider.of<MoviesProvider>(context);
     List<MoviesData>movies=provider.moviesList;
 indexList.clear();
     for (var i = 0; i <searchList.length ; i++) {
      for (var j = 0; j < movies.length; j++) {
         
        if (movies[i].movieId==searchList[j].movieId) {
          indexList.add(j);
        }

      }
       
     }
    notifyListeners();


    }




    //===============================----------==============
    //get theatre shows time from time location page
    //===============================----------==============

    Future theatreShowTimeGet(int index) async{
     
     final http.Response response;
     const getShowsTime=ApiConfiguration.theatreLocation;
     final ownerId=locationList[index].id;
     
     log(ownerId.toString());

   final token=await storegeRead();

 // log("zzzzz${token}");

     try {
       response=await ApiFunctions.apiGetFunctionWithId(getShowsTime, ownerId!,token );
     log(response.body);
     final status=jsonDecode(response.body)as Map<String,dynamic>;
  
    showDatas.clear();
      
      if (response.statusCode==200) {
        SearchShowDisplaying displaying=SearchShowDisplaying.fromJson(status);
     for (var data in displaying.data.shows) {
      showDatas.add(data);
     }

    // showDatas=(status["data"]as List).map((e) =>Data.fromJson(e)).toList();
        log("success");
        notifyListeners();
       // showDatas=showData["data"];
        
       }
     } catch (e) {
       log(e.toString());
     }


    } 
    
     //===============================----------==============
    //theatre shows time page image adding from time location 
    //===============================----------==============

    showDateImage(BuildContext context ,int index){
    final provier=  Provider.of<MoviesProvider>(context,listen: false);
  images.clear();
   for (var data in provier.moviesList) {
   //  log("hoi${showDatas[index].movieName}");
    // log("hi${data.id}");
    if (showDatas[index].movieName==data.title) {
      images.add(data.image);
      index++;

      log(images.toString());
      log({showDatas.length-1}.toString());
      notifyListeners();
      if (index==showDatas.length) {
        break;
      }
    }
   }
    
    
    }

     //===============================----------==============
    //normalyy booking by touchinfg movies at that showing full movies containing theatre name
    //===============================----------==============

//      Future bookingTheatreDetails(String id) async{
     
//      final http.Response response;
//      const getShowsTime=ApiConfiguration.theatreLocation;
     
     
//      log("okkk");

//    final token=await storegeRead();

//  // log("zzzzz${token}");

//      try {
//        response=await ApiFunctions.apiGetFunctionWithId(getShowsTime,id,token );
//     log(response.body);
//      final status=jsonDecode(response.body)as Map<String,dynamic>;
  
//    // showDatas.clear();
     
//       if (response.statusCode==200) {

//  final displaying=status;
//  return displaying;
//   //  //     SearchShowDisplaying displaying=SearchShowDisplaying.fromJson(status);
//   //   //  for (var data in displaying.data) {
//   //   //   availableShowsAndOwnerList.add(data);
//   //   //  }
//   //   log(response.body);

//   //    availableShowsAndOwnerList=(status["shows"]as List).map((e) =>SearchShowDisplaying.fromJson(e)).toList();
//   //  //   displaying=availableShowsAndOwnerList[0];

//   //     log(availableShowsAndOwnerList.toString());
      
//   //       log("success");
//   //       notifyListeners();
//  /*  if (status.containsKey("shows") && status.containsKey("owner")) {
//     final showsData = status["shows"];
//     final ownerData = status["owner"];

//     if (showsData != null && showsData is List<dynamic> && ownerData != null && ownerData is Map<String, dynamic>) {
//       availableShowsAndOwnerList.add(Data.fromJson({
//         "shows": showsData,
//         "owner": ownerData,
//       }));

//       log(availableShowsAndOwnerList.toString());

//       log("success");
//       notifyListeners();
        
//        // showDatas=showData["data"];
        
//        }else {
//       log("Invalid or null 'shows' or 'owner' field in response");
//     }
//   } else {
//     log("No 'shows' or 'owner' field found in response");
//   }
// } else {
//   log("Something went wrong. Status code: ${response.statusCode}");
//  */
//       }
//      }
//   catch(e){
//     log(e.toString());
     


//     } 
//   }
    
 
  
     }
     