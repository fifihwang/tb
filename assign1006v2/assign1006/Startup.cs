using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(assign1006.Startup))]
namespace assign1006
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
