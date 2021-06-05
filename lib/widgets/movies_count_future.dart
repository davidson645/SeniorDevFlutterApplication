import 'package:flutter/material.dart';
import 'movies_count_row.dart';

import '../models/movies_count.dart';
import '../widgets/loading_indicator.dart';

class MoviesCountFuture extends StatelessWidget {
  final Future<MoviesCount> moviesCountFuture;
  final bool searching;

  MoviesCountFuture(
    this.moviesCountFuture,
    this.searching,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (searching) {
      return Container(
        child: Container(
          height: size.height * 0.12,
          width: size.width,
          child: FutureBuilder<MoviesCount>(
            future: moviesCountFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return LoadingIndicator();
              }
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              if (snapshot.hasData) {
                return Container(
                  child: MoviesCountRow(
                    snapshot.data!,
                  ),
                );
              }
              return LoadingIndicator();
            },
          ),
        ),
      );
    } else
      return Text("");
  }
}
