import 'package:flutter/material.dart';
import '../constants/colors.dart';

class NavigationBar extends StatelessWidget {
  final int pageControl;
  final Function backPage;
  final Function nextPage;
  final int controlPage;
  final int totalPages;

  NavigationBar(
    this.pageControl,
    this.backPage,
    this.nextPage,
    this.controlPage,
    this.totalPages,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      child: Row(
        children: [
          Container(
            width: size.width * 0.33,
            padding: EdgeInsets.only(
              left: 30,
            ),
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                (pageControl > 1) ? backPage() : null;
              },
              icon: Icon(Icons.arrow_back_ios_rounded),
              color: (pageControl > 1) ? myPrimaryColor : Colors.grey,
              iconSize: 40,
            ),
          ),
          Container(
            width: size.width * 0.33,
            alignment: Alignment.center,
            child: Text(
              "$controlPage de $totalPages",
              style: TextStyle(
                color: myTextPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: size.width * 0.33,
            padding: EdgeInsets.only(
              right: 30,
            ),
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                nextPage();
              },
              icon: Icon(Icons.arrow_forward_ios_rounded),
              color: myPrimaryColor,
              iconSize: 40,
            ),
          ),
        ],
      ),
    );
  }
}
