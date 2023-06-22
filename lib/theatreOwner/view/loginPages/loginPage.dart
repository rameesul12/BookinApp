import 'package:bookingapp/theatreOwner/view/loginPages/sighninPage.dart';
import 'package:flutter/material.dart';

import '../../../user/core/textformfield.dart';
import '../../../user/variables/colors.dart';
import '../../../user/variables/sizedbox.dart';

class TheatreLoginPage  extends StatelessWidget {
  const TheatreLoginPage ({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController ownerName=TextEditingController();
     TextEditingController ownerPassword=TextEditingController();
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
           sizedH120,
         const   Center(child: Text('Welcome',style: TextStyle(color: textwhite,fontSize: 60),)),
          const  Text('Login to your create account',style:TextStyle(color: textwhite,fontWeight: FontWeight.w100),),
          sizedH60,
         
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextformField1(hintText: 'Username', textController:ownerName,textIcon: Icons.person, ),
             ),
          sizedH10,
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextformField1(hintText: 'password', textController:ownerPassword , textIcon: Icons.lock,),
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
        Navigator.push(context, MaterialPageRoute(builder: (context) =>const SighnInPage() ,));
        }, child:const Text("sighnin?",style: TextStyle(color: textwhite),))
        ],
      ),
    );
  }
}