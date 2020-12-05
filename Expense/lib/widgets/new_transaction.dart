import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submit() {
    final eneteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(eneteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      eneteredTitle, 
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title',),
                controller: titleController,
                onSubmitted: (_) => submit(),
                // onChanged: (value) {
                //   titleInput = value;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount',),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submit(),
                // onChanged: (value) => amountInput = value,
              ),
              FlatButton(
                child: Text('Add Transaction'), 
                textColor: Colors.purple,
                onPressed: submit,
              ),
            ],),
          ),);
  }
}