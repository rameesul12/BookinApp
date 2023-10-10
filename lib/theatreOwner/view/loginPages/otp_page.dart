// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/theatreOwner/dialogues/validation_function.dart';
import 'package:bookingapp/user/View/loginPages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../user/variables/colors.dart';
import '../../../user/variables/sizedbox.dart';
import '../../model/owner_login/owner_signup.dart';
import '../../controller/provider/owner_Login/owner_otp_page.dart';

class OwnerOtpPage extends StatelessWidget {
 const OwnerOtpPage({super.key, this.loginDetails});
  final OwnerLoginModel? loginDetails;

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<OwnerOtpProvider>(context, listen: false);

    final Size size = MediaQuery.of(context).size;
    final defaultPinTheme = PinTheme(
      margin:const EdgeInsets.only(right: 8),
      width: 39,
      height: 46,
      textStyle:const TextStyle(
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
          child: SingleChildScrollView(
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
                    controller: _provider.pinController,
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
                    onCompleted: (pin) => log(pin),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 45,
                width: size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () async {
                    //  bool loading=await Provider.of<OtpPageProvider>(context,listen: false).otpChecking(context);
                    //   log("$loading");
                    // if(loading==true){

                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const HomeScreen(),
                    //       ));
                    // }else{
                    //   CircularProgressIndicator();
                    // }
                    if (otpScreenValidation(_provider.pinController.text)) {
                      getError("please Enter 6 digit Otp", context);
                    }else{

                    await _provider.ownerDetailsSign(
                        ownerDetails: loginDetails!,
                        otpNumber: _provider.pinController.text,
                        imageUrl: _provider.ownerImageUrl!);
                    // await Provider.of<AddScreenProvider>(context, listen: false)
                    //     .getCurrentOwner(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13))),
                  child: const Text(
                    'Verify',
                    style: TextStyle(color: textwhite),
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
