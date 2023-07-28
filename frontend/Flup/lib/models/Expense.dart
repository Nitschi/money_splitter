import 'package:uuid/uuid.dart';

import 'person.dart';

class Expense {
  int price;
  String title;
  DateTime time = DateTime.now();
  Person paidBy = Person(Uuid().v4().toString(), "Laura");
  List<Person> paidFor = [Person(Uuid().v4().toString(), "Alex")];

  final currency = "CHF";

  Expense(this.price, this.title);
}
