using System.ComponentModel.DataAnnotations;

namespace money_splitter.Dtos;

public record PersonDto
{
    [Required] public Guid Id { get; init; }
    [Required] public string Name { get; init; }
}