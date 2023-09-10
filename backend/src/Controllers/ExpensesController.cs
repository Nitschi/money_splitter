using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using flup_backend.Data;
using flup_backend.Dtos;
using flup_backend.Models;

namespace flup_backend.Controllers;

[ApiController]
[Route("[controller]")]
public class ExpensesController : ControllerBase
{
    private readonly ILogger<ExpensesController> _log;
    private readonly AppDbContext _context;
    private readonly IMapper _mapper;

    public ExpensesController(ILogger<ExpensesController> logger, AppDbContext context, IMapper mapper)
    {
        _log = logger;
        _context = context;
        _mapper = mapper;
    }

    [HttpGet(Name = "GetExpenses")]
    public IEnumerable<ExpenseDto> Get()
    {
        var expenses = _context.Expenses
            .Include(e => e.PaidBy)
            .Include(e => e.PaidFor)
            .ToList();
        _log.LogInformation("Found {ExpensesCount} expenses", expenses.Count);
        return _mapper.Map<IEnumerable<ExpenseDto>>(expenses);
    }

    [HttpPost(Name = "AddExpense")]
    public ActionResult<ExpenseDto> AddExpense(ExpenseDto expenseDto)
    {
        AddMembersIfNotExists(expenseDto);

        var expense = _context.Expenses.Find(expenseDto.Id);

        if (expense is not null)
        {
            // Update the existing expense
            _mapper.Map(expenseDto, expense); // This will copy properties from expenseDto to existingExpense
            _context.Update(expense);
            _log.LogInformation("Updated expense {ExpenseId}", expense.Description);
        }
        else
        {
            // Add new expense
            expense = _mapper.Map<Expense>(expenseDto);
            _context.Expenses.Add(expense);
            _log.LogInformation("Added expense {ExpenseId}", expense.Description);
        }

        _context.SaveChanges();

        return CreatedAtAction(nameof(AddExpense), _mapper.Map<ExpenseDto>(expense));
    }

    private void AddMembersIfNotExists(ExpenseDto expenseDto)
    {
        // Keep this, until the frontend handles multiple books explicitly
        // Add all paidFor and paidBy members if they don't exist
        var existingPersons = _context.Persons
            .Where(p => expenseDto.PaidFor.Select(pf => pf.Id).Contains(p.Id) || p.Id == expenseDto.PaidBy.Id).ToList();

        foreach (var paidFor in expenseDto.PaidFor.Where(paidFor => existingPersons.All(p => p.Id != paidFor.Id)))
        {
            _log.LogInformation("Member {MemberId} does not exist, adding {Name}", paidFor.Id, paidFor.Name);
            _context.Persons.Add(_mapper.Map<Person>(paidFor));
            existingPersons.Add(_mapper.Map<Person>(paidFor));
        }


        if (existingPersons.Any(p => p.Id == expenseDto.PaidBy.Id)) return;
        _log.LogInformation("Member {MemberId} does not exist, adding {Name}", expenseDto.PaidBy.Id,
            expenseDto.PaidBy.Name);
        _context.Persons.Add(_mapper.Map<Person>(expenseDto.PaidBy));
    }
}