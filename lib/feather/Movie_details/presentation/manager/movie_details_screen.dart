import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/color_manager.dart';
import 'package:movie/core/utils/styles.dart';
import 'package:movie/feather/Movie_details/presentation/manager/cubit/movie_details_cubit.dart';

import '../../../../core/utils/constants.dart';
import '../../../watchlist_screen/presentation/manager/cubit/watch_list_cubit.dart';


class MovieDetailsScreen extends StatelessWidget {
  String movieId;
  MovieDetailsScreen({required this.movieId});
  String path = "https://image.tmdb.org/t/p/w500";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsViewModel, MovieDetailsState>(
      bloc: MovieDetailsViewModel.get(context)
        ..getMoviesDetails(movieId)..getSimilarMovies(movieId)
      ,
  builder: (context, state) {
    return Stack(
      children: [
        Scaffold(
          appBar:
    AppBar(
            backgroundColor: ColorManager.backGround ,
            centerTitle: true,
            iconTheme: IconThemeData(color: ColorManager.primary),
            title: Text(
              // movie. ??
            'Movie Detials' ,
              style: TextStyle(color: Colors.white),
            ),

            /// name from api
          ),
          backgroundColor: ColorManager.backGround,
          body:
          state is MovieDetailsSuccessState ?
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Stack(children: [
                      Image.network(
                        // 'assets/images/photoslider.png',
                        path+state.getMovieDetailsResponseEntity!.backdropPath! ??'' ,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      Center(
                          child: Icon(
                            Icons.play_circle_filled,
                            size: 100,
                            color: Colors.white70,
                          ))
                    ]),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      state.getMovieDetailsResponseEntity!.title!  ,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                            state.getMovieDetailsResponseEntity!.releaseDate!.substring(0,4),
                          // argus.releaseDate.toString().substring(0, 4),
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(width:  15 .w ,),
                        Text(
     '  ${state.getMovieDetailsResponseEntity!.runtime!.toString()} Minutes',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.height * 0.14,
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Image.network(
                          path +state.getMovieDetailsResponseEntity!.posterPath!,

                          // path + argus.posterPath.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 150.h,
                              child: Text(
                                state.getMovieDetailsResponseEntity!.overview!,
                                // argus.title.toString(),
                                style:
                                    Styles.regularStyle
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: ColorManager.primary,
                                ),
                                Text(
                                  state.getMovieDetailsResponseEntity!.voteAverage!.toStringAsFixed(1),
                                  // argus.voteAverage!.toStringAsFixed(1),
                                  style: Styles.regularStyle
                                  ,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 25.h,
                    color: ColorManager.gray,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'More Like This',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
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
                                child: Column(
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
                                        path + MovieDetailsViewModel.get(context).similarList[index].posterPath.toString()  ,
                                        // 'assets/images/Imagecover.png',
                                        // AppConstants.image_link +image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star_rate , size: 20 , color: Colors.yellow,),
                                        Text('(${MovieDetailsViewModel.get(context).similarList[index].voteAverage})'
    ,style: Styles.regularStyle.copyWith(fontSize: 14),),
                                      ],
                                    ),
                                    Container(
                                        width: 100.w,
                                        child: Text(
                                          MovieDetailsViewModel.get(context).similarList[index].title ??'',style: Styles.regularStyle.copyWith(fontSize: 14), maxLines: 2,)),
                                    Text(MovieDetailsViewModel.get(context).similarList[index].releaseDate.toString().substring(0,4),style: Styles.regularStyle.copyWith(fontSize: 14),),
                                  ],
                                )
                            ),

                        scrollDirection: Axis.horizontal,
                        itemCount:MovieDetailsViewModel.get(context).similarList.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(
                              width: 13.w,
                            ),
                      )
                  )
                ],
              ),
            ),
          )
        : Center(child: CircularProgressIndicator(color: ColorManager.primary,))
    ),

      ],
    ) ;

  },
);
}}
