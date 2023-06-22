import 'package:bookingapp/theatreOwner/view/homePage/dashboard.dart';
import 'package:bookingapp/user/View/homePage/home.dart';
import 'package:flutter/material.dart';

import '../../../user/core/textformfield.dart';
import '../../../user/variables/colors.dart';
import '../../../user/variables/sizedbox.dart';

class SighnInPage extends StatelessWidget {
  const SighnInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
     TextEditingController TheatreName = TextEditingController();
    TextEditingController ownerEmail = TextEditingController();
     TextEditingController LicenceNumber = TextEditingController();
      TextEditingController phone = TextEditingController();
    TextEditingController ownerPassword = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
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
                  textController:TheatreName ,
                  textIcon: Icons.home_filled,
                ),
              ),
                sizedH10,
              Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextformField1(
                    hintText: "Email",
                    textController: ownerEmail,
                    textIcon: Icons.email,
                  )),
               sizedH10,
                Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextformField1(
                    hintText: "Theatre Licence Number",
                    textController: LicenceNumber,
                    textIcon: Icons.credit_card_outlined,
                  )),
                  sizedH10,
                   Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextformField1(
                    hintText: "phone",
                    textController: phone,
                    textIcon: Icons.phone_android,
                  )),
                  sizedH10,
                   Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextformField1(
                    hintText: "upload id(Adhar Number)",
                    textController: ownerEmail,
                    textIcon: Icons.credit_card,
                  )),
                  sizedH10,
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextformField1(
                    hintText: "Password",
                   textController: ownerPassword,
                    textIcon: Icons.lock,
                  )),
              sizedH10,
              Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextformField1(
                    hintText: "Confirm Password",
                    textController: confirmPassword,
                    textIcon: Icons.lock,
                  )),
                  sizedH10,
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
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomePage(),));
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
    );
  }
}