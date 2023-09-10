namespace money_splitter.Models;

public record Person
{
    public required Guid Id { get; init; }
    public required string Name { get; init; }

    // TODO(anitsch): Check if these are necessary
    public ICollection<Expense> ExpensesPaidBy { get; set; }
    public ICollection<Expense> ExpensesPaidFor { get; set; }
}