import 'package:flutter/material.dart';
import 'package:personal_expenses_app/model/transaction.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';
import 'package:personal_expenses_app/widgets/transaction_list.dart';

class TransactionsWrapper extends StatefulWidget {
  TransactionsWrapper({Key key}) : super(key: key);

  _TransactionsWrapperState createState() => _TransactionsWrapperState();
}

class _TransactionsWrapperState extends State<TransactionsWrapper> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 15.88,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String title, double amount) {
    final newTx = new Transaction(
        id: '',
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          NewTransaction(
            txAdder: _addTransaction,
          ),
          TransactionList(
            transactions: _transactions,
          ),
        ],
      ),
    );
  }
}
