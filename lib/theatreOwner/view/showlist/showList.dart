import 'package:bookingapp/theatreOwner/view/showlist/showListAdd.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';

class ShowListPage extends StatelessWidget {
 const ShowListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          sizedH60,
        const  Text('shows',style: TextStyle(color: textwhite,fontWeight: FontWeight.bold,fontSize: 30,),),
         Expanded(
              child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (context, index) => Divider(color: textFieldBackground),
                itemBuilder:(context, index) {
                return InkWell(
                  onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) =>const ShowListAdd() ,)),
                  child: ListTile(
                    leading:Image.asset('assets/images/icons8_tv_64.png',width: 35,),
                  title: Text('The Flash',style: TextStyle(color: textwhite),),
                  subtitle: Text('Screen ${index+1}',style: TextStyle(color: colorTextwhite),),
                  trailing: Icon(Icons.navigate_next_rounded,),
                  ),
                );
              }, ),
            )

        ],
      ) ,
    );
  }
}