using System.ComponentModel.DataAnnotations;

namespace money_splitter.Dtos;

public record PersonDto
{
    [Required] public required Guid Id { get; init; }
    [Required] public required string Name { get; init; }
}