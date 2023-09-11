 // ignore_for_file: non_constant_identifier_names

 import 'package:shared_preferences/shared_preferences.dart';

Future setlogged({required bool value}) async{
      final SharedPreferences shared_preferences=await SharedPreferences.getInstance();
      shared_preferences.setBool("isLogged",value );
    }
