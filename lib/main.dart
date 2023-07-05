import 'package:bookingapp/user/View/loginPages/firstLoginPage.dart';
import 'package:bookingapp/user/provider%20for%20user/functions/function1.dart';
import 'package:bookingapp/user/provider%20for%20user/login_And_Signpages/sighnupAndOtp.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
       ChangeNotifierProvider(create: (context) => FuncionsPage1(),)
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
