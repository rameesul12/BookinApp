// ignore_for_file: use_build_context_synchronously


import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/user/core/textformfield.dart';
import 'package:bookingapp/user/View/loginPages/sign_up.dart';
import 'package:bookingapp/user/controller/login_page_provider.dart';
import 'package:bookingapp/user/dialogues/dialogue_functions.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/login_And_Signpages/signup_and_otp.dart';
import '../../dialogues/forget_password_dialogu.dart';
import '../homePage/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context, listen: false);
    // final functionProvider=Provider.of<>(context,listen: false);
    final providerDialogue =
        Provider.of<DialogueProvider>(context, listen: false);

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: provider.formKeys,
          child: Column(
            children: [
              sizedH120,
              const Center(
                  child: Text(
                'Welcome',
                style: TextStyle(color: textwhite, fontSize: 60),
              )),
              const Text(
                'Login to your create account',
                style: TextStyle(color: textwhite, fontWeight: FontWeight.w100),
              ),
              sizedH60,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextformField1(
                  hintText: 'Email',
                  textController: provider.userEmailController,
                  textIcon: Icons.person,
                ),
              ),
              sizedH10,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextformField1(
                  hintText: 'password',
                  textController: provider.passWordController,
                  textIcon: Icons.password,
                ),
              ),
              TextButton(
                  onPressed: () {
                    providerDialogue.forgetPasswordDialogue(context: context);
                  },
                  child: const Text('Forget PassWord ?',
                      style: TextStyle(color: Colors.white70, fontSize: 10))),
              sizedH60,
              SizedBox(
                height: 50,
                width: size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () async {
                    if (provider.formKeys.currentState!.validate()) {
                      if (usernameValidation(
                          provider.userEmailController.text)) {
                        getError("User Name Not filled", context);
                      } else {
                        lottieshowing(context);
                        await provider.loginFunction(
                            provider.userEmailController.text.trim(),
                            provider.passWordController.text.trim(),
                            context);
                  await  Provider.of<LoginPageProvider>(context,listen: false).currentUserGet();
     
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ));
                        setUserLogin(true);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: buttonColor,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: textwhite, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              sizedH30,
              const Text(
                "Or",
                style: TextStyle(color: textwhite),
              ),
              sizedH30,
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ));
                  },
                  child: const Text(
                    "Sign In?",
                    style: TextStyle(color: textwhite),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future setUserLogin(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("userLogin", value);
  }
}
