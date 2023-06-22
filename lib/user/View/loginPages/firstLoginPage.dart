import 'package:bookingapp/theatreOwner/view/loginPages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const UserLogin() ,));
                    },
                    child: Text('Login As a user',style: TextStyle(color: textwhite),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                    ),
                  )),
            ),
            sizedH30,
            SizedBox(
                height: 60,
                width: size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) =>const TheatreLoginPage () ,));
                  },
                  child:const Text(
                    'Login as theatre owner',
                    style: TextStyle(color: textwhite),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.white))),
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
}