import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/color_manager.dart';
import 'package:movie/feather/search_screen/presentation/manager/cubit/search_cubit.dart';
import 'package:movie/feather/search_screen/presentation/widgets/search_widget.dart';

import '../../../browse_screen/presentation/widgets/Movies_view.dart';

class SearchScreen extends StatelessWidget {
String search = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        child: Column(
          children: [
            SearchWidget(
              search: search,
              onSearch: (value){
                  search = value ;
                  SearchViewModel.get(context)..search(search);
                },),
            //  SiedBox(height: 10.h,),
            BlocBuilder<SearchViewModel, SearchState>(
              bloc: SearchViewModel.get(context),
              builder: (context, state) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: SearchViewModel.get(context).searchList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: ColorManager.gray,
                              ),
                              child: MoviesView(
                                image: SearchViewModel.get(context)
                                        .searchList[index]
                                        .posterPath ??
                                    '',
                                movieName: SearchViewModel.get(context)
                                        .searchList[index]
                                        .title ??
                                    '',
                                year: SearchViewModel.get(context)
                                        .searchList[index]
                                        .releaseDate ??
                                    '',
                                overLow: SearchViewModel.get(context)
                                        .searchList[index]
                                        .overview ??
                                    "",
                              )),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Container(
                      height: 3.h,
                      color: ColorManager.primary,
                      width: 15.w,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
