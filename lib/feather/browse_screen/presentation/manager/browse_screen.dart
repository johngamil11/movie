import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/color_manager.dart';
import 'package:movie/core/utils/strings.dart';
import 'package:movie/core/utils/styles.dart';
import 'package:movie/feather/browse_screen/presentation/manager/cubit/browse_screen_view_model.dart';
import 'package:movie/feather/browse_screen/presentation/pages/browse_filter_screen.dart';
import 'package:movie/feather/browse_screen/presentation/widgets/browse_Icon.dart';
import 'package:movie/feather/home_screen/presentation/manager/cubit/home_screen_cubit.dart';

class BrowseScreen extends StatefulWidget {
  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  void initState(){
    super.initState();
    BrowseScreenViewModel.get(context).getGenresBrowse();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseScreenViewModel, BrowseScreenState>(
      bloc: BrowseScreenViewModel.get(context),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.backGround,
          appBar:
          AppBar(
            backgroundColor: ColorManager.backGround,
            title: Text(Strings.browseCategory,
                style: Styles.regularStyle.copyWith(fontSize: 22)),),
          body:
          state is BrowseScreenSuccessState ?
          GridView.builder(
            itemCount: state.genresList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 7.w,
              ),
              itemBuilder: (context, index) =>
                  Container(
                      width: 160.w,
                      height: 40.h,
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BrowseFilterScreen(
                              movieId: state.genresList[index].id.toString(),
                              title: state.genresList[index].name ??'no data',

                            )
                          ),);                        },
                        child: BrowseIcon(
                          image: BrowseScreenViewModel.get(context).imageList[index],
                          name: state.genresList[index].name ??'',),
                      ))) :
              Center(child: CircularProgressIndicator(color: ColorManager.primary,))
        );
      },
    );
  }
}
