using Microsoft.EntityFrameworkCore;
using WebApiUser.Context;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

// crear variable para la cadena de conexion
var connectionString = builder.Configuration.GetConnectionString("Connection");
// registrar servicio para la conexions
builder.Services.AddDbContext<AppDBContext>(
    options => options.UseSqlServer(connectionString)
);

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
