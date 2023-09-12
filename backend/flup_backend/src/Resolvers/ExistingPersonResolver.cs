using AutoMapper;
using flup_backend.Data;
using flup_backend.Dtos;
using flup_backend.Models;

namespace flup_backend.Resolvers;

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

public class ExistingPersonsResolver : IValueResolver<ExpenseDto, Expense, HashSet<Person>>
{
    private readonly AppDbContext _context;

    public ExistingPersonsResolver(AppDbContext context)
    {
        _context = context;
    }

    public HashSet<Person> Resolve(ExpenseDto source, Expense destination, HashSet<Person> destMember,
        ResolutionContext context)
    {
        // Fetch the list of IDs first
        var ids = source.PaidFor.Select(p => p.Id).ToList();

        // Now query the database using the list of IDs
        return _context.Persons.Where(p => ids.Contains(p.Id)).ToHashSet();
    }
}