


import 'package:bookingapp/user/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../controller/search_screen_provider/search_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<SearchScreenProvider>(context,listen: false);
    final Size size=MediaQuery.of(context).size;
    TextEditingController query=TextEditingController();
    return Scaffold(
     body: SafeArea(child: 
     Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
           // textInputAction:isLast==null? TextInputAction.next:TextInputAction.none,
         
        
        // obscureText: true,
       // focusNode:,
       
      controller:query ,
        textAlign: TextAlign.left,
      //  keyboardType:input ,
        style:const  TextStyle(fontSize: 11,color: textwhite),
        
        onChanged: (value) async{
            // log(query.text);
         await provider.searchDataGet(query.text);
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: textFieldBackground,
          // contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
        // icon: Icon(textIcon,color: Colors.white,),
          prefixIcon: IconButton(icon:const Icon( Icons.arrow_back),color: Colors.white,onPressed: (){
 Navigator.pop(context);
          },),
          hintText: "Search the movies or Theatres",hintStyle:const TextStyle(color: Colors.grey),
          border:
          OutlineInputBorder(    
            borderRadius:
             BorderRadius.circular(13)
          )
        
            
        ),
          )
        ),
        query.text.isEmpty?Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height*0.3,
                width: size.width*0.4,
                child: Lottie.asset('assets/animation/animation_ll0s7qfl.json'),
              ),
            const  Text("Please Search",style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),)
            ],
          ),
        ):SizedBox(
          height: size.height,
        width: size.width,
        )

      ],
     )),
    );
  }
}