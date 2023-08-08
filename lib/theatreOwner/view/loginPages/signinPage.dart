import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../common/dialogues.dart';
import '../../../user/core/textformfield.dart';
import '../../../user/variables/colors.dart';
import '../../../user/variables/sizedbox.dart';
import 'package:provider/provider.dart';
import '../../dialogues/validation_function.dart';
import '../../maps/map_class.dart';
import '../../model/owner_login/owner_signup.dart';
import '../../controller/provider/owner_Login/owner_otp_page.dart';
import '../../controller/provider/owner_Login/owner_signup.dart';
import 'otp_page.dart';


class SighnInPage extends StatefulWidget {
  const SighnInPage({super.key, });
 


  @override
  State<SighnInPage> createState() => _SighnInPageState();
  
}

class _SighnInPageState extends State<SighnInPage> {
  @override
  
 
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    final provider=Provider.of<OwnerSignUpProvider>(context,listen: false);
    final otpsignProvider=Provider.of<OwnerOtpProvider>(context,listen: false);
   // final LoginpageProvider=Provider.of<LoginProvider>(context,listen: false);
    
 

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key:provider.formkey ,
          child: Column(
            children: [
             //  sizedH60,
                sizedH30,
             const   Center(
                    child: Text(
                  'Owner Registration',
                  style: TextStyle(color: textwhite, fontSize: 30),
                )),
                sizedH10,
            const    Text(
                  'Create your account ',
                  style: TextStyle(color: Colors.white70),
                ),
               // sizedH30,
                sizedH60,
                Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextformField1(
                    hintText: "Theatre name",
                    textController:provider.theatreName ,
                    textIcon: Icons.home_filled,
                    
                  ),
                ),
                  sizedH10,
                Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextformField1(
                      hintText: "Email",
                      textController:provider.ownerEmail,
                      textIcon: Icons.email,
                    )),
                 sizedH10,
                  Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextformField1(
                      hintText: "Theatre Licence Number",
                      textController:provider.licenceNumber,
                      textIcon: Icons.credit_card_outlined,
                      values: 10,
                    )),
                    sizedH10,
                     Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextformField1(
                      hintText: "phone",
                      textController:provider. phone,
                      textIcon: Icons.phone_android,
                      values: 10,
                      input: TextInputType.number,
                    )),
                    sizedH10,
                      Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextformField1(
                      hintText: "place",
                      textController:provider.place,
                      textIcon: Icons.place,
                      fieldFuction:(){
                        
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectLocation(),));
                        provider.place.text=provider.location!;
                        log("is this working");
                      } ,
                    )),
                    sizedH10,
                     Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextformField1(
                      hintText: "upload id(Adhar Number)",
                      textController: provider.adharNumber,
                      textIcon: Icons.credit_card,
                      values: 14,
                    )),
                    sizedH10,
                    
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextformField1(
                      hintText: "Password",
                     textController:provider. ownerPassword,
                      textIcon: Icons.lock,
                    )),
                sizedH10,
                Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextformField1(
                      hintText: "Confirm Password",
                      textController:provider. confirmPassword,
                      textIcon: Icons.lock,
                    )),
                    sizedH20,
                 const   Text("Upload your proof",style: TextStyle(color: textwhite,fontSize: 10,),),
                      Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: ElevatedButton(onPressed: ()async{
                     setState(() {
                       otpsignProvider.filePicker();
                       otpsignProvider.imageadded=true;
                     });
                    
 
                       
                      },
                       
                      style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(10),
                          
                        ),
                        
                      ),
                      child: otpsignProvider.imageadded == true?const  Text("Uploaded"):const Text("uploadfile"),
                      )
                      )
                    ],
                  ),
                ),
                const Text(
                  "By registering you are agreeing to our Terms of use and privacy policy",
                  style: TextStyle(color: Colors.white70, fontSize: 10),
                ),
                sizedH30,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 45,
                    width:size.width*0.9 ,
                    child: ElevatedButton(
                      onPressed: () async{
                      if (provider.formkey.currentState!.validate()) {
                        
                        if (mailvalidation(provider.ownerEmail.text)==true) {
                          getError("invalid Email", context);
                        }else if(nameValidation(provider.theatreName.text)){
                          getError("invalid theareName ", context);
                        }else if(passwordChecking(provider.ownerPassword.text, provider.confirmPassword.text)){
                          getError("passWord Not Matching", context);
                        }else if(phoneValidation(provider.phone.text)){
                          getError("phone Number Not filled", context);
                        }else if(adharValidation(provider.adharNumber.text)){
                        getError("adhar Number Not filled", context);
                         } else if(otpsignProvider.imageadded){
                          getError("image want To Add", context);
                         }
                         else{
                          OwnerLoginModel? ownerInformation=OwnerLoginModel(
                            theatreName:provider.theatreName.text,
                             email: provider.ownerEmail.text,
                              licenceNumber: provider.licenceNumber.text,
                               phone:provider.phone.text,
                                location: provider.place.text,
                                 idProof: provider.adharNumber.text,
                                  password:provider.ownerPassword.text,
                                   confirmPassword:provider.confirmPassword.text,
                                   status: "Approved"
                                   );
  await provider.ownerSignUp(
                      theatrename: provider.theatreName.text,
                       owneremail:provider.ownerEmail.text,
                        licence:provider.licenceNumber.text ,
                         phone:provider. phone.text,
                          adharNumber:provider. adharNumber.text,
                           location:provider.place.text ,
                            password:provider.ownerPassword.text ,
                             confirmPassword:provider. confirmPassword.text,
                              context: context);
                               // ignore: use_build_context_synchronously
                               Navigator.push(context, MaterialPageRoute(builder: (context) => OwnerOtpPage(loginDetails: ownerInformation) ,));
                         }      
                      }else{
                        getError("fill the fields", context);
                      }
                                 
                                
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)
                        )
                      ),
                      child: const Text(
                        'Register Now',
                        style: TextStyle(color: textwhite),
                      ),
                    ),
                  ),
                ),
                sizedH10,
              
              const  Text('Already have an Account? Login',style: TextStyle(color: Colors.white70,fontSize: 10),)
            ],
          ),
        ),
      ),
    );
  }
}
