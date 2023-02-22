import 'package:flutter/material.dart';

import 'introPage.text.dart';
import 'intropagebox.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [IntroPageTxt(), IntroPageBox()],
      ),
    );
  }
}
