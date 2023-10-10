

// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/common/secure_storage/flutter_securestorage.dart';
import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';

import '../../controller/login_And_Signpages/signup_and_otp.dart';
import '../../controller/movie_pages_provider/home_page_providerr.dart';
import '../../controller/theatre_showing/theatre_showing_controller.dart';
class RazorpayApi{



// RazorpayApi({this.bookingId, this.ticketsModal});

Future razorpaymentApi(BuildContext context)async{
  //user login data
  final providerUser=Provider.of<LoginPageProvider>(context,listen: false);

// log("okey ramees");
//log("yeah okey${providerUser.userData!.data.id.toString()}");
// theatre owner movies info provider----------
final provider=Provider.of<TheatreShowingController>(context,listen: false);

//movie fulldetails taking
final movieProvider=Provider.of<MoviesProvider>(context,listen: false);
 
 String image="https://www.themoviedb.org/t/p/w300_and_h450_bestv2${movieProvider.movieDetails[0].backdropPath}";
final token=await storageUser();


var fee=provider.price/6;
final total=provider.tottalPrice+fee;
 final http.Response response;

 final payload={
"fee":fee.toString(),
"subtotal":provider.price.toString(),
"total":total.toString(),
"image":image.toString(),
"user":{
  "user":{
    "_id":providerUser.userData!.data.id.toString(),
"signName":providerUser.userData!.data.signName
  }
},
"language":movieProvider.movieDetails[0].originalLanguage,
"details":{
  "selectedSeats":provider.ticketCount.map((e) => {"id":e.toString()}).toList(),
  "date":provider.selectedDate.toString(),
  "showDetails":{
    "status":"Booked",
    "ownerId":provider.theatreData!.id.toString(),
    "ownerName":provider.theatreData!.ownerName.toString(),
    "movieName":provider.theatreData!.movieName.toString(),
    "location":provider.theatreData!.location.toString(),
    "showTime":provider.theatreData!.showTime.toString(),
    "screen":provider.theatreData!.screen.toString()
  }
}
 };

 try {
   response=await http.post(Uri.parse(ApiConfiguration.baseUrl+ApiConfiguration.payment),
   headers: {
    'Content-type': 'application/json;charset=utf-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
   },
 body: jsonEncode(payload)
 );
  return response;
  
     
    //  log(ticketsModal.toString());

    //   log(bookingId!);
  
 } catch (e) {
   log(e.toString());
 }

}

}