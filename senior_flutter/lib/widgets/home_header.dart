import 'package:flutter/material.dart';

import '../constants/colors.dart';

class HomeHeader extends StatelessWidget {
  final FocusNode myFocusNode;
  final Function search;
  final Function inputChanged;
  final TextEditingController searchController;

  HomeHeader(
    this.myFocusNode,
    this.search,
    this.searchController,
    this.inputChanged,
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.26,
      child: Stack(
        children: <Widget>[
          Container(
            width: size.width,
            height: (size.height * 0.26) - 27,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/senior_logo.png',
                  fit: BoxFit.contain,
                  width: 70,
                  height: 70,
                ),
                Text(
                  'Sênior - Dev. Flutter',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 54,
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 10,
                      color: myPrimaryColor.withOpacity(0.3)),
                ],
              ),
              child: TextField(
                focusNode: myFocusNode,
                controller: searchController,
                onSubmitted: (_) => search(),
                onChanged: (_) => inputChanged(),
                style: TextStyle(
                  color: myTextPrimaryColor,
                ),
                decoration: InputDecoration(
                  hintText: 'Pesquisar filme',
                  hintStyle: TextStyle(
                    color: myPrimaryColor.withOpacity(0.5),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: myPrimaryColor.withOpacity(0.4),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
