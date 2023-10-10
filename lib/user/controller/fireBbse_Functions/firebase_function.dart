import 'dart:developer';

import 'package:bookingapp/user/Model/banner_Model/banner_model_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireBaseFunctionProvider extends ChangeNotifier {
  List<MovieBannerDetails> bannerList = [];
  List<String> listImage = [];

  void valueDisplaying(AsyncSnapshot<QuerySnapshot<Object?>>? snapshot) {
    List<QueryDocumentSnapshot<Object?>>? list = snapshot?.data?.docs.toList();

    bannerList.clear();
    for (var element in list!) {
      final banner = MovieBannerDetails(
        moviName: element['MovieName'], 
        movieDescription: element['Description'],
        imagePath: element['imageLink'],
      );

      bannerList.add(banner);
      log("ramees${bannerList[0].imagePath}");
    }
  }

  // Uncomment this method if you intend to use it
  // Future<void> imageAdding() async {
  //   for (var i = 0; i < bannerList.length; i++) {
  //     log('is it okey ramees');
  //     String image = bannerList[i].imagePath.toString();
  //     listImage.add(image);
  //   }
  // }
}





