import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movies.dart';
import '../models/movies_count.dart';

import '../constants/routes.dart';
import '../constants/serverProperties.dart';

import '../widgets/movies_list_future.dart';
import '../widgets/home_header.dart';
import '../widgets/movies_count_future.dart';
import '../widgets/navigation_bar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FocusNode _myFocusNode;
  late Future<Movies> _moviesFuture;
  late Future<MoviesCount> _moviesCountFuture;
  bool _searching = false;
  bool _searchFocus = false;
  final _searchController = TextEditingController();
  int _pageControl = 1;
  int _totalPages = 1;

  @override
  void initState() {
    super.initState();
    _myFocusNode = FocusNode();
    _moviesFuture = _getMovies(_searchController.text, _pageControl);
    _moviesCountFuture = _getMoviesCount(_searchController.text);
  }

  @override
  void dispose() {
    _myFocusNode.dispose();
    super.dispose();
  }

  Future<MoviesCount> _getMoviesCount(String searchedTitle) async {
    var uri;
    http.Response response;
    Map<String, String> _queryParam = {
      'Title': searchedTitle,
    };
    if (_queryParam['Title'].toString() == '') {
      uri = Uri.http('$serverIP:$serverPort', routeMoviesCount);
    } else {
      uri = Uri.http('$serverIP:$serverPort',
          routeMoviesCount + _queryParam['Title'].toString());
    }
    response = await http.get(uri);
    if (response.statusCode < 200 || response.statusCode > 299) {
      //print("uri:$uri - statusCode: ${response.statusCode}");
      print("Exception uri:$uri - ${response.statusCode}");
      throw Exception(
          'Failed to retrieve data. uri:$uri - ${response.statusCode}');
    }
    return MoviesCount.fromJson(jsonDecode(response.body));
  }

  Future<Movies> _getMovies(String searchedTitle, int page) async {
    var uri;
    http.Response response;
    Map<String, String> _queryParam = {
      'Title': searchedTitle,
      'page': page.toString(),
    };
    if (_queryParam['Title'].toString() == '' &&
        _queryParam['page'].toString() == '') {
      uri = Uri.http('$serverIP:$serverPort', routeMovies);
    } else if (_queryParam['Title'].toString() == '') {
      uri = Uri.http('$serverIP:$serverPort',
          routeMovies + 'page=' + _queryParam['page'].toString());
    } else if (_queryParam['page'].toString() == '') {
      uri = Uri.http('$serverIP:$serverPort',
          routeMovies + _queryParam['Title'].toString());
    } else if (_queryParam['Title'].toString() != '' &&
        _queryParam['page'].toString() != '') {
      uri = Uri.http(
        '$serverIP:$serverPort',
        routeMovies +
            _queryParam['Title'].toString() +
            '/' +
            _queryParam['page'].toString(),
      );
    }

    print(_queryParam);
    response = await http.get(uri);
    if (response.statusCode < 200 || response.statusCode > 299) {
      print("Exception uri:$uri - ${response.statusCode}");
      throw Exception(
          'Failed to retrieve data. uri:$uri - ${response.statusCode}');
    }
    setState(() {
      _totalPages = jsonDecode(response.body)["total_pages"];
    });

    return Movies.fromJson(jsonDecode(response.body));
  }

  void _search() {
    _searching = true;
    _searchFocus = false;
    String searchedtitle = _searchController.text;
    if (searchedtitle == "") {
      _searching = false;
    }
    _pageControl = 1;

    _moviesFuture = _getMovies(
      searchedtitle,
      _pageControl,
    );
    _moviesCountFuture = _getMoviesCount(searchedtitle);
    setState(() {});
  }

  void _nextPage() {
    String searchedtitle = _searchController.text;
    _pageControl += 1;
    _moviesFuture = _getMovies(
      searchedtitle,
      _pageControl,
    );
    setState(() {});
  }

  void _backPage() {
    String searchedtitle = _searchController.text;
    _pageControl -= 1;
    _moviesFuture = _getMovies(
      searchedtitle,
      _pageControl,
    );
    setState(() {});
  }

  void _inputChanged() {
    setState(() {
      _searchFocus = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HomeHeader(
              _myFocusNode,
              _search,
              _searchController,
              _inputChanged,
            ),
            MoviesCountFuture(
              _moviesCountFuture,
              _searching,
            ),
            MoviesListFuture(
              _moviesFuture,
              _searching,
            ),
            NavigationBar(
              _pageControl,
              _backPage,
              _nextPage,
              _pageControl,
              _totalPages,
            ),
          ],
        ),
      ),
    );
  }
}
