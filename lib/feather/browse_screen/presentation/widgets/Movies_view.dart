import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/color_manager.dart';
import 'package:movie/core/utils/constants.dart';
import 'package:movie/core/utils/styles.dart';

class MoviesView extends StatelessWidget {
String movieName ;
String image ;
String year ;
String overLow ;
MoviesView({ required this.image , required this.movieName ,required this.year ,required this.overLow});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)
            ),
            height: 150,
            width: 150,
            child: Image.network(AppConstants.image_link + image, fit:BoxFit.cover,),
          ),
        ),
        Expanded(
          child: Container(
            height: 150.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(movieName ,overflow: TextOverflow.ellipsis, style: Styles.regularStyle,),
                Text(year.substring(0,4) , style: Styles.regularStyle.copyWith(fontSize: 14),),
                Container(
                    height: 90.h,
                    child: Text(overLow ,maxLines: 3, overflow: TextOverflow.ellipsis,
                      style: Styles.regularStyle.copyWith(fontSize: 14) ,
                )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
