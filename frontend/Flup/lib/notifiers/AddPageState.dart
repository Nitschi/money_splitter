import 'package:flutter/material.dart';

import '../models/person.dart';

class AddPageState extends ChangeNotifier {
  late Person paidBy;
  Map<Person, bool> paidFor = {};
  final expenseController = TextEditingController();
  final priceController = TextEditingController();

  void setPaidBy(Person newPaidBy) {
    paidBy = newPaidBy;
    notifyListeners();
  }

  void setPaidFor(bool isChecked, Person person) {
    paidFor[person] = isChecked;
    notifyListeners();
  }

  AddPageState(List<Person> members) {
    for (var person in members) {
      paidFor[person] = true;
    }
    paidBy = members[0];
  }
}
