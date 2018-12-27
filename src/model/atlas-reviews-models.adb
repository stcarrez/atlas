-----------------------------------------------------------------------
--  Atlas.Reviews.Models -- Atlas.Reviews.Models
-----------------------------------------------------------------------
--  File generated by ada-gen DO NOT MODIFY
--  Template used: templates/model/package-body.xhtml
--  Ada Generator: https://ada-gen.googlecode.com/svn/trunk Revision 1095
-----------------------------------------------------------------------
--  Copyright (C) 2018 Stephane Carrez
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
with Ada.Unchecked_Deallocation;
with Util.Beans.Objects.Time;
with ASF.Events.Faces.Actions;
package body Atlas.Reviews.Models is

   use type ADO.Objects.Object_Record_Access;
   use type ADO.Objects.Object_Ref;

   pragma Warnings (Off, "formal parameter * is not referenced");

   function Review_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key is
      Result : ADO.Objects.Object_Key (Of_Type  => ADO.Objects.KEY_INTEGER,
                                       Of_Class => REVIEW_DEF'Access);
   begin
      ADO.Objects.Set_Value (Result, Id);
      return Result;
   end Review_Key;

   function Review_Key (Id : in String) return ADO.Objects.Object_Key is
      Result : ADO.Objects.Object_Key (Of_Type  => ADO.Objects.KEY_INTEGER,
                                       Of_Class => REVIEW_DEF'Access);
   begin
      ADO.Objects.Set_Value (Result, Id);
      return Result;
   end Review_Key;

   function "=" (Left, Right : Review_Ref'Class) return Boolean is
   begin
      return ADO.Objects.Object_Ref'Class (Left) = ADO.Objects.Object_Ref'Class (Right);
   end "=";

   procedure Set_Field (Object : in out Review_Ref'Class;
                        Impl   : out Review_Access) is
      Result : ADO.Objects.Object_Record_Access;
   begin
      Object.Prepare_Modify (Result);
      Impl := Review_Impl (Result.all)'Access;
   end Set_Field;

   --  Internal method to allocate the Object_Record instance
   procedure Allocate (Object : in out Review_Ref) is
      Impl : Review_Access;
   begin
      Impl := new Review_Impl;
      Impl.Version := 0;
      Impl.Create_Date := ADO.DEFAULT_TIME;
      Impl.Allow_Comments := 0;
      ADO.Objects.Set_Object (Object, Impl.all'Access);
   end Allocate;

   -- ----------------------------------------
   --  Data object: Review
   -- ----------------------------------------

   procedure Set_Id (Object : in out Review_Ref;
                     Value  : in ADO.Identifier) is
      Impl : Review_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Key_Value (Impl.all, 1, Value);
   end Set_Id;

   function Get_Id (Object : in Review_Ref)
                  return ADO.Identifier is
      Impl : constant Review_Access
         := Review_Impl (Object.Get_Object.all)'Access;
   begin
      return Impl.Get_Key_Value;
   end Get_Id;


   function Get_Version (Object : in Review_Ref)
                  return Integer is
      Impl : constant Review_Access
         := Review_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Version;
   end Get_Version;


   procedure Set_Title (Object : in out Review_Ref;
                         Value : in String) is
      Impl : Review_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 3, Impl.Title, Value);
   end Set_Title;

   procedure Set_Title (Object : in out Review_Ref;
                        Value  : in Ada.Strings.Unbounded.Unbounded_String) is
      Impl : Review_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Unbounded_String (Impl.all, 3, Impl.Title, Value);
   end Set_Title;

   function Get_Title (Object : in Review_Ref)
                 return String is
   begin
      return Ada.Strings.Unbounded.To_String (Object.Get_Title);
   end Get_Title;
   function Get_Title (Object : in Review_Ref)
                  return Ada.Strings.Unbounded.Unbounded_String is
      Impl : constant Review_Access
         := Review_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Title;
   end Get_Title;


   procedure Set_Text (Object : in out Review_Ref;
                        Value : in String) is
      Impl : Review_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 4, Impl.Text, Value);
   end Set_Text;

   procedure Set_Text (Object : in out Review_Ref;
                       Value  : in Ada.Strings.Unbounded.Unbounded_String) is
      Impl : Review_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Unbounded_String (Impl.all, 4, Impl.Text, Value);
   end Set_Text;

   function Get_Text (Object : in Review_Ref)
                 return String is
   begin
      return Ada.Strings.Unbounded.To_String (Object.Get_Text);
   end Get_Text;
   function Get_Text (Object : in Review_Ref)
                  return Ada.Strings.Unbounded.Unbounded_String is
      Impl : constant Review_Access
         := Review_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Text;
   end Get_Text;


   procedure Set_Create_Date (Object : in out Review_Ref;
                              Value  : in Ada.Calendar.Time) is
      Impl : Review_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Time (Impl.all, 5, Impl.Create_Date, Value);
   end Set_Create_Date;

   function Get_Create_Date (Object : in Review_Ref)
                  return Ada.Calendar.Time is
      Impl : constant Review_Access
         := Review_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Create_Date;
   end Get_Create_Date;


   procedure Set_Allow_Comments (Object : in out Review_Ref;
                                 Value  : in Integer) is
      Impl : Review_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Integer (Impl.all, 6, Impl.Allow_Comments, Value);
   end Set_Allow_Comments;

   function Get_Allow_Comments (Object : in Review_Ref)
                  return Integer is
      Impl : constant Review_Access
         := Review_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Allow_Comments;
   end Get_Allow_Comments;


   procedure Set_Site (Object : in out Review_Ref;
                        Value : in String) is
      Impl : Review_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 7, Impl.Site, Value);
   end Set_Site;

   procedure Set_Site (Object : in out Review_Ref;
                       Value  : in Ada.Strings.Unbounded.Unbounded_String) is
      Impl : Review_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Unbounded_String (Impl.all, 7, Impl.Site, Value);
   end Set_Site;

   function Get_Site (Object : in Review_Ref)
                 return String is
   begin
      return Ada.Strings.Unbounded.To_String (Object.Get_Site);
   end Get_Site;
   function Get_Site (Object : in Review_Ref)
                  return Ada.Strings.Unbounded.Unbounded_String is
      Impl : constant Review_Access
         := Review_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Site;
   end Get_Site;


   procedure Set_Reviewer (Object : in out Review_Ref;
                           Value  : in AWA.Users.Models.User_Ref'Class) is
      Impl : Review_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Object (Impl.all, 8, Impl.Reviewer, Value);
   end Set_Reviewer;

   function Get_Reviewer (Object : in Review_Ref)
                  return AWA.Users.Models.User_Ref'Class is
      Impl : constant Review_Access
         := Review_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Reviewer;
   end Get_Reviewer;

   --  Copy of the object.
   procedure Copy (Object : in Review_Ref;
                   Into   : in out Review_Ref) is
      Result : Review_Ref;
   begin
      if not Object.Is_Null then
         declare
            Impl : constant Review_Access
              := Review_Impl (Object.Get_Load_Object.all)'Access;
            Copy : constant Review_Access
              := new Review_Impl;
         begin
            ADO.Objects.Set_Object (Result, Copy.all'Access);
            Copy.Copy (Impl.all);
            Copy.Version := Impl.Version;
            Copy.Title := Impl.Title;
            Copy.Text := Impl.Text;
            Copy.Create_Date := Impl.Create_Date;
            Copy.Allow_Comments := Impl.Allow_Comments;
            Copy.Site := Impl.Site;
            Copy.Reviewer := Impl.Reviewer;
         end;
      end if;
      Into := Result;
   end Copy;

   procedure Find (Object  : in out Review_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Impl  : constant Review_Access := new Review_Impl;
   begin
      Impl.Find (Session, Query, Found);
      if Found then
         ADO.Objects.Set_Object (Object, Impl.all'Access);
      else
         ADO.Objects.Set_Object (Object, null);
         Destroy (Impl);
      end if;
   end Find;

   procedure Load (Object  : in out Review_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier) is
      Impl  : constant Review_Access := new Review_Impl;
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

   procedure Load (Object  : in out Review_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean) is
      Impl  : constant Review_Access := new Review_Impl;
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

   procedure Save (Object  : in out Review_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Impl : ADO.Objects.Object_Record_Access := Object.Get_Object;
   begin
      if Impl = null then
         Impl := new Review_Impl;
         ADO.Objects.Set_Object (Object, Impl);
      end if;
      if not ADO.Objects.Is_Created (Impl.all) then
         Impl.Create (Session);
      else
         Impl.Save (Session);
      end if;
   end Save;

   procedure Delete (Object  : in out Review_Ref;
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
   procedure Destroy (Object : access Review_Impl) is
      type Review_Impl_Ptr is access all Review_Impl;
      procedure Unchecked_Free is new Ada.Unchecked_Deallocation
              (Review_Impl, Review_Impl_Ptr);
      pragma Warnings (Off, "*redundant conversion*");
      Ptr : Review_Impl_Ptr := Review_Impl (Object.all)'Access;
      pragma Warnings (On, "*redundant conversion*");
   begin
      Unchecked_Free (Ptr);
   end Destroy;

   procedure Find (Object  : in out Review_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Stmt : ADO.Statements.Query_Statement
          := Session.Create_Statement (Query, REVIEW_DEF'Access);
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
   procedure Load (Object  : in out Review_Impl;
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

   procedure Save (Object  : in out Review_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Update_Statement
         := Session.Create_Statement (REVIEW_DEF'Access);
   begin
      if Object.Is_Modified (1) then
         Stmt.Save_Field (Name  => COL_0_1_NAME, --  id
                          Value => Object.Get_Key);
         Object.Clear_Modified (1);
      end if;
      if Object.Is_Modified (3) then
         Stmt.Save_Field (Name  => COL_2_1_NAME, --  title
                          Value => Object.Title);
         Object.Clear_Modified (3);
      end if;
      if Object.Is_Modified (4) then
         Stmt.Save_Field (Name  => COL_3_1_NAME, --  text
                          Value => Object.Text);
         Object.Clear_Modified (4);
      end if;
      if Object.Is_Modified (5) then
         Stmt.Save_Field (Name  => COL_4_1_NAME, --  create_date
                          Value => Object.Create_Date);
         Object.Clear_Modified (5);
      end if;
      if Object.Is_Modified (6) then
         Stmt.Save_Field (Name  => COL_5_1_NAME, --  allow_comments
                          Value => Object.Allow_Comments);
         Object.Clear_Modified (6);
      end if;
      if Object.Is_Modified (7) then
         Stmt.Save_Field (Name  => COL_6_1_NAME, --  site
                          Value => Object.Site);
         Object.Clear_Modified (7);
      end if;
      if Object.Is_Modified (8) then
         Stmt.Save_Field (Name  => COL_7_1_NAME, --  reviewer_id
                          Value => Object.Reviewer);
         Object.Clear_Modified (8);
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

   procedure Create (Object  : in out Review_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Query : ADO.Statements.Insert_Statement
                  := Session.Create_Statement (REVIEW_DEF'Access);
      Result : Integer;
   begin
      Object.Version := 1;
      Session.Allocate (Id => Object);
      Query.Save_Field (Name  => COL_0_1_NAME, --  id
                        Value => Object.Get_Key);
      Query.Save_Field (Name  => COL_1_1_NAME, --  version
                        Value => Object.Version);
      Query.Save_Field (Name  => COL_2_1_NAME, --  title
                        Value => Object.Title);
      Query.Save_Field (Name  => COL_3_1_NAME, --  text
                        Value => Object.Text);
      Query.Save_Field (Name  => COL_4_1_NAME, --  create_date
                        Value => Object.Create_Date);
      Query.Save_Field (Name  => COL_5_1_NAME, --  allow_comments
                        Value => Object.Allow_Comments);
      Query.Save_Field (Name  => COL_6_1_NAME, --  site
                        Value => Object.Site);
      Query.Save_Field (Name  => COL_7_1_NAME, --  reviewer_id
                        Value => Object.Reviewer);
      Query.Execute (Result);
      if Result /= 1 then
         raise ADO.Objects.INSERT_ERROR;
      end if;
      ADO.Objects.Set_Created (Object);
   end Create;

   procedure Delete (Object  : in out Review_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Delete_Statement
         := Session.Create_Statement (REVIEW_DEF'Access);
   begin
      Stmt.Set_Filter (Filter => "id = ?");
      Stmt.Add_Param (Value => Object.Get_Key);
      Stmt.Execute;
   end Delete;

   --  ------------------------------
   --  Get the bean attribute identified by the name.
   --  ------------------------------
   overriding
   function Get_Value (From : in Review_Ref;
                       Name : in String) return Util.Beans.Objects.Object is
      Obj  : ADO.Objects.Object_Record_Access;
      Impl : access Review_Impl;
   begin
      if From.Is_Null then
         return Util.Beans.Objects.Null_Object;
      end if;
      Obj := From.Get_Load_Object;
      Impl := Review_Impl (Obj.all)'Access;
      if Name = "id" then
         return ADO.Objects.To_Object (Impl.Get_Key);
      elsif Name = "title" then
         return Util.Beans.Objects.To_Object (Impl.Title);
      elsif Name = "text" then
         return Util.Beans.Objects.To_Object (Impl.Text);
      elsif Name = "create_date" then
         return Util.Beans.Objects.Time.To_Object (Impl.Create_Date);
      elsif Name = "allow_comments" then
         return Util.Beans.Objects.To_Object (Long_Long_Integer (Impl.Allow_Comments));
      elsif Name = "site" then
         return Util.Beans.Objects.To_Object (Impl.Site);
      end if;
      return Util.Beans.Objects.Null_Object;
   end Get_Value;


   procedure List (Object  : in out Review_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class) is
      Stmt : ADO.Statements.Query_Statement
        := Session.Create_Statement (Query, REVIEW_DEF'Access);
   begin
      Stmt.Execute;
      Review_Vectors.Clear (Object);
      while Stmt.Has_Elements loop
         declare
            Item : Review_Ref;
            Impl : constant Review_Access := new Review_Impl;
         begin
            Impl.Load (Stmt, Session);
            ADO.Objects.Set_Object (Item, Impl.all'Access);
            Object.Append (Item);
         end;
         Stmt.Next;
      end loop;
   end List;

   --  ------------------------------
   --  Load the object from current iterator position
   --  ------------------------------
   procedure Load (Object  : in out Review_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class) is
   begin
      Object.Set_Key_Value (Stmt.Get_Identifier (0));
      Object.Title := Stmt.Get_Unbounded_String (2);
      Object.Text := Stmt.Get_Unbounded_String (3);
      Object.Create_Date := Stmt.Get_Time (4);
      Object.Allow_Comments := Stmt.Get_Integer (5);
      Object.Site := Stmt.Get_Unbounded_String (6);
      if not Stmt.Is_Null (7) then
         Object.Reviewer.Set_Key_Value (Stmt.Get_Identifier (7), Session);
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
      elsif Name = "title" then
         return Util.Beans.Objects.To_Object (From.Title);
      elsif Name = "site" then
         return Util.Beans.Objects.To_Object (From.Site);
      elsif Name = "date" then
         return Util.Beans.Objects.Time.To_Object (From.Date);
      elsif Name = "allow_comments" then
         return Util.Beans.Objects.To_Object (From.Allow_Comments);
      elsif Name = "reviewer_id" then
         return Util.Beans.Objects.To_Object (Long_Long_Integer (From.Reviewer_Id));
      elsif Name = "reviewer_name" then
         return Util.Beans.Objects.To_Object (From.Reviewer_Name);
      elsif Name = "reviewer_email" then
         return Util.Beans.Objects.To_Object (From.Reviewer_Email);
      elsif Name = "text" then
         return Util.Beans.Objects.To_Object (From.Text);
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
      elsif Name = "title" then
         Item.Title := Util.Beans.Objects.To_Unbounded_String (Value);
      elsif Name = "site" then
         Item.Site := Util.Beans.Objects.To_Unbounded_String (Value);
      elsif Name = "date" then
         Item.Date := Util.Beans.Objects.Time.To_Time (Value);
      elsif Name = "allow_comments" then
         Item.Allow_Comments := Util.Beans.Objects.To_Boolean (Value);
      elsif Name = "reviewer_id" then
         Item.Reviewer_Id := ADO.Identifier (Util.Beans.Objects.To_Long_Long_Integer (Value));
      elsif Name = "reviewer_name" then
         Item.Reviewer_Name := Util.Beans.Objects.To_Unbounded_String (Value);
      elsif Name = "reviewer_email" then
         Item.Reviewer_Email := Util.Beans.Objects.To_Unbounded_String (Value);
      elsif Name = "text" then
         Item.Text := Util.Beans.Objects.To_Unbounded_String (Value);
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
   --  The list of reviews.
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
         Into.Title := Stmt.Get_Unbounded_String (1);
         Into.Site := Stmt.Get_Unbounded_String (2);
         Into.Date := Stmt.Get_Time (3);
         Into.Allow_Comments := Stmt.Get_Boolean (4);
         Into.Reviewer_Id := Stmt.Get_Identifier (5);
         Into.Reviewer_Name := Stmt.Get_Unbounded_String (6);
         Into.Reviewer_Email := Stmt.Get_Unbounded_String (7);
         Into.Text := Stmt.Get_Unbounded_String (8);
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


   procedure Op_Save (Bean    : in out Review_Bean;
                      Outcome : in out Ada.Strings.Unbounded.Unbounded_String);
   procedure Op_Save (Bean    : in out Review_Bean;
                      Outcome : in out Ada.Strings.Unbounded.Unbounded_String) is
   begin
      Review_Bean'Class (Bean).Save (Outcome);
   end Op_Save;
   package Binding_Review_Bean_1 is
     new ASF.Events.Faces.Actions.Action_Method.Bind (Bean   => Review_Bean,
                                                      Method => Op_Save,
                                                      Name   => "save");
   procedure Op_Delete (Bean    : in out Review_Bean;
                        Outcome : in out Ada.Strings.Unbounded.Unbounded_String);
   procedure Op_Delete (Bean    : in out Review_Bean;
                        Outcome : in out Ada.Strings.Unbounded.Unbounded_String) is
   begin
      Review_Bean'Class (Bean).Delete (Outcome);
   end Op_Delete;
   package Binding_Review_Bean_2 is
     new ASF.Events.Faces.Actions.Action_Method.Bind (Bean   => Review_Bean,
                                                      Method => Op_Delete,
                                                      Name   => "delete");
   procedure Op_Load (Bean    : in out Review_Bean;
                      Outcome : in out Ada.Strings.Unbounded.Unbounded_String);
   procedure Op_Load (Bean    : in out Review_Bean;
                      Outcome : in out Ada.Strings.Unbounded.Unbounded_String) is
   begin
      Review_Bean'Class (Bean).Load (Outcome);
   end Op_Load;
   package Binding_Review_Bean_3 is
     new ASF.Events.Faces.Actions.Action_Method.Bind (Bean   => Review_Bean,
                                                      Method => Op_Load,
                                                      Name   => "load");

   Binding_Review_Bean_Array : aliased constant Util.Beans.Methods.Method_Binding_Array
     := (1 => Binding_Review_Bean_1.Proxy'Access,
         2 => Binding_Review_Bean_2.Proxy'Access,
         3 => Binding_Review_Bean_3.Proxy'Access
     );

   --  ------------------------------
   --  This bean provides some methods that can be used in a Method_Expression.
   --  ------------------------------
   overriding
   function Get_Method_Bindings (From : in Review_Bean)
                                 return Util.Beans.Methods.Method_Binding_Array_Access is
      pragma Unreferenced (From);
   begin
      return Binding_Review_Bean_Array'Access;
   end Get_Method_Bindings;

   --  ------------------------------
   --  Set the value identified by the name
   --  ------------------------------
   overriding
   procedure Set_Value (Item  : in out Review_Bean;
                        Name  : in String;
                        Value : in Util.Beans.Objects.Object) is
   begin
      if Name = "title" then
         Item.Set_Title (Util.Beans.Objects.To_String (Value));
      elsif Name = "text" then
         Item.Set_Text (Util.Beans.Objects.To_String (Value));
      elsif Name = "create_date" then
         Item.Set_Create_Date (Util.Beans.Objects.Time.To_Time (Value));
      elsif Name = "allow_comments" then
         Item.Set_Allow_Comments (Util.Beans.Objects.To_Integer (Value));
      elsif Name = "site" then
         Item.Set_Site (Util.Beans.Objects.To_String (Value));
      end if;
   end Set_Value;

   procedure Op_Load (Bean    : in out Review_List_Bean;
                      Outcome : in out Ada.Strings.Unbounded.Unbounded_String);
   procedure Op_Load (Bean    : in out Review_List_Bean;
                      Outcome : in out Ada.Strings.Unbounded.Unbounded_String) is
   begin
      Review_List_Bean'Class (Bean).Load (Outcome);
   end Op_Load;
   package Binding_Review_List_Bean_1 is
     new ASF.Events.Faces.Actions.Action_Method.Bind (Bean   => Review_List_Bean,
                                                      Method => Op_Load,
                                                      Name   => "load");

   Binding_Review_List_Bean_Array : aliased constant Util.Beans.Methods.Method_Binding_Array
     := (1 => Binding_Review_List_Bean_1.Proxy'Access
     );

   --  ------------------------------
   --  This bean provides some methods that can be used in a Method_Expression.
   --  ------------------------------
   overriding
   function Get_Method_Bindings (From : in Review_List_Bean)
                                 return Util.Beans.Methods.Method_Binding_Array_Access is
      pragma Unreferenced (From);
   begin
      return Binding_Review_List_Bean_Array'Access;
   end Get_Method_Bindings;
   --  ------------------------------
   --  Get the bean attribute identified by the name.
   --  ------------------------------
   overriding
   function Get_Value (From : in Review_List_Bean;
                       Name : in String) return Util.Beans.Objects.Object is
   begin
      if Name = "page" then
         return Util.Beans.Objects.To_Object (Long_Long_Integer (From.Page));
      elsif Name = "count" then
         return Util.Beans.Objects.To_Object (Long_Long_Integer (From.Count));
      elsif Name = "page_size" then
         return Util.Beans.Objects.To_Object (Long_Long_Integer (From.Page_Size));
      end if;
      return Util.Beans.Objects.Null_Object;
   end Get_Value;


   --  ------------------------------
   --  Set the value identified by the name
   --  ------------------------------
   overriding
   procedure Set_Value (Item  : in out Review_List_Bean;
                        Name  : in String;
                        Value : in Util.Beans.Objects.Object) is
   begin
      if Name = "page" then
         Item.Page := Util.Beans.Objects.To_Integer (Value);
      elsif Name = "count" then
         Item.Count := Util.Beans.Objects.To_Integer (Value);
      elsif Name = "page_size" then
         Item.Page_Size := Util.Beans.Objects.To_Integer (Value);
      end if;
   end Set_Value;


end Atlas.Reviews.Models;
