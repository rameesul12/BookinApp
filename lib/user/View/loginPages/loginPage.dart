import 'package:bookingapp/user/core/textformfield.dart';
import 'package:bookingapp/user/View/loginPages/sighnUp.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
   TextEditingController userNameController=TextEditingController();
   TextEditingController passWordController=TextEditingController();

    final Size size=MediaQuery.of(context).size;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            sizedH120,
         const   Center(child: Text('Welcome',style: TextStyle(color: textwhite,fontSize: 60),)),
          const  Text('Login to your create account',style:TextStyle(color: textwhite,fontWeight: FontWeight.w100),),
          sizedH60,
         
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextformField1(hintText: 'Username', textController:userNameController,textIcon: Icons.person, ),
             ),
          sizedH10,
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextformField1(hintText: 'password', textController: passWordController, textIcon: Icons.password,),
         ),
          sizedH60,
          SizedBox(
            height: 50,
            width:size.width*0.7 ,
            child: ElevatedButton(onPressed: (){}, child:const  Text('Login',style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              backgroundColor: buttonColor,
              
            ),
            ),
          ),
          sizedH30,
        const  Text("Or",style: TextStyle(color:textwhite),),
        sizedH30,
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>const SighnUpPage() ,));
        }, child:const Text("sighnin?",style: TextStyle(color: textwhite),))
          ],
        ),
      ),
    );
  }
}