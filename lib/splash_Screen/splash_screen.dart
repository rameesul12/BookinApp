



// ignore_for_file: use_build_context_synchronously

import 'package:bookingapp/user/View/loginPages/first_login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../theatreOwner/controller/provider/add_Screen/current_owner_provider.dart';
import '../user/controller/current_location/current_location.dart';
import '../user/controller/movie_pages_provider/home_page_providerr.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override

 
  Widget build(BuildContext context) {
  Provider.of<CurrentLocation>(context,listen: false).determinePosition();

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

 