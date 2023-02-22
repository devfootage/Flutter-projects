import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Widgets/chart_bars.dart';

import '../Models/quesionsmodel.dart';

class Chart extends StatelessWidget {
  List<Quesions> getQuesions;

  Chart({required this.getQuesions});

  List<Map<String, Object>> get charData {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      // sum of the lists
      double total = 0;
      if (index >= getQuesions.length) return {"day": "Not", "amount": 0};

      for (int k = 0; k < getQuesions.length; k++) {
        if (getQuesions[k].date?.day == weekDay.day &&
            getQuesions[k].date?.month == weekDay.month &&
            getQuesions[k].date?.year == weekDay.year) {
          total += getQuesions[index].amount!;
        }
      }

      return {
        "day": formatDate(weekDay, [D]),
        "amount": total
      };
    }).reversed.toList();
  }

  double get totalPercentage {
    return charData.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as num);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...charData.map((element) {
            return ChartBars(
                labelBar: element['day'].toString().substring(0, 1),
                spendingAmount: element['amount'],
                spendingPercentage: totalPercentage == 0.0
                    ? 0.0
                    : (element['amount'] as num) / totalPercentage);
          })
        ],
      ),
    );
  }
}
