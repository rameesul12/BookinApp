


import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:http/http.dart' as http;
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import '../../../model/owner_login/owner_signup.dart';



class OwnerOtpProvider extends ChangeNotifier{
  
  TextEditingController pinController=TextEditingController();
  String? ownerImageUrl;
  bool imageadded=false;

  Future ownerDetailsSign({
    required OwnerLoginModel ownerDetails,
    required String otpNumber,
    required String imageUrl,
  })async{
    Map<String,dynamic>payload={
      "OwnerData":{
       "Name": ownerDetails.theatreName, 
       "Email" :ownerDetails.email,
       "Adhaar" :ownerDetails.idProof,
       "Licence":ownerDetails.licenceNumber,
       "Location":ownerDetails.location,
       "Phone" :ownerDetails.phone,
       "Password":ownerDetails.password,
       "status":ownerDetails.status
      },
      "otp":otpNumber,
      "imageData":imageUrl
    };
   
   try {
     final response=await http.post(Uri.parse(ApiConfiguration.baseUrl+ApiConfiguration.ownerOtpSignUp),
     headers: {
         'Content-type': 'application/json;charset=utf-8',
         'Accept': 'application/json',
     },
     body: jsonEncode(payload),
     encoding: Encoding.getByName('utf-8'),
     );
     log("rameez${response.body}");
     log("enathada monu${response.statusCode}");
     if (response.statusCode==200) {
      final jsondata=jsonDecode(response.body);
       log("succefully reached");
       return jsondata;
     }else{
      log('somthing wrong');
     }
   } catch (e) {
     log(e.toString());
   }
    


  }

//cloudinary details

  final cloudinary=Cloudinary.signedConfig(
    apiKey:"976681121275463" ,
     apiSecret: "mmMY_18TTAi6nrm48kDVfDfa8Kw",
      cloudName: "dt55a1jw7");
//==========================================

  uploadImage(File imagePath )async{
      CloudinaryResponse response = await cloudinary.upload(
        file: imagePath.path,
        fileBytes: imagePath.readAsBytesSync(),
        resourceType: CloudinaryResourceType.image ,
      );
      if (response.isSuccessful) {
        log("image added");
        imageadded=true;
        notifyListeners();
        ownerImageUrl=response.secureUrl.toString();
      }
     
     
  }

  filePicker() async{
    ImagePicker picker=ImagePicker();
     final  img=await picker.pickImage(source: ImageSource.gallery);
    File ownerImage=File(img!.path);
 //   setImage(ownerImage);
uploadImage(ownerImage);
  
  }

  // setImage(File? ownerImages){
   
  //   var _imagesaver=ownerImages;
  //  notifyListeners();
   
  // }
  
}

