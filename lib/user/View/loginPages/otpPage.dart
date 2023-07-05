import 'dart:developer';

import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../provider for user/functions/function1.dart';
import '../../services/otpSignup.dart';
import '../homePage/home.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});
  // final UserSighnUp sighnUp;
  @override
  Widget build(BuildContext context) {
 // bool loading=false;
    // final provider=Provider.of<>(context)

    Size size = MediaQuery.of(context).size;
    final defaultPinTheme = PinTheme(
      margin: EdgeInsets.only(right: 8),
      width: 39,
      height: 46,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    // final Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      sizedH30,
                      Text(
                        "OTP Verification",
                        style: TextStyle(
                            color: textwhite,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Lottie.asset('assets/animation/lottie_login.json', repeat: false),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'We will send you one time password to this \n email address.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  const Text(
                    '(example123@gmail.com)',
                    style: TextStyle(color: Colors.white70),
                  ),
                  sizedH10,
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Pinput(
                          controller: otpController,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          submittedPinTheme: submittedPinTheme,
                          validator: (s) {
                            if (s?.length != 6 || s == null) {
                              return "Please Enter valid Otp";
                            }
                            return null;
                          },
                          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                          length: 6,
                          showCursor: true,
                          onCompleted: (pin) => print(pin),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 45,
                      width: size.width * 0.9,
                      child:ElevatedButton(
                            onPressed: () async {
                              bool loading=await Provider.of<FuncionsPage1>(context,listen: false).otpChecking(context);
                           log("$loading");
                            if(loading==true){
                              
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ));
                            }else{
                              CircularProgressIndicator();
                            }
                            },
                            child: Text(
                              'Verify',
                              style: TextStyle(color: textwhite),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: buttonColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13))),
                          )
                       )
                ],
              ),
            )
         
      ),
    );
  }
}
 TextEditingController otpController = TextEditingController();

