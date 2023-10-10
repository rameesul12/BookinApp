import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VoucherShimmerWidget extends StatelessWidget {
  const VoucherShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: textBlack,
        highlightColor: const Color.fromARGB(255, 112, 111, 103),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: size.height ,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: size.height * 0.1,
                  width: size.width,
                  decoration: BoxDecoration(
                    //  color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                      ),
                      sizedW10,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width * 0.6,
                            height: size.height * 0.02,
                            color: textwhite,
                          ),
                          Container(
                            width: size.width * 0.6,
                            height: size.height * 0.02,
                            color: textwhite,
                          ),
                          Container(
                            width: size.width * 0.6,
                            height: size.height * 0.02,
                            color: textwhite,
                          ),
                          Container(
                            width: size.width * 0.5,
                            height: size.height * 0.02,
                            color: textwhite,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: 4,
              separatorBuilder: (context, index) => sizedH10,
            ),
          ),
        ),
      ),
    );
  }
}
