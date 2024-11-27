import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/styles.dart';

import '../../../../core/utils/constants.dart';

class BrowseIcon extends StatelessWidget {
String name ;
String image ;
BrowseIcon({required this.name , required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      child: Stack(
        children:[
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Opacity(
                opacity: 0.6,
                child: Image.asset(
                 image ,
                          fit: BoxFit.fitHeight,),
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Text(name , style: Styles.regularStyle,))

           ] ),
    );
  }

}