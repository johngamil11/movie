import 'package:flutter/material.dart';
import 'package:movie/core/utils/color_manager.dart';
import 'package:movie/feather/home_screen/presentation/widgets/movies_list.dart';

class MovieDetailsScreen extends StatelessWidget {
  String path = "https://image.tmdb.org/t/p/w500";

// final String name , description , bannerUrl , postUrl,vote , lunchOn ;
//   MovieDetailsScreen({required this.resultDetailsMovie});
  @override
  Widget build(BuildContext context) {
    // var argus =
    // ModalRoute.of(context)?.settings.arguments as MoviesList ;//todo: name of modal;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: ColorManager.backGround,
            iconTheme: IconThemeData(color: ColorManager.primary),
            title: Text(
              'movie name',
              style: TextStyle(color: Colors.white),
            ),

            /// name from api
          ),
          backgroundColor:ColorManager.backGround,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Stack(children: [
                      Image.asset(
                        // path + argus.backdropPath.toString(),
                        'assets/images/Imagecover.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      Center(
                          child: Icon(
                            Icons.play_circle_filled,
                            size: 100,
                            color: Colors.white70,
                          ))
                    ]),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      // argus.name.toString(),
                      'name',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      '(4.4)',
                      // argus.releaseDate.toString().substring(0, 4),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),

                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.height * 0.14,
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Image.asset(
                          'assets/images/photoslider.png',
                          // path + argus.posterPath.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              // argus.overFlow.toString(),
                              'des',
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  '4.4',
                                  // argus.voteAverage!.toStringAsFixed(1),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'More Like This',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),

                  // Text(argus.results.originalLanguage.toString(), style: TextStyle(color: Colors.white),),
                  // Text(argus.results.originalTitle.toString(), style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
