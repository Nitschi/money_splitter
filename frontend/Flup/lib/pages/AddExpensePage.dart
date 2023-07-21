import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/Expense.dart';
import '../notifiers/MyAppStateNotifier.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final expenseController = TextEditingController();
    final priceController = TextEditingController();

    return Form(
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'What did you pay?',
                  labelText: 'Expense title',
                ),
                controller: expenseController,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  hintText: 'How much was it?',
                  labelText: 'Price',
                ),
                controller: priceController,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  appState.expenses.add(Expense(
                      int.parse(priceController.text), expenseController.text));
                },
                child: Text('Add'),
              ),
              // Add TextFormFields and ElevatedButton here.
            ],
          ),
        ),
      ),
    );
  }
}
