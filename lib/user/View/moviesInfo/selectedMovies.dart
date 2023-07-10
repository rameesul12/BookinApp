import 'package:bookingapp/user/View/bookinPage/bookingPage.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';

class MoviesInfo extends StatelessWidget {
  const MoviesInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.45,
            width: size.width,
            // color: buttonColor,
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.24,
                  width: size.width,
                  decoration:const BoxDecoration(
                      // color: Colors.amber,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://www.themoviedb.org/t/p/w220_and_h330_face/34m2tygAYBGqA9MXKhRDtzYd4MR.jpg'),
                          fit: BoxFit.fill)),
                ),
                Positioned(
                  top: 170,
                  left: 30,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                        height: size.height * 0.25,
                        width: size.width * 0.38,
                        child: Image.network(
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/sqfMynwPxlgPzba8JsAHphx8pXS.jpg',
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: size.width * 0.5,
                  child: MovieDetails(
                      size: size,
                      filimTitle: 'The Wolf of Wall Street (2013)',
                      directorTitle: 'Martin Scorsese',
                      genreTitle: 'rime, Drama, Comedy',
                      writerTitle: ''),
                )
                // Text('hii',style: TextStyle(color: textwhite),)
              ],
            ),
          ),
          //  Text('ramees',style: TextStyle(color: colorTextwhite),)
          sizedH30,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: size.height * 0.1,
                width: size.width * 0.29,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colorTextwhite),
                ),
                child: const Center(
                    child: Text(
                  '8.9/10',
                  style: TextStyle(
                      color: textwhite,
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                )),
              ),
              Container(
                height: size.height * 0.1,
                width: size.width * 0.29,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: colorTextwhite)),
                child: const Column(
                  children: [
                    sizedH20,
                    Text(
                      'Dueration',
                      style: TextStyle(color: colorTextwhite),
                    ),
                    Text(
                      '152Min',
                      style: TextStyle(
                          color: textwhite, fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
              Container(
                height: size.height * 0.1,
                width: size.width * 0.29,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: colorTextwhite)),
                child: const Column(
                  children: [
                    sizedH20,
                    Text(
                      'P.G',
                      style: TextStyle(color: colorTextwhite),
                    ),
                    Text(
                      '13+',
                      style: TextStyle(
                          color: textwhite,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              )
            ],
          ),
          sizedH20,
          const Text(
            'Overview',
            style: TextStyle(color: textwhite, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.25,
            width: size.width * 0.9,
            child: ListView(children: const [
              Text(
                '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel nunc interdum, pretium diam molestie, aliquam lacus. Donec sagittis odio felis, vel pharetra ligula pharetra sit amet. Etiam molestie vitae nunc vitae consequat. Praesent eget mi bibendum libero feugiat imperdiet vel vitae tortor. Fusce nec massa sollicitudin, gravida est ut, egestas eros. In in ipsum eu ante eleifend sollicitudin et quis neque. Suspendisse elementum pharetra blandit. Aliquam ut diam quis ligula elementum elementum. Fusce vitae dignissim magna, in sagittis velit. Duis tincidunt turpis non vestibulum vehicula. Sed maximus luctus dolor sed mattis. Praesent posuere malesuada elit, porta hendrerit urna volutpat sed.
                  
                  Etiam lacus leo, aliquet eleifend tellus sed, tincidunt vehicula dui. Sed a nisl a felis finibus dictum. Sed faucibus, est et mollis venenatis, orci libero ultrices tellus, sed pharetra mi sem faucibus ex. Phasellus semper tellus vel lobortis sodales. Fusce ac eros tempus orci feugiat dictum quis quis odio. Nunc et faucibus tortor. Nam ultrices cursus nulla, non elementum mauris pellentesque ac. Vivamus porttitor, orci non gravida faucibus, nisl felis vulputate erat, vel laoreet mi enim a arcu. Mauris faucibus dolor massa, vel facilisis ex faucibus eget. Nullam lacinia mattis nulla, id tempus sapien ullamcorper eget. Morbi dignissim neque non ipsum dignissim porta. Vestibulum ipsum turpis, pharetra nec urna eget, tempus elementum sapien.''',
                style: TextStyle(color: colorTextwhite, fontSize: 12),
              ),
            ]),
          ),
          SizedBox(
            width: size.width * 0.85,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    )),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) =>const BookingPage() ));
                },
                child: const Text(
                  'Book Tickets',
                  style: TextStyle(color: textwhite),
                )),
          )
        ],
      ),
    );
  }
}

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
    required this.size,
    required this.filimTitle,
    required this.directorTitle,
    required this.writerTitle,
    required this.genreTitle,
  });
  final String filimTitle;
  final String directorTitle;
  final String writerTitle;
  final String genreTitle;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: size.width * 0.5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(
              filimTitle,
              style: const TextStyle(color: Colors.amberAccent),
            ),
            sizedH30,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Director:',
                  style: TextStyle(color: colorTextwhite),
                ),
                sizedW10,
                Expanded(
                  child: Text(
                    directorTitle,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: const TextStyle(
                      color: colorTextwhite,
                    ),
                  ),
                )
              ],
            ),
             sizedH10,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Writter:',
                  style: TextStyle(color: colorTextwhite),
                ),
                sizedW10,
                Expanded(
                    child: Text(
                  writerTitle,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: colorTextwhite),
                ))
              ],
            ),
            sizedH10,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Genre:',
                  style: TextStyle(color: colorTextwhite),
                ),
                //  sizedW10,
                Expanded(
                    child: Text(
                  '$genreTitle',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: colorTextwhite,
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
