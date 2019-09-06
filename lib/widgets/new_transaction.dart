import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final Function txAdder;

  const NewTransaction({Key key, @required this.txAdder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    void _addTransaction() {
      var enteredText = titleController.text;
      var enteredAmount = double.parse(amountController.text);

      if (enteredText.isEmpty || enteredAmount <= 0) {
        return;
      }

      txAdder(enteredText, enteredAmount);
    }

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
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => _addTransaction(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () => _addTransaction(),
            )
          ],
        ),
      ),
    );
  }
}
