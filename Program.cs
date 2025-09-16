using System.Threading.Tasks.Dataflow;
using Microsoft.EntityFrameworkCore;
using TaskForgeApi;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<TaskDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

  
var app = builder.Build();

app.MapGet("/", () => "Hello World!");

app.UseSwagger();
app.UseSwaggerUI();

app.Run();
