import 'package:flup/models/person.dart';
import 'package:flup_openapi_lib/api.dart';

import '../models/expense.dart';

class ExpenseMapper {
  static Expense toExpense(ExpenseDto expenseDto) {
    var expense = Expense(expenseDto.amount, expenseDto.description,
        toPerson(expenseDto.paidBy), expenseDto.paidFor.map(toPerson).toList());
    return expense;
  }

  static List<Expense> toExpenses(List<ExpenseDto> expenseDtos) {
    return expenseDtos.map(toExpense).toList();
  }

  static ExpenseDto toExpenseDto(Expense expense) {
    var expenseDto = ExpenseDto(
        description: expense.title,
        amount: expense.price,
        time: expense.time,
        paidBy: toPersonDto(expense.paidBy),
        paidFor: expense.paidFor.map(toPersonDto).toList());
    return expenseDto;
  }

  static PersonDto toPersonDto(Person person) {
    return PersonDto(id: person.id, name: person.name);
  }

  static Person toPerson(PersonDto personDto) {
    return Person(personDto.id, personDto.name);
  }
}
