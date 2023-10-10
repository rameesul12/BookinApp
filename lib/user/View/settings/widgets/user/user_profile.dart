import 'package:bookingapp/user/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/login_And_Signpages/signup_and_otp.dart';
import '../../../../variables/sizedbox.dart';
import 'edit_profile.dart';

class EditProfail extends StatelessWidget {
  const EditProfail({super.key});

  @override
  Widget build(BuildContext context) {


    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Consumer<LoginPageProvider>(builder: (context, data, child) {
          return Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: textwhite,
                      )),
                  sizedW30,
                  const Text(
                    "Profail",
                    style: TextStyle(
                        color: textwhite, fontSize: 18,fontWeight: FontWeight.bold),
                  )
                ],
              ),
              sizedH10,
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                  Positioned(
                      right: 5,
                      //  top: 30,
                      bottom: 5,
                      child: SizedBox(
                          height: size.height * 0.04,
                          width: size.width * 0.05,
                          child: Image.asset('assets/images/camera.png')))
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Name",
                      style: TextStyle(
                          color: textwhite,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                height: size.height * 0.07,
                width: size.width * 0.9,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: colorTextwhite),
                  borderRadius: BorderRadius.circular(10),
                  color: textFieldBackground,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person_2_outlined,
                      color: textwhite,
                    ),
                    Text(
                      data.userData!.data.signName,
                      style: const TextStyle(color: textwhite),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: TextStyle(
                          color: textwhite,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                height: size.height * 0.07,
                width: size.width * 0.9,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: colorTextwhite),
                  borderRadius: BorderRadius.circular(10),
                  color: textFieldBackground,
                ),
                child: Row(
                  children: [
           const Icon(Icons.email_outlined,color: textwhite,),

                    Text(
                      data.userData!.data.signEmail,
                      style: const TextStyle(color: textwhite),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Phone",
                      style: TextStyle(
                          color: textwhite,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                height: size.height * 0.07,
                width: size.width * 0.9,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: colorTextwhite),
                  borderRadius: BorderRadius.circular(10),
                  color: textFieldBackground,
                ),
                child: Row(
                  children: [
           const  Icon(Icons.lock_clock_outlined,color: textwhite,),

                    Text(
                     data.userData!.data.signPhone.toString(),
                      style: const TextStyle(color: textwhite),
                    ),
                  ],
                ),
              ),
              sizedH60,
              SizedBox(
                width: size.width * 0.8,
                child: ElevatedButton(
                    onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>const UserEditScreen() ,));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Text(
                      "Edit Profail",
                      style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),
                    )),
              )
            ],
          );
        }),
      )),
    );
  }
}
