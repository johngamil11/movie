import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/color_manager.dart';
import 'package:movie/core/utils/styles.dart';
import 'package:movie/feather/browse_screen/presentation/manager/cubit/browse_screen_view_model.dart';
import 'package:movie/feather/browse_screen/presentation/widgets/Movies_view.dart';

import '../../../Movie_details/presentation/manager/movie_details_screen.dart';

class BrowseFilterScreen extends StatelessWidget {
String movieId;
String title ;
BrowseFilterScreen({required this.movieId , required this.title });

  @override

  Widget build(BuildContext context) {
    print('your navigatot id is $movieId');
    return BlocBuilder<BrowseScreenViewModel, BrowseScreenState>(
      bloc: BrowseScreenViewModel.get(context)..getFilterBrowse(movieId),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.backGround,
          appBar: AppBar(
            backgroundColor: ColorManager.backGround,
            title: Text(
              title, style: Styles.regularStyle.copyWith(fontSize: 22),),
          ),
          body:
          state is BrowseFilterSuccessState ?
          ListView.separated(
            itemCount: state.filterList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MovieDetailsScreen(
                        movieId: BrowseScreenViewModel.get(context).filterList[index].id.toString(),
                      ),
                    ));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: ColorManager.gray,

                      ),
                      child: MoviesView(
                        image: BrowseScreenViewModel.get(context).filterList[index].backdropPath ??'',
                        movieName:BrowseScreenViewModel.get(context).filterList[index].title ??'' ,
                        year: BrowseScreenViewModel.get(context).filterList[index].releaseDate ??'',
                        overLow: BrowseScreenViewModel.get(context).filterList[index].overview ??'',


                      )),
                ),
              );
            },
            separatorBuilder: (context, index) =>
                Container(height: 3.h, color: ColorManager.primary,
                  width: 15.w,),
          ):
              Center(child: CircularProgressIndicator(color: ColorManager.primary,))
        );
      },
    );
  }
}
