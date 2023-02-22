import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class NewTranasaction extends StatefulWidget {
  final Function addNewItem;

  NewTranasaction(this.addNewItem);

  @override
  State<NewTranasaction> createState() => _NewTranasactionState();
}

class _NewTranasactionState extends State<NewTranasaction> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountcontroller = TextEditingController();
  var _datePick;

  void doSubmittion() {
    if (_amountcontroller.text.isEmpty) return;

    final String title = _titleController.text;
    final double amount = double.parse(_amountcontroller.text);

    if (title.isEmpty || amount <= 0 || _datePick == null)
      return;
    else {
      widget.addNewItem(title, amount, _datePick);
    }
  }
  /*
  *instead of showModelBottomSheet Here we use  showDataPicker which pop ups
  * the date pciker so you can pick up your date
   */

  void _showDataPicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((datePicked) {
      if (datePicked == null)
        return;
      else {
        setState(() {
          _datePick = datePicked;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          decoration: InputDecoration(labelText: "Titlte"),
          keyboardType: TextInputType.text,
          controller: _titleController,
          onSubmitted: (_) => doSubmittion,
        ),
        TextField(
          decoration: InputDecoration(labelText: "amount"),
          keyboardType: TextInputType.number,
          controller: _amountcontroller,
          onSubmitted: (_) => doSubmittion,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FittedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    _datePick == null
                        ? "No date choosen"
                        : formatDate(_datePick, [M, '-', dd, '-', yyyy]),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 70,
              ),
              Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: _showDataPicker,
                    child: Text(
                      "Choose Date",
                      style: TextStyle(
                          color: Colors.purple,
                          backgroundColor: null,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ))
            ],
          ),
        ),
        ElevatedButton(
          onPressed: doSubmittion,
          child: Text("Submit"),
          style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor: MaterialStateProperty.all(Colors.purple),
          ),
        ),
      ],
    );
  }
}
