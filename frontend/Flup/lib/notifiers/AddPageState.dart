import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/person.dart';

class AddPageState extends ChangeNotifier {
  List<Person> people = [
    Person(Uuid().v4().toString(), "Alexander"),
    Person(Uuid().v4().toString(), "Laura")
  ];
  Person? paidBy;

  AddPageState() {
    paidBy = people[0];
  }

  void setPaidBy(Person? newPaidBy) {
    paidBy = newPaidBy;
    notifyListeners();
  }
}
