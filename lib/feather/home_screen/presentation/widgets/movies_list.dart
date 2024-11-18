import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/assets_image.dart';
import 'package:movie/core/utils/color_manager.dart';

import '../../../../core/utils/styles.dart';

class MoviesList extends StatelessWidget {
  String title ;
  MoviesList({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title , style: Styles.regularStyle.copyWith(fontSize: 22),),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context , index) {
                return  Container(
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color:  ColorManager.darkGrey,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset('assets/images/Imagecover.png'),
                              ),
                              InkWell(
                                  onTap: (){},
                                  child: Image.asset(AssetsImage.bookMark , width: 60 , height: 60,)),

                            ]),

                      ],
                    ),
                  ),
                );

                }),
          ),
        ],
      ),
    );

      Container(
          width: double.infinity,
          height: 400,
          color: ColorManager.gray,
          child:
    Stack(
    children: [
      Container(
      child: Image.asset('assets/images/Imagecover.png'),
    ),
      InkWell(
        onTap: (){},
          child: Image.asset(AssetsImage.bookMark , width: 60 , height: 60,)),

          ]),
        );
  }
}
