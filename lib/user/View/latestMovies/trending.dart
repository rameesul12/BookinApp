import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
const imageUrl='https://www.themoviedb.org/t/p/w220_and_h330_face/gO9k7t9jSdkkWVG0deMZDpELZGw.jpg';
class LatestMovies extends StatelessWidget {
  const LatestMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            title: const Text('Trending',style: TextStyle(color: textwhite),),
      ),
      body: ListView.separated(
        itemBuilder:(context, index) =>  ListViewPage(movieName: 'Spiderman', imagepath: imageUrl, genre: '', pg: '',) , 
       separatorBuilder: (context, index) => sizedH10, itemCount: 10),
       
      );
    
  }
}

class ListViewPage extends StatelessWidget {
   ListViewPage({super.key, required this.movieName, required this.imagepath, required this.pg, required this.genre,});
final String movieName;
final String imagepath;
final String pg;
final String genre;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height:140 ,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            image: DecorationImage(image: NetworkImage(imagepath),fit: BoxFit.fill)
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('SpiderMan',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold ),),
              sizedH30,
              Text('P.G 13+',style: TextStyle(color: colorTextwhite,fontSize: 11),),
             //  sizedH10,
              Text('Action,dramatic',style: TextStyle(color: colorTextwhite,fontSize: 11)),
             sizedH10,
             SizedBox(
                height: 25,
                width: MediaQuery.of(context).size.width* 0.281,
                child: ElevatedButton(onPressed: (){}, child:const Text('Booking',style: TextStyle(color: textwhite),),style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                 )
                ),),
              )
            ],
          ),
        )
    
      ],
    );
  }
}