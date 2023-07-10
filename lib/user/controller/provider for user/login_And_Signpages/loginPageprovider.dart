// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import '../../../View/homePage/home.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  final formKeys = GlobalKey<FormState>();

  bool isloading = true;

 

  Future loginFunction(
      String email, String password, BuildContext context) async {
  FlutterSecureStorage secureStorage=FlutterSecureStorage();

  

         Map payload={
          'loginEmail': email,
          'loginPassword': password,
        };
    final response = await http.post(
        Uri.parse(ApiConfiguration.baseUrl + ApiConfiguration.login),
        body: payload,
        encoding: Encoding.getByName('utf-8')
        );

        log(response.body);
        log('${response.statusCode}');
    if (response.statusCode == 200) {
      Map<String,dynamic>tokenSaver=jsonDecode(response.body);
      String token=tokenSaver['token'];
      secureStorage.write(key: "Token", value: token);
      log(token);
      
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
      isloading = false;
      notifyListeners();
      final jsonresponse = jsonDecode(response.body);
      return jsonresponse;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password or Email is incorrect ',style: TextStyle(color: Colors.red),)));
      log('somethin went wrong');
    }
  }

  Future<Widget> getLoading() async {
    return const Center(
      child: Column(
        children: [
          SpinKitPouringHourGlass(
            color: Colors.white,
            size: 50.0,
          ),
          Text(
            "Loading...",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
