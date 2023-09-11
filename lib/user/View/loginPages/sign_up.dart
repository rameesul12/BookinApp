import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/user/Model/loginAnd_SignUp/login_page_model.dart';
import 'package:bookingapp/user/core/textformfield.dart';
import 'package:bookingapp/user/controller/login_And_Signpages/signup_and_otp.dart';
import 'package:bookingapp/user/dialogues/dialogue_functions.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/otp_pageprovider.dart';
import '../../variables/colors.dart';


final formKey = GlobalKey<FormState>();

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SighnUpPageState();
}
UserSighnUp? usersignup;

class _SighnUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    // initState(){
    //  Provider.of<LoginApiActionProvider>(context).postAll();
    // }
  
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Consumer<OtpPageProvider>(
            builder: (context,value,child) {
              return Column(
                children: [
                  sizedH60,
                  // sizedH60,
                  const Center(
                      child: Text(
                    'Welcome',
                    style: TextStyle(color: textwhite, fontSize: 60),
                  )),
                  const Text(
                    'Create your account ',
                    style: TextStyle(color: Colors.white70),
                  ),
                  sizedH30,
                  //  sizedH60,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextformField1(
                      hintText: "Username",
                      textController:value.username ,
                      textIcon: Icons.person,
                    ),
                  ),
                  sizedH10,
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextformField1(
                        hintText: "Email",
                        textController: value.email,
                        textIcon: Icons.email,
                      )),
                  sizedH10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextformField1(
                      hintText: "Phone",
                      values: 10,
                      textController:value.phone,
                      textIcon: Icons.phone,
                    ),
                  ),
                  sizedH10,
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextformField1(
                        values: 10,
                        hintText: "Password",
                        textController: value.password,
                        // isLast: true,
                        textIcon: Icons.lock,
                      )),
                  sizedH10,
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextformField1(
                        values: 10,
                        // value: password,
                        isLast: true,
                        hintText: "Confirm Password",
                        textController: value.confirmPassword,
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
                        width: size.width * 0.9,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                          if (usernameValidation(value.username.text)) {
                            getError("Please Enter Username", context);
                          }else if(usermailvalidation(value.email.text)){
                            getError("Please Enter Email", context);
                          }else if(userpPassWordValidation(value.password.text, value.confirmPassword.text)){
                            getError("Incorrept Password", context);
                          }else{
                       await   Provider.of<LoginPageProvider>(context, listen: false)
                                  .createAccount(
                                      username:value.username.text,
                                      email:value.email.text,
                                      phone:value. phone.text,
                                      password: value.password.text,
                                      cpassword:value.confirmPassword.text,
                                      context: context
                                      );
                                        // ignore: use_build_context_synchronously
                                       
                          }
                                      
                         
                            
                            } else {
                              Exception('somthing went wrong');
                            }
                            
                              
                           
                            /* else{
                              return ;
                            } */
                            },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13))),
                          child: const Text(
                            'Register',
                            style: TextStyle(color: textwhite),
                          ),
                        )),
                  ),
                  sizedH10,
                  const Text(
                    'Already have an Account? Login',
                    style: TextStyle(color: Colors.white70, fontSize: 10),
                  )
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
