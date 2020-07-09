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

    final titleController = TextEditingController();
    final amountController = TextEditingController();

    void submitData(){
      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);

      if(enteredTitle.isEmpty || enteredAmount <= 0){
        return;
      }

      widget.addTransactionHandler(enteredTitle, enteredAmount);

      Navigator.of(context).pop();
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
              controller: titleController,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true) ,
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: submitData,
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
