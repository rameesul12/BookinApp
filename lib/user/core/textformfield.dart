
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../variables/colors.dart';

class TextformField1 extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final IconData textIcon;
final  bool? isLast;
 final Function()? fieldFuction;
  final TextInputType? input;
final int ? values;
   

    const TextformField1({super.key, required this.hintText ,required this.textController, required this.textIcon,this.values,this.isLast,this.fieldFuction,this.input});

  @override
  Widget build(BuildContext context) {
   
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
         textInputAction:isLast==null? TextInputAction.next:TextInputAction.none,
         
         validator: (value) => value!.isEmpty ? "Field is empty ":null,
         // obscureText: true,
       // focusNode:,
        controller: textController,
       inputFormatters: [LengthLimitingTextInputFormatter(values)],
        textAlign: TextAlign.left,
        keyboardType:input ,
        style:const  TextStyle(fontSize: 11,color: textwhite),
        onTap: 
         
          fieldFuction,
        onChanged: (value) {
          
        },
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