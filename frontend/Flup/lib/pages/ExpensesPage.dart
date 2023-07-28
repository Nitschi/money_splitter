import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifiers/MyAppStateNotifier.dart';

class ExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    appState.updateExpenses();

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
            title: Text(
                '${expense.title} for ${expense.price} ${expense.currency} paid by ${expense.paidBy.name}'),
          ),
      ],
    );
  }
}
