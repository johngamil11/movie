// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:movie/core/component/movies_list_details.dart';
// import 'package:movie/core/utils/color_manager.dart';
// import 'package:movie/feather/home_screen/presentation/widgets/movies_list.dart';
//
// import '../widgets/slider_widget.dart';
// import 'cubit/home_screen_cubit.dart';
//
// class HomeScreen2 extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//   providers: [
//     BlocProvider(
//         create: (context) =>HomeScreenViewModel.get(context)..getPopularMovies()..getReleasesMovies(),
// ),
//     // BlocProvider(
//     //   create: (context) =>HomeScreenViewModel.get(context)..getReleasesMovies(),
//     // ),
//   ],
//   child: Scaffold(
//     backgroundColor: ColorManager.backGround,
//     body: SingleChildScrollView(
//       child: Column(
//
//           children: [
//                     BlocBuilder<HomeScreenViewModel , HomeScreenState>(
//                             builder: (context , state){
//                               if (state is HomeScreenErrorState){
//                     return Text('Try again');
//                               }  if (state is HomeScreenLoadingState){
//                     return Center(child: CircularProgressIndicator(),);
//                               } if (state is HomeScreenSuccessState){
//                     return  SliderWidget(movieDetailsList: state.movieDetails);
//                               }return Container(
//                     color: Colors.yellowAccent,
//                               );
//                             }
//                     ),
//                     SizedBox(height: 25,),
//                     BlocBuilder<HomeScreenViewModel , HomeScreenState>(
//                             builder: (context , state) {
//                               if (state is ReleasesErrorState) {
//                                 return Text('Try again');
//                               }
//                               if (state is ReleasesLoadingState) {
//                                 return Center(
//                                   child: CircularProgressIndicator(),);
//                               }
//                               if (state is ReleasesSuccessState) {
//                                 return ListView.separated(
//                                   padding: REdgeInsets.only(
//                                     top: 12.87,
//                                     left: 19,
//                                     bottom: 13.3,
//                                     right: 19,
//                                   ),
//                                   itemBuilder: (context, index) =>
//                                       InkWell(
//                                           onTap: () {},
//                                           child: MoviesList(
//                                             title: 'title',
//                                             moviesReleaseList: state
//                                                 .releaseMovieList,
//                                             image: state
//                                                 .releaseMovieList[index]
//                                                 .posterPath.toString(),
//                                           )),
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: 20,
//                                   separatorBuilder: (context, index) =>
//                                       SizedBox(
//                                         width: 13.w,
//                                       ),
//                                 );
//                               }
//                               return Container(
//                                 color: Colors.yellowAccent,
//                               );
//                             } )
//
//                   ],
//         ),
//     ),
//     ),
//   );
//
//   }
//
// }
