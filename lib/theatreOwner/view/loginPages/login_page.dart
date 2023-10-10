import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/common/shared_preference_seting/set_bool.dart';
import 'package:bookingapp/theatreOwner/view/loginPages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../user/core/textformfield.dart';
import '../../../user/variables/colors.dart';
import '../../../user/variables/sizedbox.dart';
import '../../controller/provider/add_Screen/current_owner_provider.dart';
import '../../controller/provider/owner_Login/owner_login_page.dart';

class TheatreLoginPage  extends StatelessWidget {
  const TheatreLoginPage ({super.key});
  

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<OwnerLoginPageProvider>(context,listen: false);
   
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key:provider.formkey ,
          child: Column(
            children: [
               sizedH120,
             const   Center(child: Text('Welcome',style: TextStyle(color: textwhite,fontSize: 60),)),
              const  Text('Login to your created account',style:TextStyle(color: textwhite,fontWeight: FontWeight.w100),),
              sizedH60,
             
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextformField1(hintText: 'Username',
                    textController:provider.ownerName,textIcon: Icons.person, ),
                 ),
              sizedH10,
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextformField1(hintText: 'password',
                textController:provider. ownerPassword ,
                 textIcon: Icons.lock,),
             ),
              sizedH60,
              SizedBox(
                height: 50,
                width:size.width*0.7 ,
                child: ElevatedButton(onPressed: ()async{
                 
               if (provider.formkey.currentState!.validate()) {
                lottieshowing(context);
                 await  provider.ownerLoginRequest(
                email: provider.ownerName.text, 
                password: provider.ownerPassword.text,
                 context: context);
                // ignore: use_build_context_synchronously
                await  Provider.of<AddScreenProvider>(context,listen: false).getCurrentOwner(context);
                 setlogged(value: true);
               }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  backgroundColor: buttonColor,
                  
                ), child:const  Text('Login',style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
                ),
              ),
              sizedH30,
            const  Text("Or",style: TextStyle(color:textwhite),),
            sizedH30,
            TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>const SighnInPage() ,));
            }, child:const Text("sign In?",style: TextStyle(color: textwhite),))
            ],
          ),
        ),
      ),
    );
  }
}