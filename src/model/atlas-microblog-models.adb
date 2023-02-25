-----------------------------------------------------------------------
--  Atlas.Microblog.Models -- Atlas.Microblog.Models
-----------------------------------------------------------------------
--  File generated by Dynamo DO NOT MODIFY
--  Template used: templates/model/package-body.xhtml
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
with Ada.Unchecked_Deallocation;
with Util.Beans.Objects.Time;
pragma Warnings (On);
package body Atlas.Microblog.Models is

   pragma Style_Checks ("-mrIu");
   pragma Warnings (Off, "formal parameter * is not referenced");
   pragma Warnings (Off, "use clause for type *");
   pragma Warnings (Off, "use clause for private type *");

   use type ADO.Objects.Object_Record_Access;
   use type ADO.Objects.Object_Ref;

   function Mblog_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key is
      Result : ADO.Objects.Object_Key (Of_Type  => ADO.Objects.KEY_INTEGER,
                                       Of_Class => MBLOG_DEF'Access);
   begin
      ADO.Objects.Set_Value (Result, Id);
      return Result;
   end Mblog_Key;

   function Mblog_Key (Id : in String) return ADO.Objects.Object_Key is
      Result : ADO.Objects.Object_Key (Of_Type  => ADO.Objects.KEY_INTEGER,
                                       Of_Class => MBLOG_DEF'Access);
   begin
      ADO.Objects.Set_Value (Result, Id);
      return Result;
   end Mblog_Key;

   function "=" (Left, Right : Mblog_Ref'Class) return Boolean is
   begin
      return ADO.Objects.Object_Ref'Class (Left) = ADO.Objects.Object_Ref'Class (Right);
   end "=";

   procedure Set_Field (Object : in out Mblog_Ref'Class;
                        Impl   : out Mblog_Access) is
      Result : ADO.Objects.Object_Record_Access;
   begin
      Object.Prepare_Modify (Result);
      Impl := Mblog_Impl (Result.all)'Access;
   end Set_Field;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Mblog_Ref) is
      Impl : Mblog_Access;
   begin
      Impl := new Mblog_Impl;
      Impl.Version := 0;
      Impl.Creation_Date := ADO.DEFAULT_TIME;
      ADO.Objects.Set_Object (Object, Impl.all'Access);
   end Allocate;

   -- ----------------------------------------
   --  Data object: Mblog
   -- ----------------------------------------

   procedure Set_Id (Object : in out Mblog_Ref;
                     Value  : in ADO.Identifier) is
      Impl : Mblog_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Key_Value (Impl.all, 1, Value);
   end Set_Id;

   function Get_Id (Object : in Mblog_Ref)
                  return ADO.Identifier is
      Impl : constant Mblog_Access
         := Mblog_Impl (Object.Get_Object.all)'Access;
   begin
      return Impl.Get_Key_Value;
   end Get_Id;


   function Get_Version (Object : in Mblog_Ref)
                  return Integer is
      Impl : constant Mblog_Access
         := Mblog_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Version;
   end Get_Version;


   procedure Set_Message (Object : in out Mblog_Ref;
                           Value : in String) is
      Impl : Mblog_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 3, Impl.Message, Value);
   end Set_Message;

   procedure Set_Message (Object : in out Mblog_Ref;
                          Value  : in Ada.Strings.Unbounded.Unbounded_String) is
      Impl : Mblog_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Unbounded_String (Impl.all, 3, Impl.Message, Value);
   end Set_Message;

   function Get_Message (Object : in Mblog_Ref)
                 return String is
   begin
      return Ada.Strings.Unbounded.To_String (Object.Get_Message);
   end Get_Message;
   function Get_Message (Object : in Mblog_Ref)
                  return Ada.Strings.Unbounded.Unbounded_String is
      Impl : constant Mblog_Access
         := Mblog_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Message;
   end Get_Message;


   procedure Set_Creation_Date (Object : in out Mblog_Ref;
                                Value  : in Ada.Calendar.Time) is
      Impl : Mblog_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Time (Impl.all, 4, Impl.Creation_Date, Value);
   end Set_Creation_Date;

   function Get_Creation_Date (Object : in Mblog_Ref)
                  return Ada.Calendar.Time is
      Impl : constant Mblog_Access
         := Mblog_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Creation_Date;
   end Get_Creation_Date;


   procedure Set_Author (Object : in out Mblog_Ref;
                         Value  : in AWA.Users.Models.User_Ref'Class) is
      Impl : Mblog_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Object (Impl.all, 5, Impl.Author, Value);
   end Set_Author;

   function Get_Author (Object : in Mblog_Ref)
                  return AWA.Users.Models.User_Ref'Class is
      Impl : constant Mblog_Access
         := Mblog_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Author;
   end Get_Author;

   --  Copy of the object.
   procedure Copy (Object : in Mblog_Ref;
                   Into   : in out Mblog_Ref) is
      Result : Mblog_Ref;
   begin
      if not Object.Is_Null then
         declare
            Impl : constant Mblog_Access
              := Mblog_Impl (Object.Get_Load_Object.all)'Access;
            Copy : constant Mblog_Access
              := new Mblog_Impl;
         begin
            ADO.Objects.Set_Object (Result, Copy.all'Access);
            Copy.Copy (Impl.all);
            Copy.Version := Impl.Version;
            Copy.Message := Impl.Message;
            Copy.Creation_Date := Impl.Creation_Date;
            Copy.Author := Impl.Author;
         end;
      end if;
      Into := Result;
   end Copy;

   overriding
   procedure Find (Object  : in out Mblog_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Impl  : constant Mblog_Access := new Mblog_Impl;
   begin
      Impl.Find (Session, Query, Found);
      if Found then
         ADO.Objects.Set_Object (Object, Impl.all'Access);
      else
         ADO.Objects.Set_Object (Object, null);
         Destroy (Impl);
      end if;
   end Find;

   procedure Load (Object  : in out Mblog_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier) is
      Impl  : constant Mblog_Access := new Mblog_Impl;
      Found : Boolean;
      Query : ADO.SQL.Query;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Impl.Find (Session, Query, Found);
      if not Found then
         Destroy (Impl);
         raise ADO.Objects.NOT_FOUND;
      end if;
      ADO.Objects.Set_Object (Object, Impl.all'Access);
   end Load;

   procedure Load (Object  : in out Mblog_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean) is
      Impl  : constant Mblog_Access := new Mblog_Impl;
      Query : ADO.SQL.Query;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Impl.Find (Session, Query, Found);
      if not Found then
         Destroy (Impl);
      else
         ADO.Objects.Set_Object (Object, Impl.all'Access);
      end if;
   end Load;

   procedure Reload (Object  : in out Mblog_Ref;
                     Session : in out ADO.Sessions.Session'Class;
                     Updated : out Boolean) is
      Result : ADO.Objects.Object_Record_Access;
      Impl   : Mblog_Access;
      Query  : ADO.SQL.Query;
      Id     : ADO.Identifier;
   begin
      if Object.Is_Null then
         raise ADO.Objects.NULL_ERROR;
      end if;
      Object.Prepare_Modify (Result);
      Impl := Mblog_Impl (Result.all)'Access;
      Id := ADO.Objects.Get_Key_Value (Impl.all);
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Bind_Param (Position => 2, Value => Impl.Version);
      Query.Set_Filter ("id = ? AND version != ?");
      declare
         Stmt : ADO.Statements.Query_Statement
             := Session.Create_Statement (Query, MBLOG_DEF'Access);
      begin
         Stmt.Execute;
         if Stmt.Has_Elements then
            Updated := True;
            Impl.Load (Stmt, Session);
         else
            Updated := False;
         end if;
      end;
   end Reload;

   overriding
   procedure Save (Object  : in out Mblog_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Impl : ADO.Objects.Object_Record_Access := Object.Get_Object;
   begin
      if Impl = null then
         Impl := new Mblog_Impl;
         ADO.Objects.Set_Object (Object, Impl);
      end if;
      if not ADO.Objects.Is_Created (Impl.all) then
         Impl.Create (Session);
      else
         Impl.Save (Session);
      end if;
   end Save;

   overriding
   procedure Delete (Object  : in out Mblog_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Impl : constant ADO.Objects.Object_Record_Access := Object.Get_Object;
   begin
      if Impl /= null then
         Impl.Delete (Session);
      end if;
   end Delete;

   --  --------------------
   --  Free the object
   --  --------------------
   overriding
   procedure Destroy (Object : access Mblog_Impl) is
      type Mblog_Impl_Ptr is access all Mblog_Impl;
      procedure Unchecked_Free is new Ada.Unchecked_Deallocation
              (Mblog_Impl, Mblog_Impl_Ptr);
      pragma Warnings (Off, "*redundant conversion*");
      Ptr : Mblog_Impl_Ptr := Mblog_Impl (Object.all)'Access;
      pragma Warnings (On, "*redundant conversion*");
   begin
      Unchecked_Free (Ptr);
   end Destroy;

   overriding
   procedure Find (Object  : in out Mblog_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Stmt : ADO.Statements.Query_Statement
          := Session.Create_Statement (Query, MBLOG_DEF'Access);
   begin
      Stmt.Execute;
      if Stmt.Has_Elements then
         Object.Load (Stmt, Session);
         Stmt.Next;
         Found := not Stmt.Has_Elements;
      else
         Found := False;
      end if;
   end Find;

   overriding
   procedure Load (Object  : in out Mblog_Impl;
                   Session : in out ADO.Sessions.Session'Class) is
      Found : Boolean;
      Query : ADO.SQL.Query;
      Id    : constant ADO.Identifier := Object.Get_Key_Value;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Object.Find (Session, Query, Found);
      if not Found then
         raise ADO.Objects.NOT_FOUND;
      end if;
   end Load;

   overriding
   procedure Save (Object  : in out Mblog_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Update_Statement
         := Session.Create_Statement (MBLOG_DEF'Access);
   begin
      if Object.Is_Modified (1) then
         Stmt.Save_Field (Name  => COL_0_1_NAME, --  id
                          Value => Object.Get_Key);
         Object.Clear_Modified (1);
      end if;
      if Object.Is_Modified (3) then
         Stmt.Save_Field (Name  => COL_2_1_NAME, --  message
                          Value => Object.Message);
         Object.Clear_Modified (3);
      end if;
      if Object.Is_Modified (4) then
         Stmt.Save_Field (Name  => COL_3_1_NAME, --  creation_date
                          Value => Object.Creation_Date);
         Object.Clear_Modified (4);
      end if;
      if Object.Is_Modified (5) then
         Stmt.Save_Field (Name  => COL_4_1_NAME, --  author_id
                          Value => Object.Author);
         Object.Clear_Modified (5);
      end if;
      if Stmt.Has_Save_Fields then
         Object.Version := Object.Version + 1;
         Stmt.Save_Field (Name  => "version",
                          Value => Object.Version);
         Stmt.Set_Filter (Filter => "id = ? and version = ?");
         Stmt.Add_Param (Value => Object.Get_Key);
         Stmt.Add_Param (Value => Object.Version - 1);
         declare
            Result : Integer;
         begin
            Stmt.Execute (Result);
            if Result /= 1 then
               if Result /= 0 then
                  raise ADO.Objects.UPDATE_ERROR;
               else
                  raise ADO.Objects.LAZY_LOCK;
               end if;
            end if;
         end;
      end if;
   end Save;

   overriding
   procedure Create (Object  : in out Mblog_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Query : ADO.Statements.Insert_Statement
                  := Session.Create_Statement (MBLOG_DEF'Access);
      Result : Integer;
   begin
      Object.Version := 1;
      Session.Allocate (Id => Object);
      Query.Save_Field (Name  => COL_0_1_NAME, --  id
                        Value => Object.Get_Key);
      Query.Save_Field (Name  => COL_1_1_NAME, --  version
                        Value => Object.Version);
      Query.Save_Field (Name  => COL_2_1_NAME, --  message
                        Value => Object.Message);
      Query.Save_Field (Name  => COL_3_1_NAME, --  creation_date
                        Value => Object.Creation_Date);
      Query.Save_Field (Name  => COL_4_1_NAME, --  author_id
                        Value => Object.Author);
      Query.Execute (Result);
      if Result /= 1 then
         raise ADO.Objects.INSERT_ERROR;
      end if;
      ADO.Objects.Set_Created (Object);
   end Create;

   overriding
   procedure Delete (Object  : in out Mblog_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Delete_Statement
         := Session.Create_Statement (MBLOG_DEF'Access);
   begin
      Stmt.Set_Filter (Filter => "id = ?");
      Stmt.Add_Param (Value => Object.Get_Key);
      Stmt.Execute;
   end Delete;

   --  ------------------------------
   --  Get the bean attribute identified by the name.
   --  ------------------------------
   overriding
   function Get_Value (From : in Mblog_Ref;
                       Name : in String) return Util.Beans.Objects.Object is
      Obj  : ADO.Objects.Object_Record_Access;
      Impl : access Mblog_Impl;
   begin
      if From.Is_Null then
         return Util.Beans.Objects.Null_Object;
      end if;
      Obj := From.Get_Load_Object;
      Impl := Mblog_Impl (Obj.all)'Access;
      if Name = "id" then
         return ADO.Objects.To_Object (Impl.Get_Key);
      elsif Name = "message" then
         return Util.Beans.Objects.To_Object (Impl.Message);
      elsif Name = "creation_date" then
         return Util.Beans.Objects.Time.To_Object (Impl.Creation_Date);
      end if;
      return Util.Beans.Objects.Null_Object;
   end Get_Value;



   --  ------------------------------
   --  Load the object from current iterator position
   --  ------------------------------
   procedure Load (Object  : in out Mblog_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class) is
   begin
      Object.Set_Key_Value (Stmt.Get_Identifier (0));
      Object.Message := Stmt.Get_Unbounded_String (2);
      Object.Creation_Date := Stmt.Get_Time (3);
      if not Stmt.Is_Null (4) then
         Object.Author.Set_Key_Value (Stmt.Get_Identifier (4), Session);
      end if;
      Object.Version := Stmt.Get_Integer (1);
      ADO.Objects.Set_Created (Object);
   end Load;


   --  ------------------------------
   --  Get the bean attribute identified by the name.
   --  ------------------------------
   overriding
   function Get_Value (From : in List_Info;
                       Name : in String) return Util.Beans.Objects.Object is
   begin
      if Name = "id" then
         return Util.Beans.Objects.To_Object (Long_Long_Integer (From.Id));
      elsif Name = "message" then
         return Util.Beans.Objects.To_Object (From.Message);
      elsif Name = "create_date" then
         return Util.Beans.Objects.Time.To_Object (From.Create_Date);
      elsif Name = "name" then
         return Util.Beans.Objects.To_Object (From.Name);
      elsif Name = "email" then
         return Util.Beans.Objects.To_Object (From.Email);
      end if;
      return Util.Beans.Objects.Null_Object;
   end Get_Value;


   --  ------------------------------
   --  Set the value identified by the name
   --  ------------------------------
   overriding
   procedure Set_Value (Item  : in out List_Info;
                        Name  : in String;
                        Value : in Util.Beans.Objects.Object) is
   begin
      if Name = "id" then
         Item.Id := ADO.Identifier (Util.Beans.Objects.To_Long_Long_Integer (Value));
      elsif Name = "message" then
         Item.Message := Util.Beans.Objects.To_Unbounded_String (Value);
      elsif Name = "create_date" then
         Item.Create_Date := Util.Beans.Objects.Time.To_Time (Value);
      elsif Name = "name" then
         Item.Name := Util.Beans.Objects.To_Unbounded_String (Value);
      elsif Name = "email" then
         Item.Email := Util.Beans.Objects.To_Unbounded_String (Value);
      end if;
   end Set_Value;


   --  --------------------
   --  Run the query controlled by <b>Context</b> and append the list in <b>Object</b>.
   --  --------------------
   procedure List (Object  : in out List_Info_List_Bean'Class;
                   Session : in out ADO.Sessions.Session'Class;
                   Context : in out ADO.Queries.Context'Class) is
   begin
      List (Object.List, Session, Context);
   end List;

   --  --------------------
   --  The list of microblogs.
   --  --------------------
   procedure List (Object  : in out List_Info_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Context : in out ADO.Queries.Context'Class) is
      procedure Read (Into : in out List_Info);

      Stmt : ADO.Statements.Query_Statement
          := Session.Create_Statement (Context);
      Pos  : Positive := 1;
      procedure Read (Into : in out List_Info) is
      begin
         Into.Id := Stmt.Get_Identifier (0);
         Into.Message := Stmt.Get_Unbounded_String (1);
         Into.Create_Date := Stmt.Get_Time (2);
         Into.Name := Stmt.Get_Unbounded_String (3);
         Into.Email := Stmt.Get_Unbounded_String (4);
      end Read;
   begin
      Stmt.Execute;
      List_Info_Vectors.Clear (Object);
      while Stmt.Has_Elements loop
         Object.Insert_Space (Before => Pos);
         Object.Update_Element (Index => Pos, Process => Read'Access);
         Pos := Pos + 1;
         Stmt.Next;
      end loop;
   end List;



end Atlas.Microblog.Models;
