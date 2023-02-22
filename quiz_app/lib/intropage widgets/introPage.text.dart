import 'package:flutter/material.dart';

class IntroPageTxt extends StatelessWidget {
  final _fontFarmily = "Italiana";
  final double _fontsize = 36;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      margin: EdgeInsets.only(top: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Have a fun",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium!.color,
              fontFamily: _fontFarmily,
              fontSize: _fontsize,
            ),
          ),
          Text(
            "Improving Idea",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium!.color,
              fontFamily: _fontFarmily,
              fontSize: _fontsize,
            ),
          ),
          Text(
            "Featured Quiries",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium!.color,
              fontFamily: _fontFarmily,
              fontSize: _fontsize,
            ),
          ),
        ],
      ),
    );
  }
}
