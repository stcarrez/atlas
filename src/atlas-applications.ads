-----------------------------------------------------------------------
--  atlas -- atlas applications
-----------------------------------------------------------------------
--  Copyright (C) 2012, 2013, 2014, 2015 Stephane Carrez
--  Written by Stephane Carrez (Stephane.Carrez@gmail.com)
--
--  Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.
-----------------------------------------------------------------------
with Util.Beans.Objects;

with ASF.Servlets.Faces;
with ASF.Servlets.Files;
with ASF.Servlets.Ajax;
with ASF.Filters.Dump;
with ASF.Filters.Cache_Control;
with ASF.Servlets.Measures;

with ASF.Security.Servlets;
with ASF.Converters.Sizes;

with AWA.Users.Servlets;
with AWA.Users.Modules;
with AWA.Mail.Modules;
with AWA.Blogs.Modules;
with AWA.Applications;
with AWA.Workspaces.Modules;
with AWA.Storages.Modules;
with AWA.Images.Modules;
with AWA.Questions.Modules;
with AWA.Wikis.Modules;
with AWA.Wikis.Previews;
with AWA.Jobs.Modules;
with AWA.Counters.Modules;
with AWA.Votes.Modules;
with AWA.Tags.Modules;
with AWA.Comments.Modules;
with AWA.Services.Filters;
with AWA.Converters.Dates;

with Atlas.Microblog.Modules;
with Atlas.Reviews.Modules;
package Atlas.Applications is

   CONFIG_PATH  : constant String := "/atlas";
   CONTEXT_PATH : constant String := "/atlas";

   ATLAS_NS_URI : aliased constant String := "http://code.google.com/p/ada-awa/atlas";

   --  Given an Email address, return the Gravatar link to the user image.
   --  (See http://en.gravatar.com/site/implement/hash/ and
   --  http://en.gravatar.com/site/implement/images/)
   function Get_Gravatar_Link (Email : in String) return String;

   --  EL function to convert an Email address to a Gravatar image.
   function To_Gravatar_Link (Email : in Util.Beans.Objects.Object)
                              return Util.Beans.Objects.Object;

   type Application is new AWA.Applications.Application with private;
   type Application_Access is access all Application'Class;

   --  Initialize the application.
   procedure Initialize (App : in Application_Access);

   --  Initialize the ASF components provided by the application.
   --  This procedure is called by <b>Initialize</b>.
   --  It should register the component factories used by the application.
   overriding
   procedure Initialize_Components (App : in out Application);

   --  Initialize the servlets provided by the application.
   --  This procedure is called by <b>Initialize</b>.
   --  It should register the application servlets.
   overriding
   procedure Initialize_Servlets (App : in out Application);

   --  Initialize the filters provided by the application.
   --  This procedure is called by <b>Initialize</b>.
   --  It should register the application filters.
   overriding
   procedure Initialize_Filters (App : in out Application);

   --  Initialize the AWA modules provided by the application.
   --  This procedure is called by <b>Initialize</b>.
   --  It should register the modules used by the application.
   overriding
   procedure Initialize_Modules (App : in out Application);

private

   type Application is new AWA.Applications.Application with record
      Self              : Application_Access;
      --  Application servlets and filters (add new servlet and filter instances here).
      Faces             : aliased ASF.Servlets.Faces.Faces_Servlet;
      Ajax              : aliased ASF.Servlets.Ajax.Ajax_Servlet;
      Files             : aliased ASF.Servlets.Files.File_Servlet;
      Dump              : aliased ASF.Filters.Dump.Dump_Filter;
      Service_Filter    : aliased AWA.Services.Filters.Service_Filter;
      Measures          : aliased ASF.Servlets.Measures.Measure_Servlet;
      No_Cache          : aliased ASF.Filters.Cache_Control.Cache_Control_Filter;

      --  Authentication servlet and filter.
      Auth              : aliased ASF.Security.Servlets.Request_Auth_Servlet;
      Verify_Auth       : aliased AWA.Users.Servlets.Verify_Auth_Servlet;

      --  Converters shared by web requests.
      Rel_Date_Converter : aliased AWA.Converters.Dates.Relative_Date_Converter;
      Size_Converter     : aliased ASF.Converters.Sizes.Size_Converter;

      --  The application modules.
      User_Module       : aliased AWA.Users.Modules.User_Module;
      Workspace_Module  : aliased AWA.Workspaces.Modules.Workspace_Module;
      Blog_Module       : aliased AWA.Blogs.Modules.Blog_Module;
      Mail_Module       : aliased AWA.Mail.Modules.Mail_Module;
      Job_Module        : aliased AWA.Jobs.Modules.Job_Module;
      Storage_Module    : aliased AWA.Storages.Modules.Storage_Module;
      Image_Module      : aliased AWA.Images.Modules.Image_Module;
      Vote_Module       : aliased AWA.Votes.Modules.Vote_Module;
      Question_Module   : aliased AWA.Questions.Modules.Question_Module;
      Tag_Module        : aliased AWA.Tags.Modules.Tag_Module;
      Comment_Module    : aliased AWA.Comments.Modules.Comment_Module;
      Wiki_Module       : aliased AWA.Wikis.Modules.Wiki_Module;
      Preview_Module    : aliased AWA.Wikis.Previews.Preview_Module;
      Counter_Module    : aliased AWA.Counters.Modules.Counter_Module;

      Microblog_Module  : aliased Atlas.Microblog.Modules.Microblog_Module;
      Review_Module     : aliased Atlas.Reviews.Modules.Review_Module;
   end record;

end Atlas.Applications;
