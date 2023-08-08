import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../../Model/search_screen_model/search_mode.dart';
import '../../services/search_api_data/search_api.dart';
class SearchScreenProvider extends ChangeNotifier{

  List<SearchData>searchList=[];

Future searchDataGet(String query)async{

log(query);
final http.Response response;
try {
  response=await searchApi(query);
  final values=jsonDecode(response.body)as Map<String,dynamic>;

log(response.body);

if (response.statusCode==200) {
  searchList.clear();
 searchList=(values["data"] as List).map((e) => SearchData.fromJson(e)).toList();
 log('okeqy man');
 log(searchList.toString());
 notifyListeners();
}
} catch (e) {
  log(e.toString());
}


 


}

}