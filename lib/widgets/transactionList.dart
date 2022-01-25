import 'package:expensetracker/models/transaction.dart';
import 'package:expensetracker/widgets/transactionItem.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraint) {
            return Column(
              children: <Widget>[
                Text('No Transactions has been added!',
                    style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 20),
                Container(
                  height: constraint.maxHeight * 0.6,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(transaction: transactions[index], deleteTransaction: deleteTransaction);
            },
            itemCount: transactions.length,
          );
  }
}
