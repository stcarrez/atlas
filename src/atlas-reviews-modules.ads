-----------------------------------------------------------------------
--  atlas-reviews-modules -- Module reviews
--  Copyright (C) 2014 Stephane.Carrez
--  Written by Stephane.Carrez (Stephane.Carrez@gmail.com)
--  SPDX-License-Identifier: Apache-2.0
-----------------------------------------------------------------------
with ASF.Applications;

with AWA.Modules;
with Atlas.Reviews.Models;
with Security.Permissions;
package Atlas.Reviews.Modules is

   --  The name under which the module is registered.
   NAME : constant String := "reviews";

   package ACL_Create_Reviews is new Security.Permissions.Definition ("review-create");
   package ACL_Delete_Reviews is new Security.Permissions.Definition ("review-delete");
   package ACL_Update_Reviews is new Security.Permissions.Definition ("review-update");

   --  ------------------------------
   --  Module reviews
   --  ------------------------------
   type Review_Module is new AWA.Modules.Module with private;
   type Review_Module_Access is access all Review_Module'Class;

   --  Initialize the reviews module.
   overriding
   procedure Initialize (Plugin : in out Review_Module;
                         App    : in AWA.Modules.Application_Access;
                         Props  : in ASF.Applications.Config);

   --  Get the reviews module.
   function Get_Review_Module return Review_Module_Access;


   --  Save the review.
   procedure Save (Model  : in Review_Module;
                   Entity : in out Atlas.Reviews.Models.Review_Ref'Class);

   --  Delete the review.
   procedure Delete (Model  : in Review_Module;
                     Entity : in out Atlas.Reviews.Models.Review_Ref'Class);
private

   type Review_Module is new AWA.Modules.Module with null record;

end Atlas.Reviews.Modules;
