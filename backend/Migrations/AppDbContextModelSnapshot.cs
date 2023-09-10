﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using flup_backend.Data;

#nullable disable

namespace flup_backend.Migrations
{
    [DbContext(typeof(AppDbContext))]
    partial class AppDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder.HasAnnotation("ProductVersion", "7.0.10");

            modelBuilder.Entity("ExpensePerson", b =>
                {
                    b.Property<Guid>("ExpensesPaidForId")
                        .HasColumnType("TEXT");

                    b.Property<Guid>("PaidForId")
                        .HasColumnType("TEXT");

                    b.HasKey("ExpensesPaidForId", "PaidForId");

                    b.HasIndex("PaidForId");

                    b.ToTable("ExpensePerson");
                });

            modelBuilder.Entity("flup_backend.Models.Expense", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<int>("Amount")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.Property<Guid>("PaidById")
                        .HasColumnType("TEXT");

                    b.Property<DateTime>("Time")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("PaidById");

                    b.ToTable("Expenses");
                });

            modelBuilder.Entity("flup_backend.Models.Person", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("Persons");
                });

            modelBuilder.Entity("ExpensePerson", b =>
                {
                    b.HasOne("flup_backend.Models.Expense", null)
                        .WithMany()
                        .HasForeignKey("ExpensesPaidForId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("flup_backend.Models.Person", null)
                        .WithMany()
                        .HasForeignKey("PaidForId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("flup_backend.Models.Expense", b =>
                {
                    b.HasOne("flup_backend.Models.Person", "PaidBy")
                        .WithMany("ExpensesPaidBy")
                        .HasForeignKey("PaidById")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("PaidBy");
                });

            modelBuilder.Entity("flup_backend.Models.Person", b =>
                {
                    b.Navigation("ExpensesPaidBy");
                });
#pragma warning restore 612, 618
        }
    }
}
