import 'package:flutter/material.dart';
import 'package:personal_expenses_app/transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          Column(
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
          )
        ],
      ),
    );
  }
}