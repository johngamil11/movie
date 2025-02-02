import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:movie/core/utils/assets_image.dart';
import 'package:movie/core/utils/color_manager.dart';
import 'package:movie/feather/home_screen/domain/entities/GetReleasesResponseEntity.dart';
import 'package:movie/feather/home_screen/presentation/manager/cubit/home_screen_cubit.dart';
import 'package:movie/feather/watchlist_screen/data/models/movie_model.dart';
import 'package:movie/feather/watchlist_screen/presentation/manager/cubit/watch_list_cubit.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/styles.dart';

class MoviesList extends StatelessWidget {
  List<ReleasesMoviesEntity> moviesReleaseList ;
  String title ;
  String image ;
  int movieId ;
  String year ;
  String overLow ;
  bool isFavorite = false ;
  MoviesList({ required this.year , required this.overLow,required this.title, required this.moviesReleaseList , required this.image , required this.movieId});
  @override
  Widget build(BuildContext context) {
                return  Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
          height: 180.h,
          width: 120.w,
          margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Image.network(
                        // 'assets/images/Imagecover.png'
                          AppConstants.image_link +image,
                        fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primary,
                ),
              );
            }
          }),
        ),
                    InkWell(
                      onTap: (){
                        WatchlistCubit.get(context).addMovie(MovieModel(
                            imageUrl: AppConstants.image_link +image,
                            title: title,
                            isFavorite: isFavorite ,
                            description: overLow,
                            year: year) );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('This movie added successfully to your watchlist'),
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 2),)
                            );



                      },
                      child: Image.asset(AssetsImage.bookMark),
                    ),


                  ],
                );

  }
  // void toggleFavorite(int movieId)async{
  //   var box = await Hive.openBox<int>('favorite');
  //   if(box.containsKey(movieId)){
  //     await box.delete(movieId);
  //     print('deleted successfully from favorite tab' );
  //   } else {
  //     await box.put(movieId, movieId);
  //     print('added successfully to favorite tab' );
  //
  //   }
  //
  //
  // }

}
