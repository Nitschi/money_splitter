import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifiers/MyAppStateNotifier.dart';

class ExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.expenses.isEmpty) {
      return Center(
        child: Text('No expenses yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.expenses.length} expenses:'),
        ),
        for (var expense in appState.expenses)
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                appState.removeExpense(expense);
              },
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${expense.title}',
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text(
                    '${expense.price} ${expense.currency}',
                    textAlign: TextAlign.right,
                  ),
                ]),
            subtitle: Row(children: [
              Expanded(
                child: Text('for ${expense.paidFor.map((p) {
                  return p.name;
                })}'),
              ),
              Text('paid by ${expense.paidBy.name}'),
            ]),
          ),

        // TODO: use circleavatar with first 2 letters for each user instead of name
        /*CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text(
                      'Sun',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),*/
      ],
    );
  }
}
