

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocation extends ChangeNotifier{

   String currentAddress="";
  Position? currentPosition; 
  Future determinePosition() async{

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled=await Geolocator.isLocationServiceEnabled();

    if(!serviceEnabled) {
      Fluttertoast.showToast(msg: "please Keep your Location");
    }
    permission =await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {

      permission=await Geolocator.requestPermission();

      if (permission==LocationPermission.denied) {
        
        Fluttertoast.showToast(msg: "Location Permission is denied");

      }
    
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: "permission denied forever");
    }
    Position position=await Geolocator.getCurrentPosition(
desiredAccuracy: LocationAccuracy.high
    );

    try {
      List<Placemark>placemark=await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place=placemark[0];

      currentPosition=position;
      currentAddress="${place.locality}";
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }


}