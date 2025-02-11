import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${transaction.amount}'),
            ),
          ),
        ),
        title: Text(
            transaction.title,
            style: Theme.of(context).textTheme.headline6),
        subtitle: Text(DateFormat('yyyy-MM-dd').format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 460 ?
        FlatButton.icon(
            onPressed: () => deleteTransaction(transaction.id),
            icon: Icon(Icons.delete),
            textColor: Theme.of(context).errorColor,
            label: Text('Delete')):
        IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => deleteTransaction(transaction.id),),
      ),
    );
  }
}
