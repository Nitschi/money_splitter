using AutoMapper;
using money_splitter.Dtos;
using money_splitter.Models;

namespace money_splitter.Profiles;

public class PersonProfile : Profile
{
    public PersonProfile()
    {
        CreateMap<Person, PersonDto>().ReverseMap();
    }
}