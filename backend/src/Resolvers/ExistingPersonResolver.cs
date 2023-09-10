using AutoMapper;
using money_splitter.Data;
using money_splitter.Dtos;
using money_splitter.Models;

namespace money_splitter.Resolvers;

public class ExistingPersonResolver : IMemberValueResolver<ExpenseDto, Expense, Guid, Person>
{
    private readonly AppDbContext _context;

    public ExistingPersonResolver(AppDbContext context)
    {
        _context = context;
    }

    public Person Resolve(ExpenseDto source, Expense destination, Guid sourceMember, Person destMember,
        ResolutionContext context)
    {
        return _context.Persons.Find(sourceMember) ?? throw new KeyNotFoundException("PaidBy member does not exist");
    }
}

public class ExistingPersonsResolver : IValueResolver<ExpenseDto, Expense, List<Person>>
{
    private readonly AppDbContext _context;

    public ExistingPersonsResolver(AppDbContext context)
    {
        _context = context;
    }

    public List<Person> Resolve(ExpenseDto source, Expense destination, List<Person> destMember,
        ResolutionContext context)
    {
        // Fetch the list of IDs first
        var ids = source.PaidFor.Select(p => p.Id).ToList();

        // Now query the database using the list of IDs
        return _context.Persons.Where(p => ids.Contains(p.Id)).ToList();
    }
}