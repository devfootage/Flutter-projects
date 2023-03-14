import 'package:flutter/material.dart';

// user defined imports
import 'package:quiz_app/quesions_widget/showanswerpage.dart';

class QuesionDispaly extends StatelessWidget {
  final List<Map<String, Object>> getQuesions;
  var index;
  Function? total;

  QuesionDispaly({this.total, required this.getQuesions, this.index});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 50,
      ),
      Text(
        "Quesion:${index + 1 <= getQuesions.length ? index + 1 : getQuesions.length}/${getQuesions.length}",
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontFamily: "TitilliumWeb"),
      ),
      const Text(
        "__________________________________________________________",
        style: TextStyle(color: Colors.white),
      ),
      Row(
        children: [
          Text(
            getQuesions[index <= getQuesions.length - 1
                ? index
                : getQuesions.length - 1]["quesion"] as String,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: "UbuntuCondensed",
              fontSize: 20,
            ),
          ),
          const Icon(
            Icons.question_mark,
            color: Colors.white,
            size: 25,
          ),
        ],
      ),
      ...(getQuesions[index <= getQuesions.length - 1
              ? index
              : getQuesions.length - 1]["answer"] as List<Map<Object, Object>>)
          .map((element) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                height: 40,
                width: 337,
                child: ElevatedButton(
                  onPressed: () {
                    total;
                    ShowAnswerPage(total);
                  },
                  child: Text(
                    element["answerText"].toString(),
                    style: TextStyle(
                      fontFamily: "SairaSemiCondensed",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11))),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(36, 16, 71, 1)),
                  ),
                ),
              ),
            ),
          ],
        );
      }).toList()
    ]);
  }
}
