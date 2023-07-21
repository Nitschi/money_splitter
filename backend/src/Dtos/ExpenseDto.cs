namespace src.Dtos;

public record ExpenseDto(string Description, int Amount, DateTime Time, PersonDto PaidBy, List<PersonDto> PaidFor);
