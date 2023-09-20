import 'package:flup_openapi_lib/api.dart';
import 'package:flutter/material.dart';

import '../mappers/expense_mapper.dart';
import '../models/expense.dart';
import '../models/person.dart';

class MyAppState extends ChangeNotifier {
  final apiClient = ApiClient(basePath: 'http://localhost:55555');
  List<Expense> expenses = [];
  List<Person> members = [
    Person("24e6063b-3991-4b93-bdbd-63294168ffd2", "Alexander"),
    Person("9952bdf4-ff95-485e-bf91-505fd5f05b78", "Laura"),
    Person("25e052a2-ebac-4db5-b1e2-2b4391a03fa4", "Johanna"),
    Person("8bbb3699-65d5-44d8-9aac-9db9fb1c10cd", "Mehrdad"),
    Person("607baeda-f183-41d6-9bfc-25a06fa32a6a", "Hendrik"),
    Person("82fadcd7-14da-4f96-990a-d3f319ae917a", "Paul"),
    Person("689d01b5-23f4-49b0-851a-d5a9bf9ee5b3", "Adrian")
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
