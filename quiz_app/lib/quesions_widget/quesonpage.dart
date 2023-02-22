import 'package:flutter/material.dart';

import 'package:quiz_app/models/quesions.dart';
import './quesionshow.dart';
import './showanswerpage.dart';

class QuesionPage extends StatefulWidget {
  var index = 0;

  @override
  State<QuesionPage> createState() => _QuesionPageState();
}

class _QuesionPageState extends State<QuesionPage> {
  void _increment() {
    setState(() {
      widget.index++;
      if (widget.index >= getModelQuesions.length) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return ShowAnswerPage();
        }));
      }
    });
  }

  int get getIndex {
    return widget.index;
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
                QuesionDispaly(getQuesions: getModelQuesions, index: getIndex),
                SizedBox(height: 50),
                SizedBox(
                  height: 52,
                  width: 197,
                  child: ElevatedButton(
                    onPressed: _increment,
                    child: Text("Next Quesion"),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27))),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(112, 213, 21, 1)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                const Text(
                    "_____________________________________________________________",
                    style: TextStyle(color: Colors.grey)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      "All rights reseved:Abdifitah.Abdulkadir",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "BadScript",
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "V.1.0",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "UbuntuCondensed",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}
