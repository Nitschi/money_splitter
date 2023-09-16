import 'package:flup_openapi_lib/api.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../mappers/expense_mapper.dart';
import '../models/expense.dart';
import '../models/person.dart';

class MyAppState extends ChangeNotifier {
  final apiClient = ApiClient(basePath: 'http://localhost:55555');
  List<Expense> expenses = [];
  List<Person> members = [
    Person(Uuid().v4().toString(), "Alexander"),
    Person(Uuid().v4().toString(), "Laura"),
    Person(Uuid().v4().toString(), "Johanna"),
    Person(Uuid().v4().toString(), "Mehrdad"),
    Person(Uuid().v4().toString(), "Hendrik"),
    Person(Uuid().v4().toString(), "Paul"),
    Person(Uuid().v4().toString(), "Adrian")
  ];

  Map<Person, double> balance = {};

  void setUpBalance() {
    for (var member in members) {
      balance[member] = 0;
    }
  }

  void calculateBalance() {
    setUpBalance();
    for (var member in balance.keys) {
      for (var expense in expenses) {
        if (expense.paidBy.id == member.id) {
          balance[member] = balance[member]! + expense.price;
        }
        if (expense.paidFor.map((e) => e.id).contains(member.id)) {
          balance[member] =
              balance[member]! - (expense.price / expense.paidFor.length);
        }
      }
    }
    notifyListeners();
  }

  void removeExpense(Expense expense) {
    expenses.remove(expense);
    // TODO update in BE
    calculateBalance();
    notifyListeners();
  }

  void addExpense(Expense expense) {
    expenses.add(expense);
    ExpensesApi(apiClient)
        .addExpense(expenseDto: ExpenseMapper.toExpenseDto(expense));
    calculateBalance();
    notifyListeners();
  }

  void updateExpenses() async {
    List<ExpenseDto>? expenseDtos = await ExpensesApi(apiClient).getExpenses();
    if (expenseDtos == null) {
      //TODO: handle error
      return;
    }
    expenses = ExpenseMapper.toExpenses(expenseDtos);
    calculateBalance();
    notifyListeners();
  }
}
