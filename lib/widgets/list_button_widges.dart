import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:outcome_money/models/transaction.dart';


class Listbuttonwidges extends StatelessWidget {
  const Listbuttonwidges({
    Key key,
    @required this.transactions,
    @required this.deleteTransactions,
  }) : super(key: key);

  final Transaction transactions;
  final Function deleteTransactions;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: FittedBox(
              child: Text('\$${transactions.amount}'),
            ),
          ),
        ),
        title: Text(
          '${transactions.title}',
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle:
            Text('${DateFormat.yMMMd().format(transactions.date)}'),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                onPressed: () => deleteTransactions(transactions.id),
                label: Text('Delete'),
                icon: Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                onPressed: () => deleteTransactions(transactions.id),
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
