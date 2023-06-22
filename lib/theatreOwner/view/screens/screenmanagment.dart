import 'package:bookingapp/theatreOwner/view/screens/screenAdding.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';

class ScreenManagment extends StatelessWidget {
  const ScreenManagment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            sizedH20,
            Text('My screens',style: TextStyle(color: textwhite,fontSize: 20,fontWeight: FontWeight.bold),),
            sizedH20,
            Expanded(
              child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (context, index) => Divider(color: textFieldBackground),
                itemBuilder:(context, index) {
                return InkWell(
                  onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) =>const ScreenAdding() ,)),
                  child: ListTile(
                    leading:Image.asset('assets/images/projector.png'),
                  title: Text('Screen ${index+1}',style: TextStyle(color: textwhite),),
                  trailing: Icon(Icons.navigate_next_rounded,),
                  ),
                );
              }, ),
            )
          ],
        ),
      ),
    );
  }
}