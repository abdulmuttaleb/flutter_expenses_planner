import 'dart:io';

import 'package:expneses_planner/widgets/adaptive_flat_button.dart';
import 'package:expneses_planner/widgets/adaptive_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {

  final Function addTransactionHandler;

  NewTransaction(this.addTransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void submitData(){
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null){
      return;
    }

    widget.addTransactionHandler(enteredTitle, enteredAmount, _selectedDate);

    Navigator.pop(context);
  }

  void _presentDatePicker(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now()
    ).then((selectedDate) {
      if(selectedDate == null){
        return;
      }
      setState(() {
        _selectedDate = selectedDate;
      });
      print(selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Platform.isIOS ?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoTextField(
                  placeholder: 'Title',
                  controller: _titleController,
                  onSubmitted: (_) => submitData,
                ),
              ):
              TextField(
                decoration: InputDecoration(
                    labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => submitData,
              ),
              Platform.isIOS ?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoTextField(
                  placeholder: 'Amount',
                  controller: _amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted:(_) => submitData,
                ),
              )    :
              TextField(
                decoration: InputDecoration(
                    labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number ,
                onSubmitted: (_) => submitData,
              ),
              Container(
                height: 70,
                margin: Platform.isIOS ? EdgeInsets.symmetric(horizontal: 8.0): EdgeInsets.symmetric(horizontal: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(_selectedDate == null ? 'No Date Chosen!' : DateFormat('yyyy-MM-dd').format(_selectedDate)),
                    AdaptiveFlatButton('Choose Date', _presentDatePicker)
                  ],
                ),
              ),
              AdaptiveRaisedButton('Add Transaction', submitData)
            ],
          ),
        ),
      ),
    );
  }
}
