import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/theatreOwner/dialogues/validation_function.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../controller/otp_pageprovider.dart';


class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});
  // final UserSighnUp sighnUp;
  @override
  Widget build(BuildContext context) {
 // bool loading=false;
    // final provider=Provider.of<>(context)



    Size size = MediaQuery.of(context).size;
    final defaultPinTheme = PinTheme(
      margin: const EdgeInsets.only(right: 8),
      width: 39,
      height: 46,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color:const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color:const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    // final Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
              child: Column(
                children: [
                  const Column(
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
                 SizedBox(
                  width: 150,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
TextButton(onPressed: ()async{
  await  Provider.of<OtpPageProvider>(context,listen: false).otpResend(context);
}, child:const Text('Resend Otp',style: TextStyle(color: textwhite),)),
               const  Divider(color: textwhite), 
                 ],) ),
                
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
                         // onCompleted: (pin) => print(pin),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 45,
                      width: size.width * 0.9,
                      child:ElevatedButton(
                            onPressed: () async {
                             if (otpScreenValidation(otpController.text)) {
                               getError("please enter 6 digit Otp", context);
                             }
                             await Provider.of<OtpPageProvider>(context,listen: false).otpChecking(context);
                           
                              
                             
                           
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: buttonColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13))),
                            child:  const Text(
                              'Verify',
                              style: TextStyle(color: textwhite),
                            ),
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

