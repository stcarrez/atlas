-----------------------------------------------------------------------
--  atlas-microblog-modules -- Module microblog
--  Copyright (C) 2012 Stephane Carrez
--  Written by Stephane Carrez (Stephane.Carrez@gmail.com)
--  SPDX-License-Identifier: Apache-2.0
-----------------------------------------------------------------------
with ASF.Applications;

with AWA.Modules;
with Atlas.Microblog.Models;
package Atlas.Microblog.Modules is

   --  The name under which the module is registered.
   NAME : constant String := "microblog";

   --  ------------------------------
   --  Module microblog
   --  ------------------------------
   type Microblog_Module is new AWA.Modules.Module with private;
   type Microblog_Module_Access is access all Microblog_Module'Class;

   --  Initialize the microblog module.
   overriding
   procedure Initialize (Plugin : in out Microblog_Module;
                         App    : in AWA.Modules.Application_Access;
                         Props  : in ASF.Applications.Config);

   --  Get the microblog module.
   function Get_Microblog_Module return Microblog_Module_Access;

   --  Create a post for the microblog.
   procedure Create (Plugin : in Microblog_Module;
                     Post   : in out Atlas.Microblog.Models.Mblog_Ref);

private

   type Microblog_Module is new AWA.Modules.Module with null record;

end Atlas.Microblog.Modules;
