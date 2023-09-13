using AutoMapper;
using flup_backend.Data;
using flup_backend.Dtos;
using flup_backend.Models;

namespace flup_backend.Converters;

// ReSharper disable once ClassNeverInstantiated.Global
public class GetPersonFromDbOrCreate : ITypeConverter<PersonDto, Person>
{
    private readonly AppDbContext _context;

    public GetPersonFromDbOrCreate(AppDbContext context)
    {
        _context = context;
    }

    private static readonly MapperConfiguration SimpleConfig = new(cfg => 
    {
        cfg.CreateMap<PersonDto, Person>();
    });

    private static readonly IMapper SimpleMapper = SimpleConfig.CreateMapper();

    public Person Convert(PersonDto source, Person destination, ResolutionContext context)
    {
        var person = _context.Persons.Find(source.Id);
        if (person is null)
        {
            person = SimpleMapper.Map<Person>(source);
            _context.Persons.Add(person);
        }
        return person;
    }

}