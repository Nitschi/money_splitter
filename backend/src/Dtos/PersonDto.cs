using System.ComponentModel.DataAnnotations;

namespace money_splitter.Dtos;

public record PersonDto
{
    public PersonDto(Guid Id, string Name)
    {
        this.Id = Id;
        this.Name = Name;
    }

    [Required] public Guid Id { get; init; }
    [Required] public string Name { get; init; }
}