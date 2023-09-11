


// ignore_for_file: use_build_context_synchronously


import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/theatreOwner/dialogues/validation_function.dart';
import 'package:bookingapp/user/core/textformfield.dart';
import 'package:bookingapp/user/services/user_Authentication/forget_password.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/login_page_provider.dart';
import 'dialogue_functions.dart';

class DialogueProvider extends ChangeNotifier{


 TextEditingController  emailController=TextEditingController();
 TextEditingController  passWordController=TextEditingController();
 TextEditingController  confirmController=TextEditingController();
 TextEditingController  otpController=TextEditingController();
forgetPasswordDialogue({required BuildContext context}){

 final provider=Provider.of<LoginProvider>(context,listen: false);
   return showDialog(context: context, builder:(context) {
    
    return  SizedBox(
      height: 180,
      child: SimpleDialog(
        contentPadding:const EdgeInsets.all(10),
        backgroundColor: textFieldBackground,
        title:const Text("Please Enter your email Id",style:TextStyle(color: textwhite,fontSize: 13,fontWeight: FontWeight.bold),),
        children: [
          TextformField1(hintText: "Enter Your Email", textController:emailController , textIcon: Icons.email_outlined),
      //sizedH20,
        SizedBox(
          width: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: ()async {
                if (usermailvalidation(emailController.text)) {
                  Navigator.pop(context);
                  getError("Please check the Email", context);
                }else{
                  await provider.changingPassword(context);
                }
               
                

            },
             style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6)
            )
             ),
             child:const Text('Submit',style: TextStyle(color: Colors.black))),
          ),
        ),
      //  sizedH20,
    const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("Please Enter your Otp here",style:TextStyle(color: textwhite,fontSize: 13,fontWeight: FontWeight.bold),),
    ),
                TextformField1(hintText: "Enter Your otp", textController:otpController, textIcon: Icons.messenger_outline_sharp),
      SizedBox(
          width: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: ()async{
              lottieshowing(context);
            await provider.otpAndEmailPost(context, otpController.text);
             Navigator.pop(context);
            if(otpScreenValidation(otpController.text)){
                  getError("Please Enter 6 digit Otp ", context);
                  Navigator.pop(context);
                  }else{await resertPassword(context,emailController);
                otpController.clear();
                  }
            
             
       
            },
             style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6)
            )
             ),
             child:const Text('Verify',style: TextStyle(color: Colors.black))),
          ),
        ),
       ],
      ),
    ) ;
  },);
}

resertPassword(BuildContext context,TextEditingController email,){
  return showDialog(context: context,
   builder: (context) {
     return  SimpleDialog(
      backgroundColor: textFieldBackground,
      title:const Text("please enter new password",style: TextStyle(color: textwhite,fontSize: 16,fontWeight: FontWeight.bold),),
      children: [
       sizedH10,
        TextformField1(hintText: "New Password", textController: passWordController, textIcon:Icons.lock ),
    //const    Text("please enter Confirm Password",style: TextStyle(color: textwhite,fontWeight: FontWeight.bold)),
     sizedH10,
      TextformField1(hintText: "confirm Password", textController: confirmController, textIcon:Icons.lock),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: () async{
               if (userpPassWordValidation(passWordController.text,confirmController.text)) {
                 getError("password Not Maching", context);
               }else{
          await resetPasswordPost(context,email.text,passWordController.text,confirmController.text );
              
               }
               
              },
               style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)
              )
               ),
               child:const Text('Submit',style: TextStyle(color: Colors.black))),
      ),
      
      ],
     );
   },);
}
}