
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

storegeRead() async{
FlutterSecureStorage secureStorage=FlutterSecureStorage();
   final  String? Token=await secureStorage.read(key: 'token');
   return Token;
}