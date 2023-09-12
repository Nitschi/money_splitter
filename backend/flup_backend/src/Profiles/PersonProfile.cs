using AutoMapper;
using flup_backend.Converters;
using flup_backend.Dtos;
using flup_backend.Models;

namespace flup_backend.Profiles;

// ReSharper disable once UnusedType.Global
public class PersonProfile : Profile
{
    public PersonProfile()
    {
        CreateMap<PersonDto, Person>().ConvertUsing<GetPersonFromDbOrCreate>();
        CreateMap<Person, PersonDto>();
    }
}