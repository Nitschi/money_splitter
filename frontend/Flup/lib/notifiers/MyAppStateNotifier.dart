import 'package:flutter/material.dart';

import '../models/Expense.dart';

class MyAppState extends ChangeNotifier {
  List<Expense> expenses = [];

  void removeExpense(Expense expense) {
    expenses.remove(expense);
    notifyListeners();
  }
}
