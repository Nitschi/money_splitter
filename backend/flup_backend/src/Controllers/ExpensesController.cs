using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using flup_backend.Data;
using flup_backend.Dtos;
using flup_backend.Models;
using Microsoft.AspNetCore.Authorization;

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

    [Authorize]
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

    [Authorize]
    [HttpPost(Name = "AddExpense")]
    public ActionResult<ExpenseDto> AddExpense(ExpenseDto expenseDto)
    {
        Expense expense;
        if (_context.Expenses.Any(e => e.Id == expenseDto.Id))
        {
            // Update the existing expense
            expense = _mapper.Map<Expense>(expenseDto);
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

    [Authorize]
    [HttpDelete(Name = "RemoveExpense")]
    public IActionResult RemoveExpense(ExpenseDto expenseDto)
    {
        Expense expense;
        if (_context.Expenses.Any(e => e.Id == expenseDto.Id))
        {
            // Remove the existing expense
            expense = _mapper.Map<Expense>(expenseDto);
            _context.Remove(expense);
            _log.LogInformation("Removed expense {ExpenseId}", expense.Id);
        }
        else
        {
            _log.LogInformation("Expense with {ExpenseDtoId} was not found", expenseDto.Id);
        }

        _context.SaveChanges();

        return NoContent();
    }
}