import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../browse_screen/presentation/widgets/Movies_view.dart';
import '../widgets/favorite_movies_view.dart';
import 'cubit/watch_list_cubit.dart';
import 'cubit/watch_list_state.dart';

class WatchlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = WatchlistCubit.get(context);
    cubit.loadMovies();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.backGround,
        actions: [
          IconButton(onPressed: (){
            WatchlistCubit.get(context).clearAllMovies();
          },
              icon: Icon(Icons.delete , color: Colors.red,))
        ],
        title: const Text(
          'WatchList',
          style: TextStyle(color: ColorManager.white),
        ),
      ),
      backgroundColor: ColorManager.backGround,
      body: BlocBuilder<WatchlistCubit, WatchlistState>(
        builder: (context, state) {
          if (state is WatchlistLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is WatchlistLoadedState) {
            final movies = state.movies;

            if (movies.isEmpty) {
              return Center(
                child: Text(
                  'No Movies in your watchlist',
                  style: TextStyle(color: ColorManager.white),
                ),
              );
            }

            return ListView.separated(
              itemCount: movies.length, // عدد الأفلام المحملة
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      // أكشن عند الضغط على الفيلم
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: ColorManager.gray,
                      ),
                      child: FavoriteMoviesView(
                        index: index,
                        image: movie.imageUrl, // صورة الفيلم
                        movieName: movie.title, // اسم الفيلم
                        year: movie.year.toString(), // سنة الفيلم
                        overLow: movie.description, // وصف الفيلم
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Container(
                height: 3.h,
                color: ColorManager.primary,
                width: 15.w,
              ),
            );
          }

          if (state is WatchlistErrorState) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          return Center(
            child: Text(
              'Unknown State',
              style: TextStyle(color: ColorManager.white),
            ),
          );
        },
      ),
    );
  }
}