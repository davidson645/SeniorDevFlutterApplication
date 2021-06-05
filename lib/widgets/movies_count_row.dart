import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/movies_count.dart';

class MoviesCountRow extends StatelessWidget {
  final MoviesCount moviesCount;

  MoviesCountRow(
    this.moviesCount,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final int moviesTotal = moviesCount.total;
    final double myCardHeight = 80;

    return Container(
      //color: Colors.amber,
      height: size.height,
      padding: EdgeInsets.only(
        top: 10,
        left: 20,
        right: 10,
      ),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: size.width * 0.70,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Card(
                        elevation: 10,
                        shadowColor: myPrimaryColor,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            moviesTotal.toString(),
                            style: TextStyle(
                              color: myPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 42,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        "FILMES \nENCONTRADOS",
                        style: TextStyle(
                          color: myPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: myCardHeight,
            width: size.width * 0.2,
            child: ListView.builder(
              padding: EdgeInsets.only(
                top: 0,
              ),
              itemCount: moviesCount.moviesByYear.length,
              itemBuilder: (context, index) {
                return Container(
                  height: myCardHeight * 0.45,
                  child: Card(
                    elevation: 1,
                    child: Row(
                      children: [
                        Container(
                          height: myCardHeight * 0.85,
                          padding: EdgeInsets.only(
                            top: 8,
                            left: 10,
                          ),
                          child: Text(
                            moviesCount.moviesByYear[index]["year"].toString(),
                            style: TextStyle(
                              color: myPrimaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          height: myCardHeight * 0.85,
                          padding: EdgeInsets.only(
                            top: 8,
                            left: 10,
                          ),
                          child: Text(
                            moviesCount.moviesByYear[index]["movies"]
                                .toString(),
                            style: TextStyle(
                              color: myPrimaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
