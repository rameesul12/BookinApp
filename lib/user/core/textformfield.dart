import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../variables/colors.dart';

class TextformField1 extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final IconData textIcon;
  bool? isLast;
int ? value=10;
   

    TextformField1({super.key, required this.hintText, required this.textController, required this.textIcon,this.value,this.isLast});

  @override
  Widget build(BuildContext context) {
   
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
         textInputAction:isLast==null? TextInputAction.next:TextInputAction.none,

         validator: (value) => value!.isEmpty ? "form not filled ":null,
         // obscureText: true,
       // focusNode:,
        controller: textController,
       inputFormatters: [LengthLimitingTextInputFormatter(value)],
        textAlign: TextAlign.left,
       // keyboardType:input ,
        style:const  TextStyle(fontSize: 11,color: textwhite),
        
        decoration: InputDecoration(
          filled: true,
          fillColor: textFieldBackground,
          // contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
        // icon: Icon(textIcon,color: Colors.white,),
          prefixIcon:Icon(textIcon,color: Colors.white,),
          hintText: hintText,hintStyle:const TextStyle(color: Colors.grey),
          border:
          OutlineInputBorder(    
            borderRadius:
             BorderRadius.circular(13)
          )
        
            
        ),
      ),
    );
  }
}