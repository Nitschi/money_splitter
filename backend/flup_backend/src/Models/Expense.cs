namespace flup_backend.Models;

public record Expense
{
    public required Guid Id { get; init; }
    public required string Description { get; init; }
    public required int Amount { get; init; }
    public required DateTime Time { get; init; }
    public required Person PaidBy { get; init; }
    public required HashSet<Person> PaidFor { get; init; }
}