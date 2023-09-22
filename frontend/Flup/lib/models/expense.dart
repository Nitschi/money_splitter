import 'person.dart';

class Expense {
  String id;
  int price;
  String title;
  DateTime time = DateTime.now();
  Person paidBy;
  List<Person> paidFor;

  final currency = "EUR";

  Expense(this.id, this.price, this.title, this.paidBy, this.paidFor);
}
