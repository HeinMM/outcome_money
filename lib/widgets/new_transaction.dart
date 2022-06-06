import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titalController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void smittedData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    String title = _titalController.text;
    double amount = double.parse(_amountController.text);
    if (title == null || amount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(
      title,
      amount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((datePick) {
      if (datePick == null) {
        return;
      }
      _selectedDate = datePick;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titalController,
                onSubmitted: (_) => smittedData,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => smittedData,
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Choice'
                            : DateFormat.yMd().format(_selectedDate),
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    // ignore: deprecated_member_use
                    FlatButton(
                      child: Text(
                        'Choice Date',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      onPressed: _presentDatePicker,
                    ),
                  ],
                ),
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: smittedData,
                child: Text(
                  'Add Transation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
