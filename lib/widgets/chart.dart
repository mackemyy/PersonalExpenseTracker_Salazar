import 'package:expensetracker/models/transaction.dart';
import 'package:expensetracker/widgets/barChart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> weeklyTransactions;

  Chart(this.weeklyTransactions) {
    print('Constructor Chart');
  }

  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalExpenditure = 0.00;

      for (var i = 0; i < weeklyTransactions.length; i++) {
        if (weeklyTransactions[i].date.day == weekday.day &&
            weeklyTransactions[i].date.month == weekday.month &&
            weeklyTransactions[i].date.year == weekday.year) {
          totalExpenditure += weeklyTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekday));
      print(totalExpenditure);

      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalExpenditure
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build() Chart');
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: BarChart(
                  data['day'],
                  data['amount'],
                  totalSpending == 0
                      ? 0
                      : (data['amount'] as double) / totalSpending
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
