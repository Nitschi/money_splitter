using Microsoft.AspNetCore.Mvc;

namespace src.Controllers;

[ApiController]
[Route("[controller]")]
public class ExpensesController : ControllerBase
{
    private readonly ILogger<ExpensesController> _log;
    List<Expense> expenses = new List<Expense>();

    public ExpensesController(ILogger<ExpensesController> logger)
    {
        _log = logger;
    }

    [HttpGet(Name = "GetExpenses")]
    public IEnumerable<Expense> Get()
    {
        return expenses;
    }

    [HttpPost(Name = "AddExpense")]
    public ActionResult<Expense> AddExpense(Expense expense){
        expenses.Add(expense);
        return CreatedAtAction(nameof(Expense), null);
    }
}
