import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/config/routes/routes.dart';
import 'package:movie/core/component/Movie_list_details.dart';
import 'package:movie/core/utils/assets_image.dart';
import 'package:movie/core/utils/color_manager.dart';
import 'package:movie/core/utils/styles.dart';
import 'package:movie/feather/Movie_details/domain/entities/GetMovieDetailsResponseEntity.dart';
import 'package:movie/feather/Movie_details/presentation/manager/movie_details_screen.dart';
import 'package:movie/feather/home_screen/presentation/manager/cubit/home_screen_cubit.dart';
import 'package:movie/feather/home_screen/presentation/widgets/movies_list.dart';
import 'package:movie/feather/home_screen/presentation/widgets/slider_widget.dart';

import '../../../../core/component/movies_list_details.dart';
import '../../../Movie_details/presentation/manager/cubit/movie_details_cubit.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenState>(
      bloc: HomeScreenViewModel.get(context)
        ..getPopularMovies()
        ..getReleasesMovies()
      ..getRecommendedMovies(),
      builder: (context, state) {
        // GetMovieDetailsResponseEntity getMovieDetailsResponseEntity ;
        return Scaffold(
            backgroundColor: ColorManager.backGround,
            body: state is HomeScreenSuccessState ?
            SingleChildScrollView(
              child: Column(
                children: [
                  // SliderWidget() ,
                  SliderWidget(movieDetailsList: HomeScreenViewModel.get(context).movieList),
                  SizedBox(height: 25.h,),
                  Container(width: double.infinity,
                      padding: EdgeInsets.all(10),
                      height: 50.h,
                      color: ColorManager.gray,
                      child:Text('New Releases' , style: Styles.regularStyle,)),
                  Container(
                    width: double.infinity,
                    height: 250.h,
                    color: ColorManager.gray,
                    child:
                    ListView.separated(
                      padding: REdgeInsets.only(
                        top: 12.87,
                        left: 19,
                        bottom: 13.3,
                        right: 19,
                      ),
                      itemBuilder: (context, index) =>

                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => MovieDetailsScreen(
                                          movieId: HomeScreenViewModel.get(context).releaseMovieList[index].id.toString(),
                                                ),
                                        ));
                                  },
                                  child: MoviesList(
                                    overLow: HomeScreenViewModel.get(context).releaseMovieList[index]
                                        .overview
                                        .toString(),
                                    year: HomeScreenViewModel.get(context).releaseMovieList[index].releaseDate.toString(),
                                    title:  HomeScreenViewModel.get(context).releaseMovieList[index].title.toString(),
                                    moviesReleaseList: HomeScreenViewModel.get(context).releaseMovieList,
                                    image: HomeScreenViewModel.get(context).releaseMovieList[index]
                                        .posterPath.toString(),
                                    movieId: HomeScreenViewModel.get(context).releaseMovieList[index].id!.toInt(),
                                  )),
                              scrollDirection: Axis.horizontal,
                      itemCount:HomeScreenViewModel.get(context).releaseMovieList.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(
                            width: 13.w,
                          ),
                    )
                  ),
                  SizedBox(height: 30.h,),
                  Container(width: double.infinity,
                      padding: EdgeInsets.all(10),
                      height: 50.h,
                      color: ColorManager.gray,
                      child:Text('Recommended' , style: Styles.regularStyle,)),
                  Container(
                      width: double.infinity,
                      height: 340.h,
                      color: ColorManager.gray,
                      child:
                      // MoviesList(
                      // title: 'New Releases',
                      // movieDetails:,
                      // ),
                      ListView.separated(
                        padding: REdgeInsets.only(
                          top: 12.87,
                          left: 19,
                          bottom: 13.3,
                          right: 19,
                        ),
                        itemBuilder: (context, index) =>

                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MovieDetailsScreen(
                                      movieId: HomeScreenViewModel.get(context).recommendedMovieList[index].id.toString(),
                                    ),
                                  ));
                                },
                                child: MovieListDetails(
                                  movieName: HomeScreenViewModel.get(context).recommendedMovieList[index].title ??'',
                                  title: 'New Releases',
                                  rate: HomeScreenViewModel.get(context).recommendedMovieList[index].voteAverage.toString().substring(0,3),
                                  // moviesRecommendedList: HomeScreenViewModel.get(context).recommendedMovieList,
                                  year: HomeScreenViewModel.get(context).recommendedMovieList[index].releaseDate.toString(),
                                  image: HomeScreenViewModel.get(context).recommendedMovieList[index]
                                      .posterPath.toString(),
                                )),

                        scrollDirection: Axis.horizontal,
                        itemCount:HomeScreenViewModel.get(context).recommendedMovieList.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(
                              width: 13.w,
                            ),
                      )
                  ),

                ],
              ),
            )
        : Center(child: CircularProgressIndicator(color: ColorManager.primary,))
        );

      },
    );
  }
}
