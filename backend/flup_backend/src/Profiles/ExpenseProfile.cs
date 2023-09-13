using AutoMapper;
using flup_backend.Dtos;
using flup_backend.Models;

namespace flup_backend.Profiles;

// ReSharper disable once UnusedType.Global
public class ExpenseProfile : Profile
{
    public ExpenseProfile()
    {
        CreateMap<ExpenseDto, Expense>().ReverseMap();
    }
}