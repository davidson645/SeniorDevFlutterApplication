import 'package:flutter/material.dart';
import '../models/movies.dart';
import '../widgets/loading_indicator.dart';
import './movies_list.dart';

class MoviesListFuture extends StatelessWidget {
  final Future<Movies> moviesFuture;
  final bool searching;

  MoviesListFuture(
    this.moviesFuture,
    this.searching,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double myContainerHeightPerc;
    if (searching) {
      myContainerHeightPerc = 0.54;
    } else {
      myContainerHeightPerc = 0.65;
    }
    return Container(
      height: size.height * myContainerHeightPerc,
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: FutureBuilder<Movies>(
        future: moviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return LoadingIndicator();
          }
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          if (snapshot.hasData) {
            return MoviesList(
              snapshot.data!,
            );
          }
          return LoadingIndicator();
        },
      ),
    );
  }
}
