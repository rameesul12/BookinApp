import 'package:bookingapp/user/Model/loginAnd_SignUp/login_PageModel.dart';
import 'package:bookingapp/user/core/textformfield.dart';
import 'package:bookingapp/user/provider%20for%20user/login_And_Signpages/sighnupAndOtp.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider for user/functions/function1.dart';
import '../../variables/colors.dart';
import 'otpPage.dart';

final formKey = GlobalKey<FormState>();

class SighnUpPage extends StatefulWidget {
  const SighnUpPage({super.key});

  @override
  State<SighnUpPage> createState() => _SighnUpPageState();
}
UserSighnUp? usersignup;

class _SighnUpPageState extends State<SighnUpPage> {
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
          child: Consumer<FuncionsPage1>(
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
                      value: 10,
                      textController:value.phone,
                      textIcon: Icons.phone,
                    ),
                  ),
                  sizedH10,
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextformField1(
                        value: 10,
                        hintText: "Password",
                        textController: value.password,
                        // isLast: true,
                        textIcon: Icons.lock,
                      )),
                  sizedH10,
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextformField1(
                        value: 10,
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
                              // Provider.of<LoginPageProvider>(context,listen: false).takeEmail(email: email.text);
                           /*    Provider.of<OtpRegisterProvider>(context)
                                  .userSignupDetails(
                                      username: username.text,
                                      email: email.text,
                                      phone: phone.text,
                                      password: password.text,
                                      cpassword: confirmPassword.text); */
                                      
                           await   Provider.of<LoginPageProvider>(context, listen: false)
                                  .createAccount(
                                      username:value.username.text,
                                      email:value.email.text,
                                      phone:value. phone.text,
                                      password: value.password.text,
                                      cpassword:value.confirmPassword.text);
                                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         OtpVerificationPage()));
                            
                            } else {
                              Exception('somthing went wrong');
                            }
                            
                              
                           
                            /* else{
                              return ;
                            } */
                            },
                          child: const Text(
                            'Register',
                            style: TextStyle(color: textwhite),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13))),
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
