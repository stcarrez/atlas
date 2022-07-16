with Servlet.Server.EWS;
with Util.Log.Loggers;

package Atlas.Init is

   subtype Container_Type is Servlet.Server.EWS.EWS_Container;

   procedure Initialize (Log : in Util.Log.Loggers.Logger);

end Atlas.Init;
