import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function txAdder;

  const NewTransaction({Key key, @required this.txAdder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                txAdder(titleController.text, double.parse(amountController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
