
import 'package:bookingapp/user/View/settings/settings.dart';
import 'package:bookingapp/user/core/constant/constanwidgets.dart';
import 'package:bookingapp/user/View/moviesInfo/selectedMovies.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../core/couponContainer/coupenCard.dart';
import '../../variables/sizedbox.dart';
import '../latestMovies/trending.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   //  final  Size size =MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppBarcontainer(
            leadingPath: 'assets/images/chat.png',
            title: "Malappuram",
            actionPath: 'assets/images/loupe.png',
          ),
          CarouselSlider(
            options: CarouselOptions(height: 160.0),
            items: [
              'assets/images/creditcard1.jpg',
              'assets/images/creditcard1.jpg',
              'assets/images/creditcard1.jpg',
              'assets/images/creditcard1.jpg'
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    // height: size.height*0.4,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              '$i',
                            ),
                            fit: BoxFit.fill),
                        color: backgroundColor),
                    //   child: Text('text ', style: TextStyle(fontSize: 16.0),)
                  );
                },
              );
            }).toList(),
          ),
          sizedH10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              const Text(
                " Trending",
                style: TextStyle(
                    color: textwhite,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LatestMovies(),));
                  },
                  child: const Text(
                    'SeeMore>',
                    style: TextStyle(
                      color: textwhite,
                    ),
                  ))
            ],
          ),
          // Row(
          //   children: [

          //   ],
          // ),
          sizedH10,
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal
              ,//separatorBuilder: (context, index) =>const Divider(),
              // itemCount: 10,
              // itemBuilder: (context, index) => MainCard( imageUrl: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/aVGDZYISKsiyyGdlX09LPLK01fb.jpg',filimTitle: 'Spiderman',),
              children: List.generate(10, (index) =>  InkWell(
                onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => MoviesInfo(),)),
                child: MainCard( imageUrl: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/aVGDZYISKsiyyGdlX09LPLK01fb.jpg',filimTitle: 'Spiderman',)),),
              ),
          ),
           Align(
            alignment: Alignment.topLeft,
            child: Text('Voucher Deals',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
            sizedH30,
            Expanded(
              child: ListView(
               
                scrollDirection: Axis.horizontal,
                children: List.generate(3, (index) =>  CouponCard(imagepath: 'assets/images/credit-card23.png',texttitle: 'blockbuster\n weekends\n offer,'),),
                 
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.home)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.topic)),
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage(),));
                  }, icon: Icon(Icons.person)),
                ],
              ),
            )
          
            
        ],
      ),
    );
  }
}





// ignore: must_be_immutable
class MainCard extends StatelessWidget {
  final String imageUrl;
  final String filimTitle;
   MainCard({
    super.key, required this.imageUrl, required this.filimTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 150,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            color: Colors.amber,
              image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.cover)
            ),
            // child: Text('me'),
          ),
          Text(filimTitle,style: TextStyle(color: textwhite,fontWeight: FontWeight.w800),),
        ],
      ),
    );
  }
}
