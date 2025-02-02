import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie/core/utils/assets_image.dart';
import 'package:movie/core/utils/color_manager.dart';

class SearchWidget extends StatelessWidget {
  TextEditingController searchController ;
  Function(String) onSearch;

  SearchWidget({required String search , required this.onSearch}):
  searchController = TextEditingController(text: search);


  @override
  Widget build(BuildContext context) {
    Timer? debounce ;
    return
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController ,
            keyboardType: TextInputType.text,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(color: ColorManager.white),
            decoration: InputDecoration(
              hintTextDirection: TextDirection.ltr,
              fillColor: ColorManager.gray,
              filled: true,
              counterStyle: TextStyle(
                color: ColorManager.white
              ),
              labelText: 'Search',
              labelStyle: TextStyle(color: ColorManager.white),
              hintText: 'Enter your favorite movie ',
              hintStyle: TextStyle(color: ColorManager.white),
              prefixIcon: Image.asset(AssetsImage.searchIcon),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: ColorManager.primary,
                )
              ),
              border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: ColorManager.primary,
                  )
              ),

            ),
            onChanged: (value){
              if(debounce?.isActive ?? false) debounce?.cancel();
              debounce =Timer(Duration(milliseconds: 900), (){
                onSearch(value);
              });
              // onSearch(value);
            },
              ),
        );
  }
}
