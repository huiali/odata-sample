using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Architecture.Sample.Expand.Models;
using Microsoft.AspNet.OData.Builder;
using Microsoft.AspNet.OData.Extensions;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Architecture.Sample.Expand
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
            services.AddControllers(options =>
            {
                options.EnableEndpointRouting = false;
            });

            services.AddOData();
            services.AddODataQueryFilter();
            services.AddHttpClient();
            services.AddDbContext<TestContext>(builder =>
            {
                builder.UseMySql("Server=localhost;port=3306;database=test;user=root;password=Password01!;charset=utf8;");
                builder.UseLoggerFactory(LoggerFactory.Create(configure =>
                {
                    configure
                    .AddFilter((category, level) => category == DbLoggerCategory.Database.Command.Name && level == LogLevel.Information)
                    .AddConsole();
                }));
            });

            services.AddCors(options =>
            {
                options.AddPolicy("allowSpecificOrigins",
                builder =>
                {
                    builder
                    .WithOrigins("*")
                    .AllowAnyHeader()
                    .AllowAnyMethod();
                });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();

            app.UseCors("allowSpecificOrigins");

            app.UseAuthentication();

            app.UseHttpsRedirection();

            ODataConventionModelBuilder builder = new ODataConventionModelBuilder(app.ApplicationServices);
            builder.EntitySet<A>("A").EntityType.HasKey(p=>p.Numericalorder);
            builder.EntitySet<B>("B").EntityType.HasKey(p => p.Recordid);
            builder.EntitySet<C>("C").EntityType.HasKey(p => p.Sortid);
            var model = builder.GetEdmModel();
            app.UseMvc(routeBuilder =>
            {
                routeBuilder.MapODataServiceRoute("ODataRoute", "oq", model);
                routeBuilder
                        .MaxTop(2000)
                        .Filter()
                        .Count()
                        .Expand()
                        .OrderBy()
                        .Select()
                        .Expand();
                routeBuilder.EnableDependencyInjection();

            });

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
