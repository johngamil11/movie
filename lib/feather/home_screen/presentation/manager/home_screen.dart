import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/assets_image.dart';
import 'package:movie/core/utils/color_manager.dart';
import 'package:movie/core/utils/styles.dart';
import 'package:movie/feather/home_screen/presentation/manager/cubit/home_screen_cubit.dart';
import 'package:movie/feather/home_screen/presentation/widgets/movies_list.dart';
import 'package:movie/feather/home_screen/presentation/widgets/slider_widget.dart';

import '../../../../core/component/movies_list_details.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenState>(
      bloc: HomeScreenViewModel.get(context)
        ..getPopularMovies()
        ..getReleasesMovies(),
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ColorManager.backGround,
            body:
            state is HomeScreenSuccessState ?
            SingleChildScrollView(
              child: Expanded(
                child: Column(
                  children: [
                    // SliderWidget() ,
                    SliderWidget(movieDetailsList: state.movieDetails),

                    SizedBox(height: 25.h,),
                    Container(
                      width: double.infinity,
                      height: 300.h,
                      color: ColorManager.gray,
                      child: MoviesList(title: 'New Releases',
                        movieDetails:,),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width: double.infinity,
                      height: 380.h,
                      color: ColorManager.gray,
                      child: MoviesListDetails(title: 'Recomended',),
                    ),

                  ],
                ),
              ),
            )
        : CircularProgressIndicator()
        );

      },
    );
  }
}
