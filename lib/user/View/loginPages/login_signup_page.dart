import 'package:bookingapp/user/View/loginPages/login_page.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';

import '../../variables/colors.dart';

class UserLogin extends StatelessWidget {
  const UserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment,
          children: [
            const SizedBox(
              height: 180,
            ),
            const Center(
              child: Icon(
                Icons.lock,
                color: Colors.white70,
                size: 130,
              ),
            ),
            sizedH60,
            sizedH30,
            SizedBox(
                height: 60,
                width: size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) =>const LoginPage() ,));
                 
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                  ),
                  child:const Text('Login'),
                )),
            sizedH30,
            SizedBox(
                height: 60,
                width: size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                  
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side:const BorderSide(color: Colors.white))),
                  child:const Text(
                    'Signup',
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
}
