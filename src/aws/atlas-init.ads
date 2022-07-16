with Servlet.Server.Web;
with Util.Log.Loggers;

package Atlas.Init is

   subtype Container_Type is Servlet.Server.Web.AWS_Container;

   procedure Initialize (Log : in Util.Log.Loggers.Logger);

end Atlas.Init;
