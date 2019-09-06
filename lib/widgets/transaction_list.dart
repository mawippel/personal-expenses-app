import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({Key key, @required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.only(bottom: 20),
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transactions Added Yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColorLight,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy hh:mm')
                                .format(transactions[index].date),
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
              },
              itemCount: transactions.length,
            ),
    );
  }
}
