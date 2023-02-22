import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'intropage.dart';

class HomeBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(46)),
        image: DecorationImage(
          image: AssetImage("./assets/images/homeimage.png"),
          fit: BoxFit.contain,
        ),
      ),
      child: IntroPage(),
    );
  }
}
