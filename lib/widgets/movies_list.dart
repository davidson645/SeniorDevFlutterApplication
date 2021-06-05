import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/movies.dart';

class MoviesList extends StatelessWidget {
  final Movies moviesMap;

  MoviesList(
    this.moviesMap,
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final double defaultMargin = 20;
    final double myCardHeight = 70;
    final double myTitleWidth = (size.width - (defaultMargin * 2)) * 0.62;
    final double myYearColumnWidth = (size.width - (defaultMargin * 2)) * 0.35;

    final double myYearHeight = myCardHeight * 0.60;
    final double myImdbHeight = myCardHeight * 0.24;

    return Container(
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: 5,
        ),
        itemCount: moviesMap.data.length,
        itemBuilder: (context, index) {
          return Container(
            height: myCardHeight,
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Card(
              elevation: 1,
              child: Row(
                children: [
                  //TITLE Section
                  Column(
                    children: [
                      Container(
                        height: myCardHeight * 0.85,
                        width: myTitleWidth,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text(
                          moviesMap.data[index]["Title"].toString(),
                          style: TextStyle(
                            color: myTextPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      //YEAR Section
                      Container(
                        width: myYearColumnWidth,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: myYearHeight,
                                  width: myYearColumnWidth,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(
                                    left: 70,
                                  ),
                                  child: Text(
                                    moviesMap.data[index]["Year"].toString(),
                                    style: TextStyle(
                                      color: myTextPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //IMDB Section
                            Row(
                              children: [
                                Container(
                                  height: myImdbHeight,
                                  width: myYearColumnWidth,
                                  padding: EdgeInsets.only(
                                    left: 40,
                                  ),
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "imdb: " +
                                        moviesMap.data[index]["imdbID"]
                                            .toString(),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
