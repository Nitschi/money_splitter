using System.ComponentModel.DataAnnotations;

namespace src.Dtos;

public record PersonDto([property: Required] Guid Id, [property: Required] string Name);