import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/styles.dart';
import 'package:movie/feather/home_screen/presentation/widgets/movies_list.dart';
import 'package:movie/feather/home_screen/presentation/widgets/slider_widget.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SliderWidget(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 130.h,),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.w),
                  height: 199.h,
                  width: 129.w,
                  decoration: BoxDecoration(
                  ),
                  child: Image.asset('assets/images/Imagecover.png' , fit: BoxFit.fill,),
                ),
                SizedBox(width: 15,),

                Column(
                  children: [
                    Text('Movie Name' , style: Styles.regularStyle ,textAlign: TextAlign.end
                      , ),
                    Text('Movie Name' , style: Styles.regularStyle ),
                  ],
                ),

              ],
            ),
            SizedBox(height: 20.h,),

            MoviesIcon()
          ],
        )
      ],
    );
  }
}
