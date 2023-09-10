using System.ComponentModel.DataAnnotations;

namespace flup_backend.Dtos;

public record ExpenseDto
{
    [Required] public required Guid Id { get; init; }
    [Required] public required string Description { get; init; }
    [Required] public required int Amount { get; init; }
    [Required] public required DateTime Time { get; init; }
    [Required] public required PersonDto PaidBy { get; init; }
    [Required] public required List<PersonDto> PaidFor { get; init; }
}