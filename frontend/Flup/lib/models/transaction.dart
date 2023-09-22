import 'person.dart';

class Transaction {
  late Person fromDebtor;
  late Person toSponsor;
  late double amount;

  Transaction(this.fromDebtor, this.toSponsor, this.amount);
}
