// ignore_for_file: use_build_context_synchronously

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/user/core/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../theatreOwner/dialogues/validation_function.dart';
import '../../../../controller/login_And_Signpages/signup_and_otp.dart';
import '../../../../controller/razor_pay/razor_pay_controller.dart';
import '../../../../variables/colors.dart';
import '../../../../variables/sizedbox.dart';


  final formKey= GlobalKey<FormState>();

class UserEditScreen extends StatelessWidget {
 const  UserEditScreen({super.key,});


  
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<RazorPayController>(context,listen: false);
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    final size=MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(child: SingleChildScrollView(
        child:  Form(
          key:formKey ,
          child: Column(
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
                      "Edit Profile",
                      style: TextStyle(
                          color: textwhite, fontSize: 18, fontWeight: FontWeight.bold),
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
             TextformField1(hintText: "Enter Your Name", textController: nameController, textIcon: Icons.person_3_outlined),
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
                          TextformField1(hintText: "Enter your email", textController: emailController, textIcon: Icons.email_outlined),
        
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Phone",
                        style: TextStyle(
                            color: textwhite,
                            fontSize: 17,
                           // fontWeight: FontWeight.bold
                            ),
                      )),
                ),
                        TextformField1(hintText: "Phone Number", textController: phoneController, textIcon: Icons.lock,isLast: true,),
        
                sizedH60,
                SizedBox(
                  width: size.width * 0.6,
                  child: ElevatedButton(
                      onPressed: () async{
                        if (formKey.currentState!.validate()) {
                          if (nameValidation(nameController.text)) {
                            getError("please enter Atleast 4 characters", context);
                          }else if(mailvalidation(emailController.text)){
                            getError("please enter valid mail", context);
                          }else if(phoneValidation(phoneController.text)){
                            getError("please enter 10 numbers", context);
                          }else{
                      await provider.editApiCall(context,nameController.text,emailController.text, phoneController.text,);
                await Provider.of<LoginPageProvider>(context,listen: false).currentUserGet();

                          }
                        }
                        
                      //  lottieshowing(context);
                      
                     },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text(
                        "Save",
                        style: TextStyle(color: textwhite),
                      )),
                )
              ],
            ),
        )
        
      )),
    );
  }
    

}