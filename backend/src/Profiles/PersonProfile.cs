using AutoMapper;
using flup_backend.Dtos;
using flup_backend.Models;

namespace flup_backend.Profiles;

public class PersonProfile : Profile
{
    public PersonProfile()
    {
        CreateMap<Person, PersonDto>().ReverseMap();
    }
}