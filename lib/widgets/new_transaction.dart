import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class NewTransaction extends StatefulWidget {

  final Function addTransactionHandler;

  NewTransaction(this.addTransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  @override
  Widget build(BuildContext context) {

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

      Navigator.of(context).pop();
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

    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true) ,
              onSubmitted: (_) => submitData,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text(_selectedDate == null ? 'No Date Chosen!' : _selectedDate.toString()),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text('Choose Date', style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              onPressed: submitData,
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            )
          ],
        ),
      ),
    );
  }
}
