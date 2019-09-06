import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final Function txAdder;

  const NewTransaction({Key key, @required this.txAdder}) : super(key: key);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {

    void _addTransaction() {
      var enteredText = titleController.text;
      var enteredAmount = double.parse(amountController.text);

      if (enteredText.isEmpty || enteredAmount <= 0) {
        return;
      }

      widget.txAdder(enteredText, enteredAmount);

      Navigator.of(context).pop();
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
              textColor: Theme.of(context).primaryColor,
              onPressed: () => _addTransaction(),
            )
          ],
        ),
      ),
    );
  }
}
