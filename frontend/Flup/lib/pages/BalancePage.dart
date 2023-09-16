import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifiers/MyAppStateNotifier.dart';

class BalancePage extends StatelessWidget {
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
              '${appState.expenses.length} expense(s) and your balance is:'),
        ),
        for (var member in appState.members)
          ListTile(
            title: Text(
                '${member.name} has a balance of ${appState.balance[member]}'),
          ),
      ],
    );
  }
}
