import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      CarouselSlider(
      options: CarouselOptions(
        height: 217,
        // aspectRatio: 16/9,
        // viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: false, // to make it full page
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return
              Container(
                height: 217.h,
                width: 412.w,
                decoration: BoxDecoration(
                ),
                child: Image.asset('assets/images/Imagecover.png' , fit: BoxFit.cover,),
              );
          },
        );
      }).toList(),
    );

  }
}
