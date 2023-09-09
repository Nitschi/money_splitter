using System.ComponentModel.DataAnnotations;

namespace money_splitter.Dtos;

public record ExpenseDto
{
    [Required] public string Description { get; init; }
    [Required] public int Amount { get; init; }
    [Required] public DateTime Time { get; init; }
    [Required] public PersonDto PaidBy { get; init; }
    [Required] public List<PersonDto> PaidFor { get; init; }
}