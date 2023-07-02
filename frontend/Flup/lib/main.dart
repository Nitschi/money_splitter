import 'package:flup/generated_code/lib/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';
import 'package:provider/provider.dart';

void main() {
  final expenses = ExpensesApi().getExpenses();

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

class MyAppState extends ChangeNotifier {
  List<Expense> expenses = [];

  void removeExpense(Expense expense) {
    expenses.remove(expense);
    notifyListeners();
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
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = AddPage();
        break;
      case 1:
        page = ExpensesPage();
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
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
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
            title: Text(
                '${expense.title} for ${expense.price} ${expense.currency} paid by ${expense.person}'),
          ),
      ],
    );
  }
}

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

class Expense {
  int price = 0;
  String title = "";
  final currency = "CHF";
  final person = "me";

  Expense(this.price, this.title);
}

@Openapi(
    additionalProperties:
        AdditionalProperties(pubName: 'test_api', pubAuthor: 'Johnny dep'),
    inputSpecFile: 'lib/swaggers/swagger1.json',
    generatorName: Generator.dart,
    outputDirectory: 'lib/generated_code')
class Example extends OpenapiGeneratorConfig {}
