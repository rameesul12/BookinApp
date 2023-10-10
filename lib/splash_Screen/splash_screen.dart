



// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:bookingapp/user/View/loginPages/first_login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import '../theatreOwner/controller/provider/add_Screen/current_owner_provider.dart';
import '../user/controller/current_location/current_location.dart';
import '../user/controller/movie_pages_provider/home_page_providerr.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override

 
  Widget build(BuildContext context) {
  Provider.of<CurrentLocation>(context,listen: false).determinePosition();
notificationInitilize();
    Provider.of<MoviesProvider>(context).upcomingMoviesGet(context);
    getlogin(context);
    Provider.of<AddScreenProvider>(context,listen: false).getCurrentOwner(context);
  // getlogged(context);
     return  Scaffold(
      body: Center(
        child: SizedBox(
           height: 50,
          // width: 50,
          child: Lottie.asset('assets/animation/animation_lk3hiyoo.json' ,fit: BoxFit.contain,repeat: false)),

      ),
    );
  }
Future getlogin(BuildContext context) async{
  await Future.delayed(const Duration(seconds: 3));

  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const FirstLoginPage(),));
}

notificationInitilize(){
//  OneSignal.Debug.setLogLevel(OSLogLevel.debug);
//     OneSignal.Debug.setAlertLevel(OSLogLevel.none);
//     OneSignal.initialize('dd9e8c25-00af-4f81-bd6b-bda3808ece1c');
//     OneSignal.
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId("1a44d08a-b42a-438b-a582-9e8f35c92cc8");

  // Prompt the user for push notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    log("Accepted permission: $accepted");
  });

}

   
}
//  Future<void> getlogged(BuildContext context)async{ 
// await Future.delayed(const Duration(seconds: 2));
//   final SharedPreferences shared_preferences= await SharedPreferences.getInstance();
//   bool? value=shared_preferences.getBool('isLogged');

//   if (value==true) {
//     // ignore: use_build_context_synchronously
    
//      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const FirstLoginPage(),));
//   }else{
//     // ignore: use_build_context_synchronously
//    Navigator.push(context, MaterialPageRoute(builder:  (context) => const TheatreLoginPage(),));
//   }

 