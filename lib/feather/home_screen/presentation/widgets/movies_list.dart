import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/assets_image.dart';
import 'package:movie/core/utils/color_manager.dart';
import 'package:movie/feather/home_screen/domain/entities/GetReleasesResponseEntity.dart';
import 'package:movie/feather/home_screen/presentation/manager/cubit/home_screen_cubit.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/styles.dart';

class MoviesList extends StatelessWidget {
  List<ReleasesMoviesEntity> moviesReleaseList ;
  String title ;
  String image ;

  MoviesList({required this.title, required this.moviesReleaseList , required this.image});
  @override
  Widget build(BuildContext context) {
                return  Stack(
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


                  ],
                );

  }
}
