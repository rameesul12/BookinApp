
// ignore_for_file: use_build_context_synchronously

import 'package:bookingapp/user/View/loginPages/login_page.dart';
import 'package:bookingapp/user/View/settings/widgets/help_and_support.dart';
import 'package:bookingapp/user/View/settings/widgets/privacy.dart';
import 'package:bookingapp/user/View/settings/widgets/terms_and_condition.dart';
import 'package:bookingapp/user/View/settings/widgets/user/user_profile.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
   
    return Scaffold(
      
      body: Padding(
        padding:const  EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: Column(
            children: [
              //    sizedH10,
              Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon:const Icon(Icons.arrow_back_ios,color: textwhite,)),
                 sizedW30,
               const   Text("Settings",style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),)
                ],

              ),
              sizedH10,
       const  Padding(
           padding:  EdgeInsets.all(8.0),
           child: Align(
             alignment: Alignment.centerLeft,
            child:Text("Accounts",style: TextStyle(color:colorTextwhite),)),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             height: size.height*0.2,
            decoration: BoxDecoration(
               color: textFieldBackground,
               borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              children: [
                 InkWell(
                  onTap: () {
                     Navigator.push(context,MaterialPageRoute(builder: (context) =>const EditProfail(),));
                  },
                  child: const  ListTileValue(icons: Icons.person_3_outlined, title: "Profail")),
             //   const ListTileValue(icons: Icons.person_add_alt, title: "Edit Profail"),
           
             InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>const PrivacyPolicyScreen(),));
              },
              child: const   ListTileValue(icons: Icons.privacy_tip_outlined, title: "privacy")),
         
              
              ],
            )),
         ),
          const  Padding(
              padding:  EdgeInsets.all(8.0),
              child: Align(
                       alignment: Alignment.centerLeft,
                      child:    Text("Support And About",style: TextStyle(color:colorTextwhite),)),
            ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             height: size.height*0.19,
              decoration: BoxDecoration(
                 color: textFieldBackground,
                 borderRadius: BorderRadius.circular(15)
              ),
            child:  Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>const HelpAndSupportScreen(),));
                  },
                  child:const ListTileValue(icons: Icons.person_2_outlined, title: "Help And Support")),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const TermsAndConditionScreen(),));
                },
                child:const ListTileValue(icons: Icons.security, title: "Terms And Support")),
           ],
            )),
         ),
          sizedH10,
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
             alignment: Alignment.centerLeft,
            child: Text("Actions",style: TextStyle(color:colorTextwhite),)),
          ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             height: size.height*0.095,
              decoration: BoxDecoration(
                 color: textFieldBackground,
                 borderRadius: BorderRadius.circular(15)
              ),
            child: InkWell(
               onTap:  () async{
                showDialog(context: context, 
                builder: (context) {
                  return SizedBox(
                    height: size.height*0.3,
                    child: SimpleDialog(
                      backgroundColor: textFieldBackground,
                      shape:Border.all(width: 1 ,style: BorderStyle.solid) ,
                      title:const Text("Do You Want To Logout... ",style: TextStyle(color: textwhite,fontSize: 17,fontWeight: FontWeight.bold),),
                      titlePadding:const EdgeInsets.all(10.0),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child:const Text('cancel',style: TextStyle(color: textwhite),)),
                             TextButton(onPressed: (){
                              FlutterSecureStorage storage=const FlutterSecureStorage();
                              storage.delete(key: "Token");
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const LoginPage(),));
                             }, child:const Text('Logout',style: TextStyle(color: textwhite),))
                  
                         
                          ],
                        )
                      ],
                    ),
                  );
                },);

               },
              child:const ListTileValue(icons: Icons.login, title: "Log out"))),
         ),
            
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

class ListTileValue extends StatelessWidget {
 const  ListTileValue({
    super.key, required this.icons,
    required this.title
  });
final IconData icons;
final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(icons,color:textwhite ,),
        title: Text(title,style:const TextStyle(color: textwhite),),
      ),
    );
  }
}
