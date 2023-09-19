import 'package:flup/notifiers/AddPageState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/expense.dart';
import '../models/person.dart';
import '../notifiers/MyAppStateNotifier.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var addPageState = context.watch<AddPageState>();

    return Form(
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'What did you pay?',
                    labelText: 'Expense title',
                  ),
                  controller: addPageState.expenseController,
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
                  controller: addPageState.priceController,
                ),
                SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    Text("Paid by"),
                    SizedBox(width: 50),
                    DropdownButton(
                        // Initial Value
                        value: addPageState.paidBy,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: appState.members.map((Person person) {
                          return DropdownMenuItem(
                            value: person,
                            child: Text(person.name),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (Person? newPerson) {
                          if (newPerson != null) {
                            addPageState.setPaidBy(newPerson);
                          }
                        }),
                  ],
                ),
                Text('Paid for'),
                ListView(
                  shrinkWrap: true,
                  children:
                      addPageState.paidFor.keys.map((Person? paidForPerson) {
                    return CheckboxListTile(
                      title: Text(paidForPerson!.name),
                      value: addPageState.paidFor[paidForPerson],
                      onChanged: (bool? isChecked) {
                        if (isChecked != null) {
                          addPageState.setPaidFor(isChecked, paidForPerson);
                        }
                      },
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: () {
                    List<Person> paidForSelected = [];
                    for (var person in addPageState.paidFor.keys) {
                      if (addPageState.paidFor[person] == true) {
                        paidForSelected.add(person);
                      }
                    }

                    appState.addExpense(Expense(
                        Uuid().v4().toString(),
                        int.parse(addPageState.priceController.text),
                        addPageState.expenseController.text,
                        addPageState.paidBy,
                        paidForSelected));
                  },
                  child: Text('Add'),
                ),
                // Add TextFormFields and ElevatedButton here.
              ],
            ),
          ),
        ),
      ),
    );
  }
}
