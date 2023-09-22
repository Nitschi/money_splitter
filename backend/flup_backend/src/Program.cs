using flup_backend.Data;
using Microsoft.EntityFrameworkCore;

namespace flup_backend;

public class Program
{
    public static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        builder.Services.AddControllers();
        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddSwaggerGen();

        builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
        builder.Services.AddDbContext<AppDbContext>(options =>
            options.UseSqlite(builder.Configuration.GetConnectionString("DefaultConnection")));
        
        var allowedDomain = builder.Configuration["DOMAIN"];
        builder.Services.AddCors(options =>
        {
            options.AddPolicy("AllowSpecificOrigin",
                policy => policy.WithOrigins($"https://flup.{allowedDomain}")
                    .AllowAnyHeader()
                    .AllowAnyMethod());
            options.AddPolicy("DevelopmentPolicy",
                policy => policy.AllowAnyOrigin()
                    .AllowAnyHeader()
                    .AllowAnyMethod());
        });

        var app = builder.Build();

        if (app.Environment.IsDevelopment())
        {
            app.UseCors("DevelopmentPolicy");
            app.UseSwagger();
            app.UseSwaggerUI(options =>
            {
                options.SwaggerEndpoint("/swagger/v1/swagger.json", "v1");
                options.RoutePrefix = string.Empty;
            });
        }
        else
        {
            app.UseCors("AllowSpecificOrigin");
        }

        app.MapControllers();

        app.Run();
    }
}