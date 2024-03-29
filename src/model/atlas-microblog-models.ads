-----------------------------------------------------------------------
--  Atlas.Microblog.Models -- Atlas.Microblog.Models
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
with Ada.Calendar;
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded;
with Util.Beans.Objects;
with Util.Beans.Basic.Lists;
with AWA.Users.Models;
pragma Warnings (On);
package Atlas.Microblog.Models is

   pragma Style_Checks ("-mrIu");

   type Mblog_Ref is new ADO.Objects.Object_Ref with null record;

   --  --------------------
   --  The Mblog table holds the message posted by users.
   --  Once posted, the message is not supposed to be changed.
   --  --------------------
   --  Create an object key for Mblog.
   function Mblog_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Mblog from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Mblog_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_Mblog : constant Mblog_Ref;
   function "=" (Left, Right : Mblog_Ref'Class) return Boolean;

   --
   procedure Set_Id (Object : in out Mblog_Ref;
                     Value  : in ADO.Identifier);

   --
   function Get_Id (Object : in Mblog_Ref)
                 return ADO.Identifier;
   --
   function Get_Version (Object : in Mblog_Ref)
                 return Integer;

   --  Set the microblog message
   procedure Set_Message (Object : in out Mblog_Ref;
                          Value  : in Ada.Strings.Unbounded.Unbounded_String);
   procedure Set_Message (Object : in out Mblog_Ref;
                          Value : in String);

   --  Get the microblog message
   function Get_Message (Object : in Mblog_Ref)
                 return Ada.Strings.Unbounded.Unbounded_String;
   function Get_Message (Object : in Mblog_Ref)
                 return String;

   --
   procedure Set_Creation_Date (Object : in out Mblog_Ref;
                                Value  : in Ada.Calendar.Time);

   --
   function Get_Creation_Date (Object : in Mblog_Ref)
                 return Ada.Calendar.Time;

   --  Set the post author
   procedure Set_Author (Object : in out Mblog_Ref;
                         Value  : in AWA.Users.Models.User_Ref'Class);

   --  Get the post author
   function Get_Author (Object : in Mblog_Ref)
                 return AWA.Users.Models.User_Ref'Class;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Mblog_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Mblog_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Reload from the database the same object if it was modified.
   --  Returns True in `Updated` if the object was reloaded.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Reload (Object  : in out Mblog_Ref;
                     Session : in out ADO.Sessions.Session'Class;
                     Updated : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Mblog_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Mblog_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Mblog_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in Mblog_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   MBLOG_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Mblog_Ref);

   --  Copy of the object.
   procedure Copy (Object : in Mblog_Ref;
                   Into   : in out Mblog_Ref);


   --  --------------------
   --    The list of microblogs.
   --  --------------------
   type List_Info is
     new Util.Beans.Basic.Bean with  record

      --  the mblog identifier.
      Id : ADO.Identifier;

      --  the microblog message.
      Message : Ada.Strings.Unbounded.Unbounded_String;

      --  the microblog creation date.
      Create_Date : Ada.Calendar.Time;

      --  the author's name.
      Name : Ada.Strings.Unbounded.Unbounded_String;

      --  the author's email address.
      Email : Ada.Strings.Unbounded.Unbounded_String;
   end record;

   --  Get the bean attribute identified by the name.
   overriding
   function Get_Value (From : in List_Info;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Set the bean attribute identified by the name.
   overriding
   procedure Set_Value (Item  : in out List_Info;
                        Name  : in String;
                        Value : in Util.Beans.Objects.Object);


   package List_Info_Beans is
      new Util.Beans.Basic.Lists (Element_Type => List_Info);
   package List_Info_Vectors renames List_Info_Beans.Vectors;
   subtype List_Info_List_Bean is List_Info_Beans.List_Bean;

   type List_Info_List_Bean_Access is access all List_Info_List_Bean;

   --  Run the query controlled by <b>Context</b> and append the list in <b>Object</b>.
   procedure List (Object  : in out List_Info_List_Bean'Class;
                   Session : in out ADO.Sessions.Session'Class;
                   Context : in out ADO.Queries.Context'Class);

   subtype List_Info_Vector is List_Info_Vectors.Vector;

   --  Run the query controlled by <b>Context</b> and append the list in <b>Object</b>.
   procedure List (Object  : in out List_Info_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Context : in out ADO.Queries.Context'Class);

   Query_List : constant ADO.Queries.Query_Definition_Access;



private
   MBLOG_NAME : aliased constant String := "mblog";
   COL_0_1_NAME : aliased constant String := "id";
   COL_1_1_NAME : aliased constant String := "version";
   COL_2_1_NAME : aliased constant String := "message";
   COL_3_1_NAME : aliased constant String := "creation_date";
   COL_4_1_NAME : aliased constant String := "author_id";

   MBLOG_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count   => 5,
      Table   => MBLOG_NAME'Access,
      Members => (
         1 => COL_0_1_NAME'Access,
         2 => COL_1_1_NAME'Access,
         3 => COL_2_1_NAME'Access,
         4 => COL_3_1_NAME'Access,
         5 => COL_4_1_NAME'Access)
     );
   MBLOG_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := MBLOG_DEF'Access;


   Null_Mblog : constant Mblog_Ref
      := Mblog_Ref'(ADO.Objects.Object_Ref with null record);

   type Mblog_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => MBLOG_DEF'Access)
   with record
       Version : Integer;
       Message : Ada.Strings.Unbounded.Unbounded_String;
       Creation_Date : Ada.Calendar.Time;
       Author : AWA.Users.Models.User_Ref;
   end record;

   type Mblog_Access is access all Mblog_Impl;

   overriding
   procedure Destroy (Object : access Mblog_Impl);

   overriding
   procedure Find (Object  : in out Mblog_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out Mblog_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Mblog_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out Mblog_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Create (Object  : in out Mblog_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out Mblog_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out Mblog_Ref'Class;
                        Impl   : out Mblog_Access);

   package File_1 is
      new ADO.Queries.Loaders.File (Path => "microblog-list.xml",
                                    Sha1 => "47DAA315FBA533BB12DF4F938AE84FF5F78316AD");

   package Def_Listinfo_List is
      new ADO.Queries.Loaders.Query (Name => "list",
                                     File => File_1.File'Access);
   Query_List : constant ADO.Queries.Query_Definition_Access
   := Def_Listinfo_List.Query'Access;
end Atlas.Microblog.Models;
