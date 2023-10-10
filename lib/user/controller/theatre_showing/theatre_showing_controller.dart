import 'dart:convert';
import 'dart:developer';

import 'package:bookingapp/common/secure_storage/flutter_securestorage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookingapp/user/Model/voucher_modal/voucher_modal.dart';

import '../../Model/get_movie_theatre_model/full_movie_theatre_model.dart';
import '../../Model/get_seats_model/get_seat_modal_class.dart';
import '../../apiConfigurationclass/configuration.dart';
import '../movie_pages_provider/home_page_providerr.dart';

class TheatreShowingController extends ChangeNotifier {
  List<TheatreData> theatreList = [];
  TheatreData? theatreData;
  List<bool> theatreSeatsList = [];
  SeatsModelClass? theatreSeats;
  List<String> ticketCount = [];
  double price = 0.0;
  double tottalPrice = 0.0;
    List<VoucherDetails>voucherList=[];
    bool voucherLoaded=false;


  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void updateSelectedDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  Future allTheatreGetting(BuildContext context) async {
    final provider = Provider.of<MoviesProvider>(context, listen: false);

    final token = await storegeRead();
    final http.Response response;
    final baseUrl = ApiConfiguration.baseUrl + ApiConfiguration.getTheatres;

    final data = provider.getMoviesData;
    log(data.toString());

    final payload = {"response": data, "date": selectedDate.toString()};

    try {
      response = await http.post(Uri.parse(baseUrl),
          headers: {
            'Content-type': 'application/json;charset=utf-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(payload),
          encoding: Encoding.getByName('utf-8'));
      log("we checking if in get seats show id getting");
      //log(response.body);

      final status = jsonDecode(response.body) as Map<String, dynamic>;
      theatreList.clear();
      if (status["success"] == true) {
        theatreList = (status["data"] as List)
            .map((e) => TheatreData.fromJson(e))
            .toList();
        theatreData = TheatreData.fromJson(status["data"]);
        log(theatreData.toString());
        log(theatreList.toString());
        log(theatreList[0].movieName.toString());
        log(theatreList[0].screen.toString());

        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }
//============================
  //theatre toatal seat an shiowing seating arrangemnt
//============================

  Future seatingCountForBookingPage(int index) async {
    log(theatreList[index].dates[index].date.toString());
    http.Response response;
    final uri = ApiConfiguration.baseUrl + ApiConfiguration.getSeats;
    final payload = {
      "showId": theatreList[index].id.toString(),
      "date": theatreList[index].dates[index].date.toString()
    };
    final token = await storegeRead();

    try {
      response = await http.post(Uri.parse(uri),
          headers: {
            'Content-type': 'application/json;charset=utf-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(payload));
      final status = jsonDecode(response.body) as Map<String, dynamic>;

// log(response.body);
      if (status["success"] == true) {
        if (status.containsKey("data")) {
          theatreData = theatreList[index];
          theatreSeats = SeatsModelClass.fromJson(status);
          tottalPrice=0;
          listGenerating();
          log(theatreSeats.toString());
          log(theatreSeats!.data.screen.totalSeats.toString());
// theatreSeatsList.addAll([Data.fromJson(status)]);

          notifyListeners();
          log("oke");
          log(theatreData!.movieName);
//  theatreSeatsList.clear();
// theatreSeatsList.add(SeatsModelClass.fromJson(status["data"]));
// theatreSeats = SeatsModelClass.fromJson(status["data"]);
//  theatreSeats=(status["data"] as List).map((e) =>Data.fromJson(e)).toList();

//    log(theatreSeats!.data.screen.totalSeats.toString());

//  log(theatreSeats.toString());
//   log(theatreSeatsList.toString());
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

//==========================-=============
//we integreting a list of bool values length of seats count
////==========================-=============

  listGenerating() {
    theatreSeatsList =
        List.generate(theatreSeats!.data.screen.totalSeats, (_) => false);
    log(theatreSeatsList.length.toString());
    notifyListeners();
  }

//==========================-=============
//by clicking the seat the bool value change
////==========================-=============

  void seatListChangeValue(int index) {
    theatreSeatsList[index] = !theatreSeatsList[index];
    notifyListeners();
  }

//==========================-=============
//to find tickets counts
////==========================-=============

  void ticketsCounts(String value) {
//   log(theatreSeats!.data.showData.price.toString());
 tottalPrice=0;
    if (ticketCount.contains(value)) {
      ticketCount.remove(value);
      int count = ticketCount.length;
      price = theatreSeats!.data.showData.price.toDouble();
      tottalPrice = price * count.toDouble();
      log(ticketCount.length.toString());
      notifyListeners();
    } else {
      ticketCount.add(value);
      int count = ticketCount.length;
      price = theatreSeats!.data.showData.price.toDouble();
      tottalPrice = price * count.toDouble();

      notifyListeners();
    }
  }

  //=================================
// fire base vouchers adding 
//================================
Future voucherGetting(AsyncSnapshot<QuerySnapshot<Object?>>? snapshot) async {
  List<QueryDocumentSnapshot<Object?>>? list = snapshot!.data!.docs.toList();
  log(list.toString());
  voucherList.clear();

  try {
    for (var data in list) {
      final voucher = VoucherDetails(
        couponCode: data['CouponCode'],
        couponDescrtion: data['CouponDescrtion'],
        selectedOption: data['selectedOption'],
        couponExpire: data['CouponExpire'],
        discountAmount: int.tryParse(data['DiscountAmount']) ?? 0, 
        minimumAmount: int.tryParse(data['MinimumAmount']) ?? 0, 
        discountPercentage: int.tryParse(data['DiscountPersentage']) ?? 0, 
        percentageMinimumAmount: int.tryParse(data['PercentageMinimumAmount']) ?? 0, 
        uptoAmount: int.tryParse(data['UptoAmount']) ?? 0, 
      );
      // if (data['selectedOption']=='Fixed Amount') {
      //   final fixed=VoucherDetails(
      //      couponCode: data['CouponCode'],
      //   couponDescrtion: data['CouponDescrtion'],
      //   selectedOption: data['selectedOption'],
      //   couponExpire: data['CouponExpire'],
      //  discountAmount: int.tryParse(data['DiscountAmount']),
      //   minimumAmount: int.tryParse(data['MinimumAmount']) ,
      //       );
      // }else{
      //   final percentage=VoucherDetails(
      //      couponCode: data['CouponCode'],
      //   couponDescrtion: data['CouponDescrtion'],
      //   selectedOption: data['selectedOption'],
      //   couponExpire: data['CouponExpire'],
      //    discountPercentage: int.tryParse(data['DiscountPersentage']) , 
      //   percentageMinimumAmount: int.tryParse(data['PercentageMinimumAmount']) , 
      //   uptoAmount: int.tryParse(data['UptoAmount']) ,   
      //       );
      // }


      voucherList.add(voucher);
    }
  } catch (e) {
    log(e.toString());
  }
}


voucherApplyingFixedAmount(int index){

  final ticketPrice=tottalPrice;
  final discountAmount=voucherList[index].discountAmount!;
  // final discountPercentage=voucherList[index].discountPercentage;
  // final discountMinimumAmount=voucherList[index].percentageMinimumAmount;

   if (voucherList[index].selectedOption=='Fixed Amount') {
    tottalPrice=ticketPrice-discountAmount;
   }
notifyListeners();


  }

   voucherApplyingPercentage(int index){
     final ticketPrice=tottalPrice;
 // final discountAmount=voucherList[index].discountAmount!;
  final discountPercentage=voucherList[index].discountPercentage;
  final discountMinimumAmount=voucherList[index].percentageMinimumAmount;
  final price=voucherList[index].uptoAmount;
 
 log('message');
     log(discountMinimumAmount.toString());
   log(discountPercentage.toString());
   log(price.toString());

  final discountAmount = (ticketPrice * discountPercentage! / 100).toDouble();
     if (discountAmount>price!) {
    //   tottalPrice=ticketPrice-discountMinimumAmount;
    tottalPrice=ticketPrice-price;
    
     }else{
      // tottalPrice=ticketPrice-price;
      tottalPrice=ticketPrice-discountAmount;
     }
     voucherLoaded=true;
     notifyListeners();
   }



 

}
