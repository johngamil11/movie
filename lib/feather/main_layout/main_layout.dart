import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/assets_image.dart';
import 'package:movie/core/utils/color_manager.dart';
import 'package:movie/feather/browse_screen/presentation/manager/browse_screen.dart';
import 'package:movie/feather/home_screen/presentation/manager/home_screen.dart';
import 'package:movie/feather/home_screen/presentation/manager/homescreen2.dart';
import 'package:movie/feather/search_screen/presentation/manager/search_screen.dart';
import 'package:movie/feather/watchlist_screen/presentation/manager/watchlist_screen.dart';
import 'package:movie/main.dart';

class MainLayout extends StatefulWidget {

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentindex = 0 ;

  List<Widget> tabs =[
    HomeScreen(), SearchScreen(),BrowseScreen(), WatchlistScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      bottomNavigationBar: CurvedNavigationBar(
        // backgroundColor:ColorManager.darkGrey,
        color: ColorManager.darkGrey ,
        buttonBackgroundColor: ColorManager.primary ,
        backgroundColor: ColorManager.transparent,

        height: 70,
        items: <Widget>[
          Image.asset(AssetsImage.homeIcon),
          Image.asset(AssetsImage.searchIcon),
          Image.asset(AssetsImage.browseIcon),
          Image.asset(AssetsImage.watchlistIcon),

        ],
        onTap: (index) {
          changeSelectedIndex(index);
          //Handle button tap
        },
      ),
      body: tabs [currentindex] ,
      // Container(color: ColorManager.backGround),
    );
  }

  void changeSelectedIndex (newSelected){
    currentindex = newSelected ;
    setState(() {

    });
  }
}
