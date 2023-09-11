
import 'package:bookingapp/user/View/settings/edit_profile.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';

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
            child:    Text("Accounts",style: TextStyle(color:colorTextwhite),)),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             height: size.height*0.28,
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
                  child: const ListTileValue(icons: Icons.person_2_outlined, title: "Edit Profail")),
            const  ListTileValue(icons: Icons.security, title: "Security"),
             const   ListTileValue(icons: Icons.privacy_tip_outlined, title: "privacy"),
         
              
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
            child: const Column(
              children: [
                ListTileValue(icons: Icons.person_2_outlined, title: "Help And Support"),
              ListTileValue(icons: Icons.security, title: "Terms And Support"),
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
            child:const Column(
              children: [
                ListTileValue(icons: Icons.login, title: "Log out"),
              
             
              
              ],
            )),
         ),
            
            ],
          ),
        ),
      ),
    );
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
