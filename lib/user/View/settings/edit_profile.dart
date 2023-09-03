
import 'package:bookingapp/user/core/textformfield.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:flutter/material.dart';

import '../../variables/sizedbox.dart';

class EditProfail extends StatelessWidget {
  const EditProfail({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController=TextEditingController();
    //  TextEditingController emailController=TextEditingController();
    //   TextEditingController passwordController=TextEditingController();
    final Size size=MediaQuery.of(context).size;
    return  Scaffold(
      body: SafeArea(child:
       SingleChildScrollView(
         child: Column(
          children: [
            Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon:const Icon(Icons.arrow_back_ios,color: textwhite,)),
                   sizedW30,
                 const   Text("Edit Profail",style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),)
                  ],
                ),
        sizedH10,
                Stack(
                  children: [
                 const   CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage("assets/images/profile.png"),
                    ),
                    Positioned(
                       right: 5,
                     //  top: 30,
                       bottom: 5,
                      child:SizedBox(
                         height:size.height*0.04,
                         width: size.width*0.05,
                        child: Image.asset('assets/images/camera.png')) )
                  ],
                ),
             const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Align(
                  alignment:Alignment.centerLeft,
                  child:   Text("Name",style: TextStyle(color: textwhite,fontSize: 17,fontWeight: FontWeight.bold),)),
              ),
              TextformField1(hintText: "Name", textController: nameController, textIcon: Icons.person),
                const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Align(
                  alignment:Alignment.centerLeft,
                  child:   Text("Email",style: TextStyle(color: textwhite,fontSize: 17,fontWeight: FontWeight.bold),)),
              ),
              TextformField1(hintText: "email", textController: nameController, textIcon: Icons.email),
                const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Align(
                  alignment:Alignment.centerLeft,
                  child:   Text("password",style: TextStyle(color: textwhite,fontSize: 17,fontWeight: FontWeight.bold),)),
              ),
              TextformField1(hintText: "new Password", textController: nameController, textIcon: Icons.lock),
              sizedH60,
              SizedBox(
                width: size.width*0.8,
                child: ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                )
                , child:const Text("Save Changes",style: TextStyle(color: textwhite),)),
              )
       
          ],
             ),
       )),
    );
  }
}