// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/theatreOwner/server_Side/common_Api_Call/api_call.dart';
import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';
import '../../../model/booking_Status/booking_details.dart';
import '../add_Screen/current_owner_provider.dart';

class BookingProvider extends ChangeNotifier{
  List<BookingDetails>details=[];

  Future<List<BookingDetails>> getBooking(BuildContext context) async{

   final provider=Provider.of<AddScreenProvider>(context,listen: false);

   final http.Response response;
    String Url=ApiConfiguration.getBooking;
   final id=provider.currentOwner!["_id"];

   response = await APiCallPage.apiGet(url: Url, id:id, context: context);

   final result=jsonDecode(response.body);
   log(response.body);
   
   details=(result["data"] as List).map((element) =>BookingDetails.fromJson(element)).toList();
   
   
   return details;

  }

   
  

}