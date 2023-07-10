import 'package:bookingapp/theatreOwner/controller/provider/owner_Login/owner_login_page.dart';
import 'package:bookingapp/theatreOwner/controller/provider/owner_Login/owner_otp_page.dart';
import 'package:bookingapp/user/View/loginPages/firstLoginPage.dart';
import 'package:bookingapp/user/controller/provider%20for%20user/login_And_Signpages/otp_pageprovider.dart';
import 'package:bookingapp/user/controller/provider%20for%20user/login_And_Signpages/loginPageprovider.dart';
import 'package:bookingapp/user/controller/provider%20for%20user/login_And_Signpages/sighnupAndOtp.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theatreOwner/controller/provider/owner_Login/owner_signup.dart';

void main() {
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
        ChangeNotifierProvider(create: (context) => OwnerLoginPageProvider(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
         scaffoldBackgroundColor:backgroundColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //  textTheme:  GoogleFonts.latoTextTheme(),
          useMaterial3: true,
          
        ),
        debugShowCheckedModeBanner: false,
        home:const FirstLoginPage(),
      ),
    );
  }
}
