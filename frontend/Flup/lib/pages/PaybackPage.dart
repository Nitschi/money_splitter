import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifiers/MyAppStateNotifier.dart';

class PaybackPage extends StatelessWidget {
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
              '${appState.expenses.length} expense(s) and it is payback time:'),
        ),
        for (var transaction in appState.payback)
          ListTile(
            title: Text(
                '${transaction.fromDebtor.name} pays ${transaction.amount}'),
            subtitle: Text('to ${transaction.toSponsor.name}'),
          ),
      ],
    );
  }
}
