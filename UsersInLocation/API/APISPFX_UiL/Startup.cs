using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.AzureAD.UI;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using APISPFX_SERVICE.HomeService;
using APISPFX_DATA.Repository;
using APISPFX_DATA;
using APISPFX_DATA.UnitOfWork;
using Microsoft.EntityFrameworkCore;
using APISPFX_SERVICE.UserService;
using APISPFX_SERVICE.LocationService;
using APISPFX_SERVICE.RelationService;

namespace APISPFX_UiL
{
  public class Startup
  {
    public Startup(IConfiguration configuration)
    {
      Configuration = configuration;
    }

    public IConfiguration Configuration { get; }

    // This method gets called by the runtime. Use this method to add services to the container.
    public void ConfigureServices(IServiceCollection services)
    {
      string connString = Configuration.GetConnectionString("killerwhale");

      services.AddDbContext<UiLDbContext>(options =>
        options.UseSqlServer(connString, builder => builder.MigrationsAssembly(typeof(Startup).Assembly.FullName)
      ));

      services.AddScoped(typeof(IRepository<>), typeof(Repository<>));

      services.AddScoped<IUnitOfWork, UnitOfWork<UiLDbContext>>();
      
      services.AddScoped<IUserInLocationService, UserInLocationService>();

      services.AddScoped<ILocationService, LocationService>();

      services.AddScoped<IUserService, UserService>();

      services.AddScoped<IUserLocationRelationService, UserLocationRelationService>();

      services.AddAuthentication(AzureADDefaults.BearerAuthenticationScheme)
          .AddAzureADBearer(options => Configuration.Bind("AzureAd", options));
      services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);
    }

    // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
    public void Configure(IApplicationBuilder app, IHostingEnvironment env)
    {
      if (env.IsDevelopment())
      {
        app.UseDeveloperExceptionPage();
      }
      else
      {
        app.UseHsts();
      }

      app.UseHttpsRedirection();
      app.UseAuthentication();
      app.UseMvc();
    }
  }
}
