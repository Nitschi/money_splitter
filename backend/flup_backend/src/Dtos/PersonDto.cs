using System.ComponentModel.DataAnnotations;

namespace flup_backend.Dtos;

public record PersonDto
{
    [Required] public required Guid Id { get; init; }
    [Required] public required string Name { get; init; }
}