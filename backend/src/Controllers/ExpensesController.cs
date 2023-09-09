using Microsoft.AspNetCore.Mvc;
using money_splitter.Dtos;

namespace money_splitter.Controllers;

[ApiController]
[Route("[controller]")]
public class ExpensesController : ControllerBase
{
    private readonly ILogger<ExpensesController> _log;
    static List<ExpenseDto> expenses = new List<ExpenseDto>();

    public ExpensesController(ILogger<ExpensesController> logger)
    {
        _log = logger;
    }

    [HttpGet(Name = "GetExpenses")]
    public IEnumerable<ExpenseDto> Get()
    {
        return expenses;
    }

    [HttpPost(Name = "AddExpense")]
    public ActionResult<ExpenseDto> AddExpense(ExpenseDto expense){
        expenses.Add(expense);
        return CreatedAtAction(nameof(AddExpense), null);
    }
}
