import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/constants.dart';
import 'package:movie/feather/home_screen/domain/entities/GetPopularMoviesResponseEntity.dart';
import 'package:movie/feather/home_screen/presentation/widgets/movies_slider_details.dart';

class SliderWidget extends StatelessWidget {
  List<MovieDetailsEntity> movieDetailsList ;
  SliderWidget ({required this.movieDetailsList});

  @override
  Widget build(BuildContext context) {
    return
      CarouselSlider(
      options: CarouselOptions(
        height: 300.h,
        // aspectRatio: 16/9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(seconds: 3),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true, // to make it full page

        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
      items:
      movieDetailsList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return
              MoviesSliderDetails(movieDetailsEntity: i);
          },
        );
      }).toList(),
    ) ;

  }
}
