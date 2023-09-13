using System.Net.Http.Json;
using flup_backend.Dtos;

using flup_backend_tests.fixtures;

public class ExpensesControllerIntegrationTests : IClassFixture<CustomWebApplicationFactory<flup_backend.Program>>
{
    private readonly HttpClient _client;

    public ExpensesControllerIntegrationTests(CustomWebApplicationFactory<flup_backend.Program> factory)
    {
        _client = factory.CreateClient();
    }

    [Fact]
    public async Task SaveAndGetExpenses_ReturnsExpensesAsExpected()
    {
        // Arrange
        var person1 = new PersonDto { Id = Guid.NewGuid(), Name = "John" };
        var person2 = new PersonDto { Id = Guid.NewGuid(), Name = "Jane" };

        var expense1 = new ExpenseDto 
        { 
            Id = Guid.NewGuid(),
            Description = "Expense 1",
            Amount = 100,
            Time = DateTime.Now,
            PaidBy = person1,
            PaidFor = new List<PersonDto> { person1, person2 }
        };

        var expense2 = new ExpenseDto 
        { 
            Id = Guid.NewGuid(),
            Description = "Expense 2",
            Amount = 200,
            Time = DateTime.Now,
            PaidBy = person2,
            PaidFor = new List<PersonDto> { person1 }
        };

        // Act: Save the expenses
        var response1 = await _client.PostAsJsonAsync("/expenses", expense1);
        var response2 = await _client.PostAsJsonAsync("/expenses", expense2);

        Assert.True(response1.IsSuccessStatusCode);
        Assert.True(response2.IsSuccessStatusCode);

        // Act: Get the expenses
        var response = await _client.GetFromJsonAsync<List<ExpenseDto>>("/expenses");

        // Assert
        Assert.NotNull(response);
        Assert.Equal(2, response.Count);

        var returnedExpense1 = response.SingleOrDefault(e => e.Id == expense1.Id);
        var returnedExpense2 = response.SingleOrDefault(e => e.Id == expense2.Id);

        Assert.NotNull(returnedExpense1);
        Assert.NotNull(returnedExpense2);
        
        Assert.Equal(expense2.Description, returnedExpense2.Description);
        Assert.Equal(expense2.Amount, returnedExpense2.Amount);
        Assert.Equal(expense2.PaidBy.Id, returnedExpense2.PaidBy.Id);
        Assert.Single(returnedExpense2.PaidFor);

        Assert.Equal(expense1.Description, returnedExpense1.Description);
        Assert.Equal(expense1.Amount, returnedExpense1.Amount);
        Assert.Equal(expense1.PaidBy.Id, returnedExpense1.PaidBy.Id);
        Assert.Equal(2, returnedExpense1.PaidFor.Count);
    }
}
