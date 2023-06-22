
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    bool isValue = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
         leading: IconButton(onPressed: (){
          Navigator.pop(context);
         }, icon: Icon(Icons.arrow_back,color: textwhite,)),
         title: Text('Settings',style:TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
          
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
          sizedH10,
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/profile.webp'),
            ),
            sizedH60,
            Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: textwhite),
                borderRadius: BorderRadius.circular(20),
                color: colorTextwhite.withOpacity(0.3),
              ),
              child: ListTile(
                title: const Text(
                  'Light Mode',
                 style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),

                ),
                trailing: SizedBox(
                  width: 25,
                  height: 30,
                  child: Switch(
                    value: isValue,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ),
            sizedH10,
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: textwhite),
                borderRadius: BorderRadius.circular(20),
                color: colorTextwhite.withOpacity(0.3),
              ),
              child: ExpansionTile(
                title: Text(
                  'help &support',
                     style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),

                ),
                children: [
                  Text(
                    'nothing mach',
                    style: TextStyle(color: textwhite),
                  )
                ],
              ),
            ),
            sizedH10,
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: textwhite),
                borderRadius: BorderRadius.circular(20),
                color: colorTextwhite.withOpacity(0.3),
              ),
              child: ExpansionTile(
                title: Text(
                  'help &support',
                  style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),

                ),
                children: [
                  Text(
                    'nothing mach',
                    style: TextStyle(color: textwhite),
                  )
                ],
              ),
            ),
            sizedH10,
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: textwhite),
                borderRadius: BorderRadius.circular(20),
                color: colorTextwhite.withOpacity(0.3),
              ),
              child: ExpansionTile(
                title: Text(
                  'Privacy & Policy',
                  style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),
                ),
                children: [
                  Text(
                    'nothing much',
                    style: TextStyle(color: textwhite),
                  )
                ],
              ),
            ),
            sizedH10,
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorTextwhite.withOpacity(0.3),
                border: Border.all(color: textwhite),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
               // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  sizedW20,
                  Text('Logout',style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
                 SizedBox(width: size.width*0.56,),
                 SizedBox(
                  height: 35,
                  width: 60,
                  child: IconButton(onPressed: (){},icon:Icon( Icons.logout,color: textwhite,))
                 )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
