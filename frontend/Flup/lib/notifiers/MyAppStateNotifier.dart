import 'package:flup_openapi_lib/api.dart';
import 'package:flutter/material.dart';

import '../mappers/expenseMapper.dart';
import '../models/expense.dart';

class MyAppState extends ChangeNotifier {
  final apiClient = ApiClient(basePath: 'http://localhost:55555');
  List<Expense> expenses = [];

  void removeExpense(Expense expense) {
    expenses.remove(expense);
    // TODO update in BE
    notifyListeners();
  }

  void addExpense(Expense expense) {
    expenses.add(expense);
    ExpensesApi(apiClient)
        .addExpense(expenseDto: ExpenseMapper.toExpenseDto(expense));
    notifyListeners();
  }

  void updateExpenses() async {
    List<ExpenseDto>? expenseDtos = await ExpensesApi(apiClient).getExpenses();
    if (expenseDtos == null) {
      //TODO: handle error
      return;
    }
    expenses = ExpenseMapper.toExpenses(expenseDtos);
    notifyListeners();
  }
}
