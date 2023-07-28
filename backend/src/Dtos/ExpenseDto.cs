using System.ComponentModel.DataAnnotations;

namespace src.Dtos;

public record ExpenseDto([property: Required] string Description, [property: Required] int Amount, [property: Required] DateTime Time, [property: Required] PersonDto PaidBy, [property: Required] List<PersonDto> PaidFor);
