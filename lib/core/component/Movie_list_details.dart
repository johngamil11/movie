import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/assets_image.dart';
import 'package:movie/core/utils/color_manager.dart';
import 'package:movie/feather/home_screen/domain/entities/GetRecommendedResponseEntity.dart';
import 'package:movie/feather/home_screen/domain/entities/GetReleasesResponseEntity.dart';
import 'package:movie/feather/home_screen/presentation/manager/cubit/home_screen_cubit.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/styles.dart';

class MovieListDetails extends StatelessWidget {
  List<RecommendedMovieEntity> moviesRecommendedList ;
  String title ;
  String image ;
  String rate ;
  String movieName ;
  String year ;

  MovieListDetails({required this.title, required this.moviesRecommendedList , required this.image,
  required this.movieName , required this.year , required this.rate
  });
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          height: 180,
          width: 120,
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.yellowAccent,
              borderRadius: BorderRadius.circular(25)
          ),
          child: Image.network(
            // 'assets/images/Imagecover.png'
            AppConstants.image_link +image,
            fit: BoxFit.fill,
          ),
        ),
        Row(
          children: [
            Icon(Icons.star_rate , size: 20 , color: Colors.yellow,),
            Text(rate,style: Styles.regularStyle.copyWith(fontSize: 14),),
          ],
        ),
        Container(
          width: 100.w,
            child: Text(movieName,style: Styles.regularStyle.copyWith(fontSize: 14), maxLines: 2,)),
        Text(year.substring(0,4),style: Styles.regularStyle.copyWith(fontSize: 14),),

      ],
    );

  }
}
