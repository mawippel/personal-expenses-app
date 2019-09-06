import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({Key key, @required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
                child: Text(
                  '\$ ${tx.amount.toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tx.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy hh:mm').format(tx.date),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
