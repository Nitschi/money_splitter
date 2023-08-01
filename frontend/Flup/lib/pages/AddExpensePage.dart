import 'package:flup/notifiers/AddPageState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/expense.dart';
import '../models/person.dart';
import '../notifiers/MyAppStateNotifier.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var addPageState = context.watch<AddPageState>();
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
              DropdownButton(
                  // Initial Value
                  value: addPageState.paidBy,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: addPageState.people.map((Person person) {
                    return DropdownMenuItem(
                      value: person,
                      child: Text(person.name),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (Person? newPerson) {
                    addPageState.setPaidBy(newPerson);
                  }),
              ElevatedButton(
                onPressed: () {
                  appState.addExpense(Expense(
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
