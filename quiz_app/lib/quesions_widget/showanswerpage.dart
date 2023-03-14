import 'package:flutter/material.dart';

class ShowAnswerPage extends StatefulWidget {
  Function? getTototal;

  ShowAnswerPage([this.getTototal]);

  @override
  State<ShowAnswerPage> createState() => _MyShowAnswerPage();
}

class _MyShowAnswerPage extends State<ShowAnswerPage> {
  double get calculatetotal {
    double total = widget.getTototal as double;
    return total == null ? 0 : total;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(12, 3, 30, 1),
        appBar: AppBar(
            title: const Text("Quiz App",
                style: TextStyle(
                    fontFamily: "JotiOne",
                    fontWeight: FontWeight.bold,
                    fontSize: 38)),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(112, 213, 21, 1),
            toolbarHeight: 114,
            leading: const Image(
                image: AssetImage("assets/images/logo.png"),
                height: 70,
                fit: BoxFit.fill),
            actions: const [
              Icon(Icons.question_mark,
                  color: Color.fromRGBO(35, 16, 71, 1), size: 80)
            ]),
        body: Column(
          children: [
            SizedBox(height: 100),
            Container(
              margin: EdgeInsets.only(left: 40),
              height: 85,
              width: 324,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(112, 213, 21, 1),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Success",
                      style: TextStyle(
                        fontFamily: "UbuntuCondensed",
                        fontSize: 65,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.emoji_emotions,
                      size: 69.5,
                      color: Colors.yellow,
                    )
                  ]),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              height: 85,
              width: 324,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(112, 213, 21, 1),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Score:",
                      style: TextStyle(
                        fontFamily: "UbuntuCondensed",
                        fontSize: 65,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(calculatetotal.toString()),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
