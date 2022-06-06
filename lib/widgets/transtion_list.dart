import 'package:flutter/material.dart';
import 'package:outcome_money/models/transaction.dart';

import 'list_button_widges.dart';

class TranstionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransactions;
  TranstionList(this.transactions, this.deleteTransactions);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Listbuttonwidges(transactions: transactions[index], deleteTransactions: deleteTransactions);
      },
      itemCount: transactions.length,
    );
  }
}

