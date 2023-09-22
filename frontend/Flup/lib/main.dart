import 'package:flup/pages/AddExpensePage.dart';
import 'package:flup/pages/BalancePage.dart';
import 'package:flup/pages/ExpensesPage.dart';
import 'package:flup/pages/PaybackPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifiers/AddPageState.dart';
import 'notifiers/MyAppStateNotifier.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Flup',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = ChangeNotifierProvider(
          create: (context) => AddPageState(appState.members),
          child: AddPage(),
        );
        break;
      case 1:
        page = ExpensesPage();
        break;
      case 2:
        page = BalancePage();
        break;
      case 3:
        page = PaybackPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.add),
                    label: Text('Add'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.attach_money),
                    label: Text('Expenses'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.scale),
                    label: Text('Balance'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.handshake),
                    label: Text('Payback'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                    switch (selectedIndex) {
                      case 0: // Add Page
                        break;
                      case 1: // Expenses Page
                      case 2: // Balance Page
                        appState.updateExpenses();
                        break;
                      case 3:
                        appState.updateExpenses();
                        appState.updatePayback();
                        break;
                      default:
                    }
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
