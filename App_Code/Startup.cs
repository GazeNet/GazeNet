using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GazeNetOnline.Startup))]
namespace GazeNetOnline
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
