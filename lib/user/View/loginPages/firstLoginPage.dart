// ignore_for_file: use_build_context_synchronously

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/theatreOwner/view/loginPages/loginPage.dart';
import 'package:bookingapp/user/View/homePage/home.dart';
import 'package:bookingapp/user/View/loginPages/loginPage.dart';
import 'package:bookingapp/user/controller/current_location/current_location.dart';
import 'package:bookingapp/user/controller/fireBbse_Functions/firebase_function.dart';
import 'package:bookingapp/user/controller/movie_pages_provider/home_page_providerr.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../theatreOwner/view/homePage/dashboard.dart';
import '../../variables/colors.dart';
import '../../variables/sizedbox.dart';
import 'loginSignupPage.dart';

class FirstLoginPage extends StatelessWidget {
  const FirstLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sizedH30,
            SizedBox(
              height: size.height*0.3,
              width: size.width*0.6,
              child: Lottie.asset('assets/animation/87845-hello.json',fit: BoxFit.fill)),
            // const Center(
            //   child: Icon(
            //     Icons.lock,
            //     color: Colors.white70,
            //     size: 130,
            //   ),
            // ),
             sizedH60,
            sizedH30,
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                  height: 60,
                  width: size.width * 0.7,
                  child: ElevatedButton(
                    onPressed: () async{
                      lottieshowing(context);
                      userGetLogin(context);
                     // Provider.of<FireBaseFunctionProvider>(context,listen: false).
                    await  Provider.of<MoviesProvider>(context,listen: false).homeGetMovies(context);
                    //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const UserLogin() ,));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                    ),
                    child: const Text('Login As a user',style: TextStyle(color: textwhite),),
                  )),
            ),
            sizedH30,
            SizedBox(
                height: 60,
                width: size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) =>const TheatreLoginPage () ,));
                  getlogged(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.white))),
                  child:const Text(
                    'Login as theatre owner',
                    style: TextStyle(color: textwhite),
                  ),
                )),
            sizedH30,
            sizedH60,
            const Text(
              'continue as a guest?',
              style: TextStyle(color: textwhite),
            )
          ],
        ),
      ),
    );
  }

   Future<void> getlogged(BuildContext context)async{
await Future.delayed(const Duration(seconds: 2));
  final SharedPreferences shared_preferences= await SharedPreferences.getInstance();
  bool? value=shared_preferences.getBool('isLogged');

  if (value==true) {
    
    
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const HomePage(),));
  }else{
   
   Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => const TheatreLoginPage(),));
  }

 }

 Future userGetLogin(BuildContext context)async{
SharedPreferences preferences=await SharedPreferences.getInstance();
  
final value = preferences.getBool("userLogin");
 
 if (value==true) {
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const HomeScreen(),));
 }else{
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const LoginPage(),));
 }

 }
}

    