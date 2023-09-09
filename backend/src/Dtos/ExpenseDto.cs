using System.ComponentModel.DataAnnotations;

namespace money_splitter.Dtos;

public record ExpenseDto
{
    public ExpenseDto(string Description, int Amount, DateTime Time, PersonDto PaidBy, List<PersonDto> PaidFor)
    {
        this.Description = Description;
        this.Amount = Amount;
        this.Time = Time;
        this.PaidBy = PaidBy;
        this.PaidFor = PaidFor;
    }

    [Required] public string Description { get; init; }
    [Required] public int Amount { get; init; }
    [Required] public DateTime Time { get; init; }
    [Required] public PersonDto PaidBy { get; init; }
    [Required] public List<PersonDto> PaidFor { get; init; }
}
