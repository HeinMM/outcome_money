import 'package:flutter/material.dart';
import 'package:outcome_money/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:outcome_money/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> userRecentTransaction;
  Chart(this.userRecentTransaction);
  List<Map<String, Object>> get recentTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;
      for (var i = 0; i < userRecentTransaction.length; i++) {
        if (userRecentTransaction[i].date.day == weekDay.day &&
            userRecentTransaction[i].date.month == weekDay.month &&
            userRecentTransaction[i].date.year == weekDay.year) {
          totalSum += userRecentTransaction[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpanding {
    return recentTransaction.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(recentTransaction);
    return Card(
      elevation: 7,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: recentTransaction.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data['day'],
                spendingAmoung: data['amount'],
                spendingPctOfTotal: totalSpanding==0.0?0.0: (data['amount'] as double) / totalSpanding,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
