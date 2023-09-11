import 'package:bookingapp/splash_Screen/splash_screen.dart';
import 'package:bookingapp/theatreOwner/controller/provider/add_Screen/current_owner_provider.dart';
import 'package:bookingapp/theatreOwner/controller/provider/add_Shows/add_show_provider.dart';
import 'package:bookingapp/theatreOwner/controller/provider/booking_Status/booking_status.dart';
import 'package:bookingapp/theatreOwner/controller/provider/owner_Login/owner_login_page.dart';
import 'package:bookingapp/theatreOwner/controller/provider/owner_Login/owner_otp_page.dart';
import 'package:bookingapp/user/controller/current_location/current_location.dart';
import 'package:bookingapp/user/controller/fireBbse_Functions/firebase_function.dart';
import 'package:bookingapp/user/controller/movie_pages_provider/home_page_providerr.dart';
import 'package:bookingapp/user/controller/otp_pageprovider.dart';
import 'package:bookingapp/user/controller/login_page_provider.dart';
import 'package:bookingapp/user/controller/login_And_Signpages/signup_and_otp.dart';
import 'package:bookingapp/user/controller/search_screen_provider/search_screen.dart';
import 'package:bookingapp/user/controller/theatre_showing/theatre_showing_controller.dart';
import 'package:bookingapp/user/dialogues/forget_password_dialogu.dart';
import 'package:bookingapp/user/firebase_options.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theatreOwner/controller/provider/owner_Login/owner_signup.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginPageProvider(),),
       ChangeNotifierProvider(create: (context) => OtpPageProvider(),),
       ChangeNotifierProvider(create: (context) => LoginProvider(),),
       ChangeNotifierProvider(create: (context) => OwnerSignUpProvider(),),
        ChangeNotifierProvider(create: (context) => OwnerOtpProvider(),),
        ChangeNotifierProvider(create: (context) => OwnerLoginPageProvider(),),
        ChangeNotifierProvider(create: (context) => AddScreenProvider(),),
        ChangeNotifierProvider(create: (context) => DialogueProvider(),),
        ChangeNotifierProvider(create:(context) => BookingProvider(),),
        ChangeNotifierProvider(create: (context) => AddShowProvider(),),
        ChangeNotifierProvider(create: (context) => MoviesProvider(),),
        ChangeNotifierProvider(create: (context) => FireBaseFunctionProvider(),),
        ChangeNotifierProvider(create: (context) => SearchScreenProvider(),),
        ChangeNotifierProvider(create: (context) => CurrentLocation(),),
        ChangeNotifierProvider(create: (context) => TheatreShowingController(),),
      //  ChangeNotifierProvider(create: (context) => RazorPayProvider(),)

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
         scaffoldBackgroundColor:backgroundColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily:"NotoSans",
        //  textTheme:  GoogleFonts.latoTextTheme(),
          useMaterial3: true,
          
        ),
        debugShowCheckedModeBanner: false,
        home:const SplashScreen(),
      ),
    );
  }
}
