using Microsoft.EntityFrameworkCore;
using flup_backend.Models;

namespace flup_backend.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
    }

    public DbSet<Expense> Expenses { get; set; }
    public DbSet<Person> Persons { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // modelBuilder.Entity<Book>().HasMany(b => b.Expenses);
        // modelBuilder.Entity<Book>().HasMany(b => b.Members);
        modelBuilder.Entity<Expense>().HasOne(e => e.PaidBy).WithMany(p => p.ExpensesPaidBy);
        modelBuilder.Entity<Expense>().HasMany(e => e.PaidFor).WithMany(p => p.ExpensesPaidFor);
    }
}