import 'package:bookingapp/theatreOwner/view/screens/screenmanagment.dart';
import 'package:bookingapp/theatreOwner/view/settings/settings.dart';
import 'package:bookingapp/theatreOwner/view/showlist/showList.dart';
import 'package:bookingapp/user/core/constant/constanwidgets.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';

import '../../../user/variables/colors.dart';
import '../bookingStatus/booking.dart';
import '../core/functions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarcontainer(
            title: 'Dashboard',
            actionPath: 'assets/images/profile.png',
            trailNavigate: navigateFunction(context,SettingsPage()),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 30,
                  ),
                  children:  [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>const ScreenManagment(),));
                      },
                      child:const GridviewCard(
                        image: 'assets/images/clapperboard.png',
                        name: 'Screen Management',
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>const BookingStatus(),)),
                      child:const GridviewCard(
                        image: 'assets/images/video-tutorial.png',
                        name: 'Booking Status',
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ShowListPage() ,)),
                      child:const GridviewCard(
                        image: 'assets/images/cinema_reel.png',
                        name: 'ShowList',
                      ),
                    ),
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
