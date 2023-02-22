import 'package:flutter/material.dart';

class ChartBars extends StatelessWidget {
  final labelBar;
  final spendingAmount;
  final spendingPercentage;

  ChartBars(
      {required this.labelBar,
      required this.spendingAmount,
      required this.spendingPercentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
          width: 40,
          child: FittedBox(
            child: Text(
              "\$${spendingAmount.toStringAsFixed(0).toString().length > 4 ? spendingAmount.toStringAsFixed(0).toString().substring(0, 2) + "." : spendingAmount.toStringAsFixed(0)}",
            ),
          ),
        ),
        // container
        Container(
          height: 70,
          width: 13,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(
          labelBar,
          style:
              TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color),
        ),
        SizedBox(height: 4),
      ],
    );
  }
}
