-----------------------------------------------------------------------
--  Atlas.Applications.Models -- Atlas.Applications.Models
-----------------------------------------------------------------------
--  File generated by Dynamo DO NOT MODIFY
--  Template used: templates/model/package-spec.xhtml
--  Ada Generator: https://github.com/stcarrez/dynamo Version 1.4.0
-----------------------------------------------------------------------
--  Copyright (C) 2023 Stephane Carrez
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
pragma Warnings (Off);
with ADO.Sessions;
with ADO.Objects;
with ADO.Statements;
with ADO.SQL;
with ADO.Schemas;
with ADO.Queries;
with ADO.Queries.Loaders;
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded;
with Util.Beans.Objects;
with Util.Beans.Basic.Lists;
pragma Warnings (On);
package Atlas.Applications.Models is

   pragma Style_Checks ("-mrIu");


   --  --------------------
   --    Stats about what the user did.
   --  --------------------
   type User_Stat_Info is
     new Util.Beans.Basic.Bean with  record

      --  the number of posts.
      Post_Count : Integer;

      --  the number of documents.
      Document_Count : Integer;

      --  the number of questions asked.
      Question_Count : Integer;

      --  the number of answers.
      Answer_Count : Integer;

      --  the number of reviews.
      Review_Count : Integer;
   end record;

   --  Get the bean attribute identified by the name.
   overriding
   function Get_Value (From : in User_Stat_Info;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Set the bean attribute identified by the name.
   overriding
   procedure Set_Value (Item  : in out User_Stat_Info;
                        Name  : in String;
                        Value : in Util.Beans.Objects.Object);


   package User_Stat_Info_Beans is
      new Util.Beans.Basic.Lists (Element_Type => User_Stat_Info);
   package User_Stat_Info_Vectors renames User_Stat_Info_Beans.Vectors;
   subtype User_Stat_Info_List_Bean is User_Stat_Info_Beans.List_Bean;

   type User_Stat_Info_List_Bean_Access is access all User_Stat_Info_List_Bean;

   --  Run the query controlled by <b>Context</b> and append the list in <b>Object</b>.
   procedure List (Object  : in out User_Stat_Info_List_Bean'Class;
                   Session : in out ADO.Sessions.Session'Class;
                   Context : in out ADO.Queries.Context'Class);

   subtype User_Stat_Info_Vector is User_Stat_Info_Vectors.Vector;

   --  Run the query controlled by <b>Context</b> and append the list in <b>Object</b>.
   procedure List (Object  : in out User_Stat_Info_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Context : in out ADO.Queries.Context'Class);

   Query_User_Stat : constant ADO.Queries.Query_Definition_Access;



private

   package File_1 is
      new ADO.Queries.Loaders.File (Path => "user-stats.xml",
                                    Sha1 => "57E3C61ACCA9CC94237EF0BB1167698EA1E0E648");

   package Def_Userstatinfo_User_Stat is
      new ADO.Queries.Loaders.Query (Name => "user-stat",
                                     File => File_1.File'Access);
   Query_User_Stat : constant ADO.Queries.Query_Definition_Access
   := Def_Userstatinfo_User_Stat.Query'Access;
end Atlas.Applications.Models;
