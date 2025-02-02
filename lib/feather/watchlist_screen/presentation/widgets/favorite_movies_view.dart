import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/color_manager.dart';
import 'package:movie/core/utils/constants.dart';
import 'package:movie/core/utils/styles.dart';
import 'package:movie/feather/watchlist_screen/presentation/manager/cubit/watch_list_cubit.dart';

class FavoriteMoviesView extends StatelessWidget {
  String movieName ;
  String image ;
  String year ;
  String overLow ;
  int index ;
  FavoriteMoviesView({ required this.index,required this.image , required this.movieName ,required this.year ,required this.overLow});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
            ),
            height: 150,
            width: 150,
            child: Image.network(AppConstants.image_link + image, fit:BoxFit.cover,),
          ),
        ),
        Expanded(
          child: Container(
            height: 150.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(movieName ,overflow: TextOverflow.ellipsis, style: Styles.regularStyle,),
                      InkWell(
                        onTap: (){
                          WatchlistCubit.get(context).removeMovie(index);
                        },
                          child: Icon(Icons.delete , color: Colors.red, size: 35,))
                    ],
                  ),
                ),
                Text(year.substring(0,4) , style: Styles.regularStyle.copyWith(fontSize: 14),),
                Container(
                    height: 90.h,
                    child: Text(overLow ,maxLines: 2, overflow: TextOverflow.ellipsis,
                      style: Styles.regularStyle.copyWith(fontSize: 14) ,
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
