import 'person.dart';

class Expense {
  int price;
  String title;
  DateTime time = DateTime.now();
  Person paidBy;
  List<Person> paidFor;

  final currency = "CHF";

  Expense(this.price, this.title, this.paidBy, this.paidFor);
}
