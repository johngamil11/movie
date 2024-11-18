import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/feather/home_screen/domain/entities/GetPopularMoviesResponseEntity.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/styles.dart';

class  MoviesSliderDetails extends StatelessWidget {
MovieDetailsEntity movieDetailsEntity ;
MoviesSliderDetails ({required this.movieDetailsEntity});
  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          Container(
            height: 217.h,
            width: double.infinity,
            decoration: BoxDecoration(
            ),
            child:
            Image.network(
              // 'assets/images/photoslider.png'

              AppConstants.image_link + movieDetailsEntity.backdropPath!
              , fit: BoxFit.cover,),
          ),
          Positioned(
            top: 100.h,
            left: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(child: Image.network(
                  // 'assets/images/Imagecover.png'
                    AppConstants.image_link + movieDetailsEntity.posterPath!
                  , fit: BoxFit.cover,),
                  height: 199.h,
                  width: 129.w,),
                SizedBox(width: 15.w,),
                Column(
                  children: [
                    Container(
                        width: 200,
                        child: Text(
                          movieDetailsEntity.title ??''
                          // movieDetailsEntity.title ??''
                          ,
                          style: Styles.regularStyle, maxLines: 2,)),
                    Container(
                        width: 200,
                        child: Text(
                          movieDetailsEntity.releaseDate ??''
                          // movieDetailsEntity.title ??''
                          ,
                          style: Styles.regularStyle, maxLines: 2,)),
                  ],
                ),

              ],
            ),
          ),
        ],
      );
  }
}
