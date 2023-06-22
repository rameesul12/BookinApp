import 'package:bookingapp/user/core/textformfield.dart';
import 'package:bookingapp/user/View/loginPages/otpPage.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';

import '../../variables/colors.dart';

class SighnUpPage extends StatelessWidget {
  const SighnUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizedH60,
            sizedH60,
         const   Center(
                child: Text(
              'Welcome',
              style: TextStyle(color: textwhite, fontSize: 60),
            )),
            
        const    Text(
              'Create your account ',
              style: TextStyle(color: Colors.white70),
            ),
            sizedH30,
            sizedH60,
            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextformField1(
                hintText: "Username",
                textController: username,
                textIcon: Icons.person,
              ),
            ),
              sizedH10,
            Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextformField1(
                  hintText: "Email",
                  textController: email,
                  textIcon: Icons.email,
                )),
             sizedH10,
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextformField1(
                  hintText: "Password",
                  textController: password,
                  textIcon: Icons.lock,
                )),
            sizedH10,
            Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextformField1(
                  hintText: "Confirm Password",
                  textController: confirmPassword,
                  textIcon: Icons.lock,
                )),
                sizedH10,
            const Text(
              "By registering you are agreeing to our Terms of use and privacy policy",
              style: TextStyle(color: Colors.white70, fontSize: 10),
            ),
            sizedH30,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 45,
                width:size.width*0.9 ,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>const OtpVerificationPage(),));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: textwhite),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)
                    )
                  ),
                ),
              ),
            ),
            sizedH10,
          const  Text('Already have an Account? Login',style: TextStyle(color: Colors.white70,fontSize: 10),)
          ],
        ),
      ),
    );
  }
}
