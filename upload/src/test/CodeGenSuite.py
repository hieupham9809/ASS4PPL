import unittest
from TestUtils import TestCodeGen
from AST import *


class CheckCodeGenSuite(unittest.TestCase):
    # def test_int(self):
    #     """Simple program: int main() {} """
    #     input = """procedure main(); begin putInt(100); end"""
    #     expect = "100"
    #     self.assertTrue(TestCodeGen.test(input,expect,500))
    # def test_int_ast(self):
    # 	input = Program([
    # 		FuncDecl(Id("main"),[],[],[
    # 			CallStmt(Id("putInt"),[IntLiteral(5)])])])
    # 	expect = "5"
    # 	self.assertTrue(TestCodeGen.test(input,expect,501))
    # def test_float(self):
    #     """Simple program: int main() {} """
    #     input = """procedure main(); begin putFloat(1.2); end"""
    #     expect = "1.2"
    #     self.assertTrue(TestCodeGen.test(input,expect,502))
    # def test_vardecl_in_function(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 function foo():integer;
    #                 begin end
    #                 procedure main(); 
    #                 var x: real;
    #                 begin putInt(3);end
    #                 """
    #     expect = "3"
    #     self.assertTrue(TestCodeGen.test(input,expect,503))
    # def test_vardecl_in_procedure(self):
    #     """Simple program: int main() {} """
    #     input = """var y:integer;z:string;
    #                 procedure main(); var x: real;
    #                 begin putInt(5+3);  end
    #                 """
    #     expect = "8"
    #     self.assertTrue(TestCodeGen.test(input,expect,504))
    # def test_binary_minus(self):
    #     """Simple program: int main() {} """
    #     input = """var y:integer;z:string;
    #                 procedure main(); var x: real;
    #                 begin putInt(5-3);  end
    #                 """
    #     expect = "2"
    #     self.assertTrue(TestCodeGen.test(input,expect,505))
    # def test_binary_mul(self):
    #     """Simple program: int main() {} """
    #     input = """var y:integer;z:string;
    #                 procedure main(); var x: real;
    #                 begin putInt(5*3);  end
    #                 """
    #     expect = "15"
    #     self.assertTrue(TestCodeGen.test(input,expect,506))
    # def test_binary_divide(self):
    #     """Simple program: int main() {} """
    #     input = """var a,b:integer;
    #                 procedure main();
    #                 begin putFloat(6/2);  end
    #                 """
    #     expect = "3.0"
    #     self.assertTrue(TestCodeGen.test(input,expect,507))
    # def test_binary_div(self):
    #     """Simple program: int main() {} """
    #     input = """var a,b:integer;
    #                 procedure main();
    #                 begin putInt(6 div 2);  end
    #                 """
    #     expect = "3"
    #     self.assertTrue(TestCodeGen.test(input,expect,508))
    # def test_binary_not_true(self):
    #     """Simple program: int main() {} """
    #     input = """var a,b:integer;
    #                 procedure main();
    #                 begin putBool(not true);  end
    #                 """
    #     expect = "false"
    #     self.assertTrue(TestCodeGen.test(input,expect,509))
    # def test_binary_not_false(self):
    #     """Simple program: int main() {} """
    #     input = """var a,b:integer;
    #                 procedure main();
    #                 begin putBool(not false);  end
    #                 """
    #     expect = "true"
    #     self.assertTrue(TestCodeGen.test(input,expect,510))
    # def test_binary_expr_float(self):
    #     """Simple program: int main() {} """
    #     input = """var a,b:integer;
    #                 procedure main();
    #                 begin putFloat(1.5 - 1);  end
    #                 """
    #     expect = "0.5"
    #     self.assertTrue(TestCodeGen.test(input,expect,511))
    # def test_binary_expr_neg_int(self):
    #     """Simple program: int main() {} """
    #     input = """var a,b:integer;
    #                 procedure main();
    #                 begin putInt(-1);  end
    #                 """
    #     expect = "-1"
    #     self.assertTrue(TestCodeGen.test(input,expect,512))
    # def test_binary_expr_neg_float(self):
    #     """Simple program: int main() {} """
    #     input = """var a,b:integer;
    #                 procedure main();
    #                 begin putFloat(-1.5);  end
    #                 """
    #     expect = "-1.5"
    #     self.assertTrue(TestCodeGen.test(input,expect,513))
    # def test_assign_int(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 procedure main();
    #                 var x:integer;
    #                 begin 
    #                 x := 2;
    #                 putInt(x);  end
    #                 """
    #     expect = "2"
    #     self.assertTrue(TestCodeGen.test(input,expect,514))
    # def test_assign_float(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 procedure main();
    #                 var x:real;
    #                 begin 
    #                 x := 2.5;
    #                 putFloat(x);  end
    #                 """
    #     expect = "2.5"
    #     self.assertTrue(TestCodeGen.test(input,expect,515))
    # def test_assign_local_float_coerc_int(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 procedure main();
    #                 var x:real;
    #                 begin 
    #                 x := 2;
    #                 putFloat(x);  end
    #                 """
    #     expect = "2.0"
    #     self.assertTrue(TestCodeGen.test(input,expect,516))
    # def test_assign_global_float_coerc_int(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 var x:real;
    #                 procedure main();
    #                 begin 
    #                 x := 5;
    #                 putFloat(x);  end
    #                 """
    #     expect = "5.0"
    #     self.assertTrue(TestCodeGen.test(input,expect,517))
    # def test_assign_global_float(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 var x:real;
    #                 procedure main();
    #                 begin 
    #                 x := 2.9;
    #                 putFloat(x);  end
    #                 """
    #     expect = "2.9"
    #     self.assertTrue(TestCodeGen.test(input,expect,518))
    # def test_assign_global_int(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 var x:integer;
    #                 procedure main();
    #                 begin 
    #                 x := 4;
    #                 putInt(x);  end
    #                 """
    #     expect = "4"
    #     self.assertTrue(TestCodeGen.test(input,expect,519))
    # def test_if_true_stmt(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 var x,y:integer;
    #                 procedure main();
    #                 begin 
    #                 x := 1;
    #                 y := 2;
    #                 if (true)
    #                 then putInt(x);
    #                 else putInt(y);  
    #                 end
    #                 """
    #     expect = "1"
    #     self.assertTrue(TestCodeGen.test(input,expect,520))
    # def test_if_false_stmt(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 var x,y:integer;
    #                 procedure main();
    #                 begin 
    #                 x := 1;
    #                 y := 2;
    #                 if (false)
    #                 then putInt(x);
    #                 else putInt(y);  
    #                 end
    #                 """
    #     expect = "2"
    #     self.assertTrue(TestCodeGen.test(input,expect,521))
    # def test_if_false_binaryOp_stmt(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 var x,y:integer;
    #                 procedure main();
    #                 begin 
    #                 x := 1;
    #                 y := 2;
    #                 if (1>2)
    #                 then putInt(x);
    #                 else putInt(y);  
    #                 end
    #                 """
    #     expect = "2"
    #     self.assertTrue(TestCodeGen.test(input,expect,522))
    # def test_while_stmt(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 var x,y:integer;
    #                 procedure main();
    #                 var z: integer;
    #                 begin 
    #                 x := 1;
    #                 while(x < 4)
    #                 do x := x + 1;
    #                 putInt(x); 
    #                 end
    #                 """
    #     expect = "4"
    #     self.assertTrue(TestCodeGen.test(input,expect,523))
    # def test_while_stmt_with_break(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 var x,y:integer;
    #                 procedure main();
    #                 var z: integer;
    #                 begin 
    #                 x := 1;
    #                 while(x < 4)
    #                 do 
    #                 begin
    #                     x := x + 1;
    #                     break;
    #                 end
    #                 putInt(x); 
    #                 end
    #                 """
    #     expect = "2"
    #     self.assertTrue(TestCodeGen.test(input,expect,524))
    # def test_while_stmt_with_break_and_if(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 var x,y:integer;
    #                 procedure main();
    #                 var z: integer;
    #                 begin 
    #                 x := 1;
    #                 while(x < 4)
    #                 do 
    #                 begin
    #                     x := x + 1;
    #                     if (x <> 2) then
    #                         break;
                            
    #                 end
    #                 putInt(x); 
    #                 end
    #                 """
    #     expect = "3"
    #     self.assertTrue(TestCodeGen.test(input,expect,525))
    # def test_while_stmt_with_break_continue_and_if(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 var x,y:integer;
    #                 procedure main();
    #                 var z: integer;
    #                 begin 
    #                 x := 1;
    #                 while(x < 4)
    #                 do 
    #                 begin
    #                     x := x + 1;
    #                     if (x = 2) then
    #                         continue;
    #                     else break;
                            
    #                 end
    #                 putInt(x); 
    #                 end
    #                 """
    #     expect = "3"
    #     self.assertTrue(TestCodeGen.test(input,expect,526))
    # def test_for_stmt(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 var x,y:integer;
    #                 procedure main();
    #                 var z: integer;
    #                 begin 
    #                 z:=1;
    #                 for x := 1 to 5 do z := z + 1;
                    
    #                 putInt(z); 
    #                 end
    #                 """
    #     expect = "6"
    #     self.assertTrue(TestCodeGen.test(input,expect,527))
    # def test_for_with_breakstmt(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 var x,y:integer;
    #                 procedure main();
    #                 var z: integer;
    #                 begin 
    #                 z:=1;
    #                 for x := 1 to 5 do
    #                     begin
    #                      z := z + 1;
    #                      if (z = 3) then break;
    #                     end
    #                 putInt(z); 
    #                 end
    #                 """
    #     expect = "3"
    #     self.assertTrue(TestCodeGen.test(input,expect,528))
    # def test_for_with_dowto_stmt(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 var x,y:integer;
    #                 procedure main();
    #                 var z: integer;
    #                 begin 
    #                 z:=1;
    #                 for x := 5 downto 1 do
    #                     begin
    #                      z := z + 1;
    #                      {if (z = 3) then break;}
    #                     end
    #                 putInt(z); 
    #                 end
    #                 """
    #     expect = "6"
    #     self.assertTrue(TestCodeGen.test(input,expect,529))
    # def test_with_stmt(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 var x,y:integer;
    #                 procedure main();
    #                 var z: integer;
    #                 begin 
    #                 with a: integer; do 
    #                     begin
    #                         a := 1;
    #                         putInt(a);
    #                     end
    #                 end
    #                 """
    #     expect = "1"
    #     self.assertTrue(TestCodeGen.test(input,expect,530))
    # def test_with_override_var_stmt(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 var x,y:integer;
    #                 procedure main();
    #                 var z: integer;
    #                 begin 
    #                 z := 1;
    #                 with z: integer; do 
    #                     begin
    #                         z := 4;
    #                         putInt(z);
    #                     end
    #                 end
    #                 """
    #     expect = "4"
    #     self.assertTrue(TestCodeGen.test(input,expect,531))
    # def test_with_for_stmt(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 var x,y:integer;
    #                 procedure main();
    #                 var z: integer;
    #                 begin 
    #                 z := 1;
    #                 for x:=1 to 4 do
    #                     begin
    #                         with z: integer; do 
    #                             begin
    #                                 z := 4;
    #                                 putInt(z);
    #                             end
    #                     end
    #                 end
    #                 """
    #     expect = "4444"
    #     self.assertTrue(TestCodeGen.test(input,expect,532))
    # def test_andthen_op(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 procedure main();
    #                 begin 
    #                 putBool(true and then false);
    #                 end
    #                 """
    #     expect = "false"
    #     self.assertTrue(TestCodeGen.test(input,expect,533))
    # def test_andthen_op_2(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 procedure main();
    #                 begin 
    #                 putBool(false and then true);
    #                 end
    #                 """
    #     expect = "false"
    #     self.assertTrue(TestCodeGen.test(input,expect,534))
    # def test_andthen_op_complex(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 procedure main();
    #                 begin 
    #                 putBool(1 >= 2 and then 2 > 1);
    #                 end
    #                 """
    #     expect = "false"
    #     self.assertTrue(TestCodeGen.test(input,expect,535))
    # def test_orelse_op(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 procedure main();
    #                 begin 
    #                 putBool(1 >= 0 or else 2 > 1);
    #                 end
    #                 """
    #     expect = "true"
    #     self.assertTrue(TestCodeGen.test(input,expect,536))
    # def test_return_stmt(self):
    #     """Simple program: int main() {} """
    #     input = """
    #                 procedure foo();
    #                 begin
    #                     return 1;
    #                 end
    #                 procedure main();
    #                 var x: integer;
    #                 begin 
    #                 foo();
                
    #                 end
    #                 """
    #     expect = ""
    #     self.assertTrue(TestCodeGen.test(input,expect,537))
    def test_function_return_float(self):
        """Simple program: int main() {} """
        input = """
                    function foo():real;
                    begin
                        return 2.3 + 1.3;
                    end
                    procedure main();
                    var x: real;
                    begin 
                    {x := 2;}
                    x:= foo();
                    putFloat(x);
                    end
                    """
        expect = "3.6"
        self.assertTrue(TestCodeGen.test(input,expect,538))
    def test_function_return_float_int(self):
        """Simple program: int main() {} """
        input = """
                    function foo():real;
                    begin
                        return 1.3 + 2;
                    end
                    procedure main();
                    var x: real;
                    begin 
                    {x := 2;}
                    x:= foo();
                    putFloat(x);
                    end
                    """
        expect = "3.3"
        self.assertTrue(TestCodeGen.test(input,expect,539))
    def test_string_type(self):
        """Simple program: int main() {} """
        input = """
                    procedure main();
                    var x: string;
                    begin 
                    x := "abc";
                    putString(x);
                    end
                    """
        expect = "abc"
        self.assertTrue(TestCodeGen.test(input,expect,540))
    def test_string_return(self):
        """Simple program: int main() {} """
        input = """
                    function foo():string;
                    begin
                        return "hehe";
                    end
                    procedure main();
                    var x: string;
                    begin 
                    {x := 2;}
                    x:= foo();
                    putString(x);
                    end
                    """
        expect = "hehe"
        self.assertTrue(TestCodeGen.test(input,expect,541))
    # def test_boolean(self):
    #     """Simple program: int main() {} """
    #     input = """
    #     var x: integer;
    #     procedure main(); begin putBool(True); end"""
    #     expect = "true"
    #     self.assertTrue(TestCodeGen.test(input,expect,503))
       