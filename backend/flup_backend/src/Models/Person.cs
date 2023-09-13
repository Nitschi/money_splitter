namespace flup_backend.Models;

public record Person
{
    public required Guid Id { get; init; }
    public required string Name { get; init; }

    public ICollection<Expense> ExpensesPaidBy { get; set; }
    public ICollection<Expense> ExpensesPaidFor { get; set; }
}