import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'transaction_list_item.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty ?
    LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Text(
              'No Transactions added yet!',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: constraints.maxHeight * 0.6,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,))
          ],
        );
      }
    ): ListView.builder(
      itemBuilder: (ctx, index) {
        return TransactionListItem(transaction: transactions[index], deleteTransaction: deleteTransaction);
      },
      itemCount: transactions.length,
    );

  }
}

