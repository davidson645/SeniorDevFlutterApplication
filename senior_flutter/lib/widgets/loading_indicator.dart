import 'package:flutter/material.dart';
import '../constants/colors.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          color: myPrimaryColor,
        ),
      ),
    );
  }
}
