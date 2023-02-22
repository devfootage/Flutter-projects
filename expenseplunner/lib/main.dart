import 'package:flutter/material.dart';

import '../Widgets/chart.dart';
import 'Models/quesionsmodel.dart'; /*userdefined imports */
import 'Widgets/new_transaction.dart';
import 'Widgets/transaction_list.dart';

void main() => runApp(MaterialApp(home: Expense()));

class Expense extends StatefulWidget {
  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<Quesions> _quesions = [
    Quesions(
        id: DateTime.now().toString(),
        title: "Shoping Bill",
        amount: 400,
        date: DateTime.now()),
    Quesions(
        id: DateTime.now().toString(),
        title: "School Fee",
        amount: 300,
        date: DateTime.now().subtract(const Duration(days: 1))),
    Quesions(
        id: DateTime.now().toString(),
        title: "Universtiy fee",
        amount: 200,
        date: DateTime.now().subtract(const Duration(days: 2))),
    Quesions(
        id: DateTime.now().toString(),
        title: "Masjid",
        amount: 400,
        date: DateTime.now().subtract(Duration(days: 3))),
    Quesions(
        id: DateTime.now().toString(),
        title: "College fee",
        amount: 500,
        date: DateTime.now().subtract(Duration(days: 4))),
    Quesions(
        id: DateTime.now().toString(),
        title: "Famirly fee",
        amount: 270,
        date: DateTime.now().subtract(Duration(days: 5))),
  ];

  void _addNewItem(String title, double amount, DateTime date) {
    if (title.isEmpty || amount <= 0) return;

    Quesions newQuesions = Quesions(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date);

    setState(() {
      _quesions.add(newQuesions);
    });
    Navigator.of(context).pop;
  }

  void _addItem(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (contx) {
          return NewTranasaction(_addNewItem);
        });
  }

  /*
  we are calculating the last 7 days transactions and then pass to the chartApp
  * we are using getting and check if the date of each transaction is after now or today -7
   */

  List<Quesions> get _recentTransactions {
    if (_quesions.isEmpty) return [];

    return _quesions.where((element) {
      return element.date!.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

// let us create a new method for deleting the list from lists

  void _deleteTransaction(String transaction_id) {
    setState(() {
      _quesions.removeWhere((element) => transaction_id == element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.purple,
          primarySwatch: Colors.purple,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            bodyMedium: TextStyle(
              color: Colors.black,
            ),
            bodySmall: TextStyle(
              color: Colors.white,
            ),
          ),

          //fontFamily:
        ),
        home: Scaffold(
          appBar: AppBar(
            actions: [
              FloatingActionButton(
                onPressed: () => _addItem(context),
                child: Icon(Icons.add),
              )
            ],
            title: const Text("Personal Expense"),
          ),
          body: SingleChildScrollView(
              child: Container(
                  child: Column(children: [
            Chart(getQuesions: _recentTransactions),
            Transaction_list(
                getQuesions: _quesions, deleteTransaction: _deleteTransaction),
          ]))),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addItem(context),
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ));
  }
}
