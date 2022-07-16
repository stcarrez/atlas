with AWS.Net.SSL;

package body Atlas.Init is

   procedure Initialize (Log : in Util.Log.Loggers.Logger) is
   begin
      if not AWS.Net.SSL.Is_Supported then
         Log.Error ("SSL is not supported by AWS.");
         Log.Error ("SSL is required for the OAuth2/OpenID connector to "
                      & "connect to OAuth2/OpenID providers.");
         Log.Error ("Please, rebuild AWS with SSL support.");
      end if;
   end Initialize;

end Atlas.Init;
