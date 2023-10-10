// ignore_for_file: use_build_context_synchronously

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/theatreOwner/view/sails_Report/sailes_report.dart';
import 'package:bookingapp/theatreOwner/view/screens/screenmanagment.dart';
import 'package:bookingapp/theatreOwner/view/showlist/show_list.dart';
import 'package:bookingapp/user/core/constant/constanwidgets.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../user/variables/colors.dart';
import '../../controller/provider/add_Screen/current_owner_provider.dart';
import '../../controller/provider/add_Shows/add_show_provider.dart';
import '../bookingStatus/booking.dart';


class HomePage extends StatelessWidget {
   const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     Provider.of<AddScreenProvider>(context,listen: false).getCurrentOwner(context);
    final provider=Provider.of<AddScreenProvider>(context,listen: false);
    return Scaffold(
      body: Column(
        children: [
          AppBarcontainer(
            title: 'Dashboard',
            actionPath: 'assets/images/profile.png',
           // trailNavigate: navigate,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    //childAspectRatio: 1.2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 30,
                  ),
                  children:  [
                    InkWell(
                      onTap: () async {
                      lottieshowing(context);
                      await provider.getScreen(context);
                     
                     Navigator.pop(context);
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>const ScreenManagment(),));
                     },
                      child:const GridviewCard(
                        image: 'assets/images/clapperboard.png',
                        name: 'Screen Management',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) =>const BookingStatus(),));
                      
                      },
                      child:const GridviewCard(
                        image: 'assets/images/video-tutorial.png',
                        name: 'Booking Status',
                      ),
                    ),
                    InkWell(
                      onTap: () async{ 
                      lottieshowing(context);
                      await Provider.of<AddShowProvider>(context,listen: false).showGetting(context);
                       Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ShowListPage() ));
                     // Navigator.pop(context);
                      },
                      child:const GridviewCard(
                        image: 'assets/images/cinema_reel.png',
                        name: 'ShowList',
                      ),
                    ),
                       InkWell(
                      onTap: () async{ 
                     
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> const SailesReport()));
                     // Navigator.pop(context);
                      },
                      child:const GridviewCard(
                        image: 'assets/images/report (1).png',
                        name: 'Sails Report',
                      ),
                    ),
                    // InkWell(
                    //   onTap: () async{ 
                    
                    //   },
                    //   child:const GridviewCard(
                    //     image: 'assets/images/chat (1).png',
                    //     name: 'chats ',
                    //   ),
                    // ),
                  // const  GridviewCard(
                  //     image: 'assets/images/revenue(1).png',
                  //     name: 'Revenue',
                  //   ),
                
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GridviewCard extends StatelessWidget {
  const GridviewCard({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.2,
      decoration: BoxDecoration(
        color:textFieldBackground,
        borderRadius: BorderRadius.circular(10)
      //  image: DecorationImage(image: AssetImage(image))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.1,
            width: size.width * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(image:AssetImage(image),fit: BoxFit.fill)
            ),
          ),
          sizedH10,
          Text(
            name,
            style: const TextStyle(
              color: colorTextwhite,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
     
    );
  }
}
