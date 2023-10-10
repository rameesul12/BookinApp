
// ignore_for_file: non_constant_identifier_names

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

storegeRead() async{
FlutterSecureStorage secureStorage=const FlutterSecureStorage();
   final  String? Token=await secureStorage.read(key: 'token');
   return Token;
}


storageUser()async{
  FlutterSecureStorage storage=const FlutterSecureStorage();
  final String? token=await storage.read(key: "Token");
  return token;
}

storageDeleting() async{
  FlutterSecureStorage storage=const FlutterSecureStorage();

 await storage.delete(key:"Token" );

}