import 'package:flutter/material.dart';

import 'package:quiz_app/quesions_widget/quesonpage.dart';

class IntroPageBox extends StatefulWidget {
  @override
  State<IntroPageBox> createState() => _IntroPageBoxState();
}

class _IntroPageBoxState extends State<IntroPageBox> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(left: 35),
        height: 154,
        width: 280,
        decoration: BoxDecoration(
          color: Theme.of(context).textTheme.bodyMedium!.color,
          borderRadius: BorderRadius.circular(46),
        ),
        child: Column(children: [
          Text(
            "Quiz App",
            style: TextStyle(
              fontFamily: "JotiOne",
              fontSize: 40,
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.question_mark_outlined,
                    color: Theme.of(context).textTheme.bodySmall!.color,
                    size: 80,
                  )),
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.check,
                    color: Theme.of(context).textTheme.bodySmall!.color,
                    size: 80,
                  )),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ]),
      ),
      const SizedBox(
        height: 120,
      ),
      Container(
        margin: const EdgeInsets.only(left: 20),
        child: SizedBox(
          height: 50,
          width: 320,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return QuesionPage();
              }));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).textTheme.bodyMedium!.color,
                ),
                alignment: Alignment.center,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(27),
                ))),
            child: Text(
              "get Started",
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodySmall!.color,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ]);
  }
}
