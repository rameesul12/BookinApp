// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/theatreOwner/view/loginPages/login_page.dart';
import 'package:bookingapp/user/View/homePage/home.dart';
import 'package:bookingapp/user/View/loginPages/login_page.dart';
import 'package:bookingapp/user/controller/movie_pages_provider/home_page_providerr.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../theatreOwner/view/homePage/dashboard.dart';
import '../../controller/login_And_Signpages/signup_and_otp.dart';
import '../../variables/colors.dart';
import '../../variables/sizedbox.dart';

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
                      Navigator.pop(context);
                    await Provider.of<LoginPageProvider>(context,listen: false).currentUserGet();
                    await  Provider.of<MoviesProvider>(context,listen: false).homeGetMovies(context);
                    
    
                     // Provider.of<FireBaseFunctionProvider>(context,listen: false).
                    //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const UserLogin() ,));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                    ),
                    child: const Text('Login As A User',style: TextStyle(color: textwhite),),
                  )),
            ),
            sizedH30,
            SizedBox(
                height: 60,
                width: size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () async{
                    lottieshowing(context);
                 await getlogged(context);
                  Navigator.push(context, MaterialPageRoute(builder:(context) =>const TheatreLoginPage () ,));
                 
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side:const BorderSide(color: Colors.white))),
                  child:const Text(
                    'Login as Theatre Owner',
                    style: TextStyle(color: textwhite),
                  ),
                )),
            sizedH30,
            sizedH60,
            // const Text(
            //   'continue as a guest?',
            //   style: TextStyle(color: textwhite),
            // )
          ],
        ),
      ),
    );
  }

   Future<void> getlogged(BuildContext context)async{
await Future.delayed(const Duration(seconds: 2));
  // ignore: non_constant_identifier_names
  final SharedPreferences shared_preferences= await SharedPreferences.getInstance();
  bool? value=shared_preferences.getBool('isLogged');

  if (value==true) { 

     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const HomePage(),));
 
 
  }else{
   
   Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => const TheatreLoginPage(),));
  }

 }

Future<void> userGetLogin(BuildContext context) async {
  try {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var data = preferences.getBool("userLogin");

    log(data.toString());

    if (data == true) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  } catch (e) {
    // Handle any errors that occur during SharedPreferences operations.
    log("Error: $e");
    // You can add error handling logic here.
  }
}

}

    