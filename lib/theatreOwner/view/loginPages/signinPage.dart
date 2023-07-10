import 'package:flutter/material.dart';
import '../../../common/dialogues.dart';
import '../../../user/core/textformfield.dart';
import '../../../user/variables/colors.dart';
import '../../../user/variables/sizedbox.dart';
import 'package:provider/provider.dart';
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
                    )),
                    sizedH10,
                     Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextformField1(
                      hintText: "phone",
                      textController:provider. phone,
                      textIcon: Icons.phone_android,
                    )),
                    sizedH10,
                      Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextformField1(
                      hintText: "place",
                      textController:provider. place,
                      textIcon: Icons.place,
                    )),
                    sizedH10,
                     Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextformField1(
                      hintText: "upload id(Adhar Number)",
                      textController: provider.adharNumber,
                      textIcon: Icons.credit_card,
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
                      child: otpsignProvider.imageadded==true?const  Text("Uploaded"):const Text("uploadfile"),
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
                              
                             
                      }else{
                        Dialogues.error("fill the fields", context);
                      }
                                 
                                
                      },
                      child: Text(
                        'Register Now',
                        style: TextStyle(color: textwhite),
                      ),
                      style: ElevatedButton.styleFrom(backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)
                        )
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
