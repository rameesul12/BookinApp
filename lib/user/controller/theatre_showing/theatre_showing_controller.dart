

import 'dart:convert';
import 'dart:developer';

import 'package:bookingapp/common/secure_storage/flutter_securestorage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';

import '../../Model/get_movie_theatre_model/full_movie_theatre_model.dart';
import '../../apiConfigurationclass/configuration.dart';
import '../movie_pages_provider/home_page_providerr.dart';


class TheatreShowingController extends ChangeNotifier{
 
 List<TheatreData>theatreList=[];


   DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void updateSelectedDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }


Future allTheatreGetting(BuildContext context) async{

  final provider=Provider.of<MoviesProvider>(context,listen: false);
    
 

  final token=await storegeRead();
 final http.Response response;
final baseUrl=ApiConfiguration.baseUrl+ApiConfiguration.getTheatres;

 final data=provider.getMoviesData;
 log(data.toString());

final payload={
  "response":
    data,
  
  "date":selectedDate.toString()
};

 try {
   response=await http.post(Uri.parse(baseUrl),
 headers: {
  'Content-type': 'application/json;charset=utf-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
 },
 body: 
  jsonEncode(payload),

 
 encoding: Encoding.getByName('utf-8')
 ); 
// log(response.body);

 final status=jsonDecode(response.body)as Map<String,dynamic>;
theatreList.clear();
 if (status["success"]==true) {
   theatreList=(status["data"]as List).map((e) =>TheatreData.fromJson(e) ).toList();
   log(theatreList.toString());
   notifyListeners();
 }
 } catch (e) {
   log(e.toString());
 }

 

}

  



}