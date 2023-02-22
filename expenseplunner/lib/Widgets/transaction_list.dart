import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Models/quesionsmodel.dart';

class Transaction_list extends StatelessWidget {
  List<Quesions> getQuesions;
  Function deleteTransaction;

  Transaction_list(
      {required this.getQuesions, required this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: getQuesions.isEmpty
            ? Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "No Transacton is Added Yet",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 20),
                  Container(
                      height: 200,
                      child: Image.asset("assets/images/waiting.png",
                          fit: BoxFit.cover))
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 30,
                        child: Text(
                          getQuesions[index]
                                      .amount!
                                      .toStringAsFixed(2)
                                      .toString()
                                      .length >
                                  4
                              ? getQuesions[index]
                                      .amount!
                                      .toStringAsFixed(2)
                                      .toString()
                                      .substring(0, 4) +
                                  ".."
                              : getQuesions[index].amount!.toStringAsFixed(2),
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color),
                        ),
                      ),
                      title: Text(getQuesions[index].title.toString(),
                          style: Theme.of(context).textTheme.titleLarge),
                      subtitle: Text(
                        formatDate(getQuesions[index].date as DateTime,
                            [MM, '-', dd, '-', yyyy]),
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: IconButton(
                        onPressed: () =>
                            deleteTransaction(getQuesions[index].id.toString()),
                        icon: Icon(Icons.delete, color: Colors.red, size: 30),
                      ),
                    ),
                  );
                },
                itemCount: getQuesions.length,
              ));
  }
}
