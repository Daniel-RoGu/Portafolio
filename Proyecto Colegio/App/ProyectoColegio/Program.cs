using ProyectoColegio.Data;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using Rotativa.AspNetCore;
using DinkToPdf;
using DinkToPdf.Contracts;
using ProyectoColegio.Extension;
using DocumentFormat.OpenXml.InkML;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

builder.Services.AddSingleton(new Contexto(builder.Configuration.GetConnectionString("MyConexionSQL")));
builder.Services.AddDistributedMemoryCache(); builder.Services.AddSession(options => { options.IdleTimeout = TimeSpan.FromSeconds(10); options.Cookie.HttpOnly = true; options.Cookie.IsEssential = true; });


//configuracion para usar recursos de la libreriaPDF
var context = new CustomAssemblyLoadContext();
context.LoadUnmanagedLibrary(Path.Combine(Directory.GetCurrentDirectory(), "LibreriaPDF/libwkhtmltox.dll"));
builder.Services.AddSingleton(typeof(IConverter), new SynchronizedConverter(new PdfTools()));


var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}


app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Login}/{action=Inicio}/{id?}");

app.Run();
app.UseSession();
