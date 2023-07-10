
import 'package:flutter/material.dart';
class Dialogues{
static error(String str,BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.white70,content: Text(str,style:const TextStyle(color: Colors.black),)));
}
}