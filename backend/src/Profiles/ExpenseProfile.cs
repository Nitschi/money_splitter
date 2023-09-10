using AutoMapper;
using flup_backend.Dtos;
using flup_backend.Models;
using flup_backend.Resolvers;

namespace flup_backend.Profiles;

public class ExpenseProfile : Profile
{
    public ExpenseProfile()
    {
        CreateMap<ExpenseDto, Expense>()
            .ForMember(dest => dest.PaidBy, opt => opt.MapFrom<ExistingPersonResolver, Guid>(src => src.PaidBy.Id))
            .ForMember(dest => dest.PaidFor, opt => opt.MapFrom<ExistingPersonsResolver>());

        CreateMap<Expense, ExpenseDto>()
            .ForMember(dest => dest.PaidBy, opt => opt.MapFrom(src => src.PaidBy))
            .ForMember(dest => dest.PaidFor, opt => opt.MapFrom(src => src.PaidFor));
    }
}