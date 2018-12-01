'''
 *   @author Nguyen Hua Phung
 *   @version 1.0
 *   23/10/2015
 *   This file provides a simple version of code generator
 *
'''
from Utils import *
from StaticCheck import *
from StaticError import *
from CodeGenError import *
from Emitter import Emitter
from Frame import Frame
from abc import ABC, abstractmethod

class CodeGenerator(Utils):
    def __init__(self):
        self.libName = "io"

    def init(self):
        return [Symbol("getInt", MType(list(), IntType()), CName(self.libName)),
                    Symbol("putInt", MType([IntType()], VoidType()), CName(self.libName)),
                    Symbol("putIntLn", MType([IntType()], VoidType()), CName(self.libName)),
                    Symbol("getFloat",MType(list(),FloatType()), CName(self.libName)),
                    Symbol("putFloat",MType([FloatType()],VoidType()),CName(self.libName)),
                    Symbol("putFloatLn",MType([FloatType()],VoidType()),CName(self.libName)),
                    Symbol("putBool",MType([BoolType()],VoidType()),CName(self.libName)),
                    Symbol("putBoolLn",MType([BoolType()],VoidType()),CName(self.libName)),
                    Symbol("putString",MType([StringType()],VoidType()),CName(self.libName)),
                    Symbol("putStringLn",MType([StringType()],VoidType()),CName(self.libName)),
                    Symbol("putLn",MType(list(),VoidType()),CName(self.libName))
                    
                    ]
        # return [Symbol("getint", MType(list(), IntType()), CName(self.libName)),
        #             Symbol("putint", MType([IntType()], VoidType()), CName(self.libName)),
        #             Symbol("putintln", MType([IntType()], VoidType()), CName(self.libName)),
        #             Symbol("getfloat",MType(list(),FloatType()), CName(self.libName)),
        #             Symbol("putfloat",MType([FloatType()],VoidType()),CName(self.libName)),
        #             Symbol("putfloatln",MType([FloatType()],VoidType()),CName(self.libName)),
        #             Symbol("putbool",MType([BoolType()],VoidType()),CName(self.libName)),
        #             Symbol("putboolln",MType([BoolType()],VoidType()),CName(self.libName)),
        #             Symbol("putstring",MType([StringType()],VoidType()),CName(self.libName)),
        #             Symbol("putstringln",MType([StringType()],VoidType()),CName(self.libName)),
        #             Symbol("putln",MType(list(),VoidType()),CName(self.libName))
                    
        #             ]
    def gen(self, ast, dir_):
        #ast: AST
        #dir_: String

        gl = self.init()
        gc = CodeGenVisitor(ast, gl, dir_)
        gc.visit(ast, None)

# class StringType(Type):
    
#     def __str__(self):
#         return "StringType"

#     def accept(self, v, param):
#         return None

class ArrayPointerType(Type):
    def __init__(self, ctype):
        #cname: String
        self.eleType = ctype

    def __str__(self):
        return "ArrayPointerType({0})".format(str(self.eleType))

    def accept(self, v, param):
        return None
class ClassType(Type):
    def __init__(self,cname):
        self.cname = cname
    def __str__(self):
        return "Class({0})".format(str(self.cname))
    def accept(self, v, param):
        return None
        
class SubBody():
    def __init__(self, frame, sym, isGlobal=False):
        #frame: Frame
        #sym: List[Symbol]

        self.frame = frame
        self.sym = sym
        self.isGlobal = isGlobal

class Access():
    def __init__(self, frame, sym, isLeft, isFirst):
        #frame: Frame
        #sym: List[Symbol]
        #isLeft: Boolean
        #isFirst: Boolean

        self.frame = frame
        self.sym = sym
        self.isLeft = isLeft
        self.isFirst = isFirst

class Val(ABC):
    pass

class Index(Val):
    def __init__(self, value):
        #value: Int

        self.value = value

class CName(Val):
    def __init__(self, value):
        #value: String

        self.value = value

class CodeGenVisitor(BaseVisitor, Utils):
    def __init__(self, astTree, env, dir_):
        #astTree: AST
        #env: List[Symbol]
        #dir_: File

        self.astTree = astTree
        self.env = env
        self.className = "MPClass"
        self.path = dir_
        self.emit = Emitter(self.path + "/" + self.className + ".j")

    def visitProgram(self, ast, c):
        #ast: Program
        #c: Any
        stDecl = self.env
        self.emit.printout(self.emit.emitPROLOG(self.className, "java.lang.Object"))
        # e = SubBody(None, self.env)
        # for x in ast.decl:
        #     e = self.visit(x, e)
        for x in ast.decl:
            if type(x) is FuncDecl:
                paramTypeList = [y.varType for y in x.param]
                stDecl = [Symbol(x.name.name.lower(),MType(paramTypeList,x.returnType),CName(self.className))] + stDecl
            else:
                

                newSym = self.visit(x,SubBody(Frame("<clinit>",x.varType),list(),isGlobal=True))
                stDecl = [newSym] + stDecl
        e = SubBody(None, stDecl)
        [self.visit(x, e) for x in ast.decl if type(x) is FuncDecl]
        # generate default constructor
        self.genMETHOD(FuncDecl(Id("<init>"), list(), list(), list(),None), c, Frame("<init>", VoidType))
        self.emit.emitEPILOG()
        return c

    def genMETHOD(self, consdecl, o, frame):
        #consdecl: FuncDecl
        #o: Any
        #frame: Frame

        isInit = consdecl.returnType is None
        isMain = consdecl.name.name.lower() == "main" and len(consdecl.param) == 0 and type(consdecl.returnType) is VoidType
        returnType = VoidType() if isInit else consdecl.returnType
        methodName = "<init>" if isInit else consdecl.name.name.lower()
        intype = [ArrayPointerType(StringType())] if isMain else [x.varType for x in consdecl.param]
        mtype = MType(intype, returnType)

        self.emit.printout(self.emit.emitMETHOD(methodName.lower(), mtype, not isInit, frame))

        frame.enterScope(True)

        glenv = o

        # Generate code for parameter declarations
        # frameInit = Frame("<clinit>",VoidType)
        # self.emit.printout(self.emit.emitMETHOD("<clinit>", MType(list(),VoidType()), False, frameInit))
        # frameInit.enterScope(True)
        # self.emit.printout(self.emit.emitVAR(frameInit.getNewIndex(), "this", ClassType(self.className), frameInit.getStartLabel(), frameInit.getEndLabel(), frameInit))
        # self.emit.printout(self.emit.emitLABEL(frameInit.getStartLabel(), frameInit))
        # self.emit.printout(self.emit.emitREADVAR("this", ClassType(self.className), 0, frameInit))
        # self.emit.printout(self.emit.emitINVOKESPECIAL(frameInit))
        
        # self.emit.printout(self.emit.emitREADVAR("this",ClassType(self.className), 0, frameInit))
        # self.emit.printout(self.emit.emitPUSHICONST(arraySize,frame))
        # self.emit.printout(self.emit.jvm.emitNEWARRAY(self.emit.getFullType(eleType)))
        # self.emit.printout(self.emit.emitPUTSTATIC(self.className + "." + o[1],ast,frame))
        
        
        # self.emit.printout(self.emit.emitLABEL(frameInit.getEndLabel(), frameInit))
        # self.emit.printout(self.emit.emitRETURN(VoidType(), frameInit))
        # self.emit.printout(self.emit.emitENDMETHOD(frameInit))
        # frameInit.exitScope()

        if isInit:
            self.emit.printout(self.emit.emitVAR(frame.getNewIndex(), "this", ClassType(self.className), frame.getStartLabel(), frame.getEndLabel(), frame))
        if isMain:
            self.emit.printout(self.emit.emitVAR(frame.getNewIndex(), "args", ArrayPointerType(StringType()), frame.getStartLabel(), frame.getEndLabel(), frame))

        local_sub = SubBody(frame,glenv)
        for x in consdecl.param + consdecl.local:
            local_sub = self.visit(x,local_sub)

        body = consdecl.body
        self.emit.printout(self.emit.emitLABEL(frame.getStartLabel(), frame))
        
        # Generate code for statements
        if isInit:
            self.emit.printout(self.emit.emitREADVAR("this", ClassType(self.className), 0, frame))
            self.emit.printout(self.emit.emitINVOKESPECIAL(frame))
        list(map(lambda x: self.visit(x, SubBody(frame, local_sub.sym)), body))

        self.emit.printout(self.emit.emitLABEL(frame.getEndLabel(), frame))
        if type(returnType) is VoidType:
            self.emit.printout(self.emit.emitRETURN(VoidType(), frame))
        self.emit.printout(self.emit.emitENDMETHOD(frame))
        frame.exitScope();
######################### DECLARATION ############################
    def visitFuncDecl(self, ast, o):
        #ast: FuncDecl
        #o: Any

        subctxt = o
        frame = Frame(ast.name, ast.returnType)
        self.genMETHOD(ast, subctxt.sym, frame)
        return SubBody(None, [Symbol(ast.name, MType(list(), ast.returnType), CName(self.className))] + subctxt.sym)

    def visitVarDecl(self, ast, o):
        varName = ast.variable.name.lower()
        varType = ast.varType
        frame = o.frame
        subctxt = o

        if o.isGlobal:
            self.emit.printout(self.emit.emitATTRIBUTE(varName,varType,False,""))
            if type(varType) == ArrayType:
                self.visit(varType,(subctxt,varName))
            return Symbol(varName, varType)
        else:
            index = frame.getNewIndex()
            self.emit.printout(self.emit.emitVAR(index,varName,varType,frame.getStartLabel(),frame.getEndLabel(),frame))
            return SubBody(frame,[Symbol(varName,varType,Index(index))] + subctxt.sym)


################ EXPRESSION ##########################
    
    def visitBinaryOp(self, ast, o):
        leftOpr = ast.left
        rightOpr = ast.right
        op = ast.op.lower()
        accessCtxt = o
        frame = accessCtxt.frame
        leftCode, leftType = self.visit(leftOpr, accessCtxt)
        rightCode, rightType = self.visit(rightOpr, accessCtxt)
        mtype = leftType
        if type(leftType) == type(rightType):
            if type(leftType) == IntType:
                if op == '/':
                    mtype = FloatType() 
                    leftCode = leftCode + self.emit.emitI2F(frame)
                    rightCode = rightCode + self.emit.emitI2F(frame)
        else:
            mtype = FloatType()
            if type(leftType) == IntType:
                leftCode = leftCode + self.emit.emitI2F(frame)
            else: 
                rightCode = rightCode + self.emit.emitI2F(frame)
        
        if op in ['+','-']:
            return leftCode + rightCode + self.emit.emitADDOP(op,mtype,frame), mtype
        if op in ['*','/']:
            return leftCode + rightCode + self.emit.emitMULOP(op,mtype,frame), mtype
        if op == 'div':
            return leftCode + rightCode + self.emit.emitDIV(frame), mtype
        if op == 'mod':
            return leftCode + rightCode + self.emit.emitMOD(frame), mtype
        if op in ['=','>','<','>=','<=','<>']:
            return leftCode + rightCode + self.emit.emitREOP(op,mtype,frame), BoolType()
        if op == 'or': return leftCode + rightCode + self.emit.emitOROP(frame), BoolType()
        if op == 'and': return leftCode + rightCode + self.emit.emitANDOP(frame), BoolType()
        if op == 'orelse': return self.emit.emitORELSE(frame, leftCode, rightCode), BoolType()
        if op == 'andthen': return self.emit.emitANDTHEN(frame, leftCode, rightCode), BoolType()

    def visitUnaryOp(self, ast, o):
        op = ast.op.lower()
        accessCtxt = o
        frame = accessCtxt.frame
        operandCode, operandType = self.visit(ast.body,accessCtxt)

        if op == 'not':
            return operandCode + self.emit.emitNOT(operandType,frame), operandType
        else:
            return operandCode + self.emit.emitNEGOP(operandType,frame), operandType

    # def visitId(self,ast,o):
    #     accessCtxt = o
    #     frame = accessCtxt.frame
    #     symList = accessCtxt.sym
    #     isLeft = accessCtxt.isLeft
    #     isFirst = accessCtxt.isFirst

    #     sym = self.lookup(ast.name.lower(),symList, lambda x: x.name.lower())
    #     if isLeft:
    #         return sym.name, sym.mtype, sym.value
    #     if sym.value is None: #global var
    #         return self.emit.emitGETSTATIC(self.className + "." + sym.name,sym.mtype, frame), sym.mtype
    #     return self.emit.emitREADVAR(sym.name, sym.mtype, sym.value.value, frame), sym.mtype
        


    def visitIntLiteral(self, ast, o):
        #ast: IntLiteral
        #o: Any

        ctxt = o
        frame = ctxt.frame
        return self.emit.emitPUSHICONST(ast.value, frame), IntType()
    def visitFloatLiteral(self,ast,o):
        #ast: FloatLiteral
        #o: Any

        ctxt = o
        frame = ctxt.frame
        return self.emit.emitPUSHFCONST(ast.value,frame), FloatType()


    def visitBooleanLiteral(self,ast,o):
        ctxt = o
        frame = ctxt.frame
        return self.emit.emitPUSHICONST(str(ast.value).lower(), frame), BoolType()
    
    def visitStringLiteral(self,ast,o):
        ctxt = o
        frame = ctxt.frame
        return self.emit.emitPUSHCONST(ast.value,StringType(),frame), StringType()
        
    
############## STATEMENT #######################
    def visitCallStmt(self, ast, o):
        #ast: CallStmt
        #o: Any

        ctxt = o
        frame = ctxt.frame
        nenv = ctxt.sym
       
        sym = self.lookup(ast.method.name.lower(), nenv, lambda x: x.name.lower())
        cname = sym.value.value
    
        ctype = sym.mtype

        in_ = ("", [])
        for x in ast.param:
            str1, typ1 = self.visit(x, Access(frame, nenv, False, False))
            in_ = (in_[0] + str1, in_[1]+[typ1])
        self.emit.printout(in_[0])
        #self.emit.printout(self.emit.emitINVOKESTATIC(cname + "/" + ast.method.name.lower(), ctype, frame))
        self.emit.printout(self.emit.emitINVOKESTATIC(cname + "/" + sym.name, ctype, frame))

    # def visitAssign(self,ast,o):
    #     subBodyCtxt = o
    #     frame = subBodyCtxt.frame
    #     sym = subBodyCtxt.sym 
    #     writevar = ""
    #     putstatic = ""

    #     result = list()
    #     lhsName, lhsType, lhsValue = self.visit(ast.lhs,Access(frame, sym, True, True))
    #     rhsCode, rhsType = self.visit(ast.exp,Access(frame, sym, False, True))
    #     if (type(rhsType), type(lhsType)) == (IntType,FloatType):
    #         rhsCode = rhsCode + self.emit.emitI2F(frame)
    #     self.emit.printout(rhsCode)
    #     result.append(rhsCode)

    #     if lhsValue:
    #         writevar = self.emit.emitWRITEVAR(lhsName,lhsType,lhsValue.value,frame)
    #         result.append(writevar)
    #         self.emit.printout(writevar)
    #     else:
    #         result.append(putstatic)
    #         putstatic = self.emit.emitPUTSTATIC(self.className + "." + lhsName,lhsType,frame)
    #         self.emit.printout(putstatic)
    #     return ''.join(result)


    def visitIf(self,ast,o):
        subBodyCtxt = o
        frame = subBodyCtxt.frame 
        sym = subBodyCtxt.sym

        expr = ast.expr
        label1 = frame.getNewLabel()
        label2 = frame.getNewLabel()

        
        self.emit.printout(self.visit(expr,Access(frame,sym,False,True))[0])
        #self.emit.printout(self.emit.emitLABEL(label1,frame))
        #self.emit.printout(self.emit.emitLABEL(label2,frame))
        self.emit.printout(self.emit.emitIFFALSE(label1,frame))

        [self.visit(stmt,subBodyCtxt) for stmt in ast.thenStmt]
        self.emit.printout(self.emit.emitGOTO(label2,frame))
        self.emit.printout(self.emit.emitLABEL(label1,frame))
        [self.visit(stmt,subBodyCtxt) for stmt in ast.elseStmt]
        self.emit.printout(self.emit.emitLABEL(label2,frame))

    def visitWhile(self,ast,o):
        subBodyCtxt = o
        frame = subBodyCtxt.frame 
        sym = subBodyCtxt.sym
        expr = ast.exp

        frame.enterLoop()
        continueLabel = frame.getContinueLabel()
        breakLabel = frame.getBreakLabel()
        self.emit.printout(self.emit.emitLABEL(continueLabel,frame))
        self.emit.printout(self.visit(expr,Access(frame,sym,False,True))[0])
        self.emit.printout(self.emit.emitIFFALSE(breakLabel,frame))
        [self.visit(stmt,subBodyCtxt) for stmt in ast.sl]
        self.emit.printout(self.emit.emitGOTO(continueLabel,frame))
        self.emit.printout(self.emit.emitLABEL(breakLabel,frame))

    def visitFor(self,ast,o):
        subBodyCtxt = o
        frame = subBodyCtxt.frame 
        sym = subBodyCtxt.sym
        
        idCode = self.visit(ast.id,Access(frame,sym,False,True))
        frame.enterLoop()
        continueLabel = frame.getContinueLabel()
        breakLabel = frame.getBreakLabel()
        
        assignAST = Assign(ast.id,ast.expr1)
        assignIncrAST = Assign(ast.id,BinaryOp('+',ast.id,IntLiteral(1)))
        assignDecrAST = Assign(ast.id,BinaryOp('-',ast.id,IntLiteral(1)))
        toExprAST = BinaryOp('<=',ast.id,ast.expr2)
        downtoExprAST = BinaryOp('>=',ast.id,ast.expr2)
        
        self.visit(assignAST,subBodyCtxt)
        self.emit.printout(self.emit.emitLABEL(continueLabel,frame))
        if ast.up:
            self.emit.printout(self.visit(toExprAST,Access(frame,sym,False,True))[0])
        else:
            self.emit.printout(self.visit(downtoExprAST,Access(frame,sym,False,True))[0])
        self.emit.printout(self.emit.emitIFFALSE(breakLabel,frame))
        [self.visit(stmt,subBodyCtxt) for stmt in ast.loop]
        if ast.up:
            self.visit(assignIncrAST,subBodyCtxt)
        else: 
            self.visit(assignDecrAST,subBodyCtxt)
        self.emit.printout(self.emit.emitGOTO(continueLabel,frame))
        self.emit.printout(self.emit.emitLABEL(breakLabel,frame))
        #compare id vs expr2



    def visitBreak(self,ast,o):
        subBodyCtxt = o
        frame = subBodyCtxt.frame

        breakLabel = frame.getBreakLabel()
        self.emit.printout(self.emit.emitGOTO(breakLabel,frame))

    def visitContinue(self,ast,o):
        subBodyCtxt = o
        frame = subBodyCtxt.frame

        continueLabel = frame.getContinueLabel()
        self.emit.printout(self.emit.emitGOTO(continueLabel,frame))

    def visitWith(self,ast,o):
        subBodyCtxt = SubBody(o.frame,o.sym,isGlobal=False)
        
        for vardecl in ast.decl: ####### update symbol list
            subBodyCtxt = self.visit(vardecl,subBodyCtxt)

        [self.visit(stmt,subBodyCtxt) for stmt in ast.stmt]

    def visitReturn(self,ast,o):
        subBodyCtxt = o
        frame = subBodyCtxt.frame
        sym = subBodyCtxt.sym
        expr = None
        if ast.expr:
            expr = self.visit(ast.expr,Access(frame,sym,False,True))
            self.emit.printout(expr[0])
            self.emit.printout(self.emit.emitRETURN(expr[1],frame))
        else:
            self.emit.printout(self.emit.emitRETURN(VoidType(),frame))
    def visitCallExpr(self,ast,o):
        #ast: CallStmt
        #o: Any
        result = list()
        ctxt = o
        frame = ctxt.frame
        nenv = ctxt.sym
        sym = self.lookup(ast.method.name.lower(), nenv, lambda x: x.name)
        cname = sym.value.value
    
        ctype = sym.mtype

        in_ = ("", [])
        for x in ast.param:
            str1, typ1 = self.visit(x, Access(frame, nenv, False, True))
            in_ = (in_[0] + str1, in_[1]+[typ1])
            
        result.append(in_[0])
        #result.append(self.emit.emitINVOKESTATIC(cname + "/" + ast.method.name.lower(), ctype, frame))
        result.append(self.emit.emitINVOKESTATIC(cname + "/" + sym.name, ctype, frame))        
        return ''.join(result),ctype.rettype


    def visitArrayType(self,ast,o):
        lower = ast.lower
        upper = ast.upper
        arraySize = upper - lower + 1
        eleType = ast.eleType
        frame = o[0].frame
        #label1 = frame.getNewLabel()
        #label2 = frame.getNewLabel()

        #if type(x.varType) == ArrayType:
        frameInit = Frame("<clinit>",VoidType)
        self.emit.printout(self.emit.emitMETHOD("<clinit>", MType(list(),VoidType()), False, frameInit))
        
        #frameInit.enterScope(True)
        #self.emit.printout(self.emit.emitVAR(frameInit.getNewIndex(), "this", ClassType(self.className), frameInit.getStartLabel(), frameInit.getEndLabel(), frameInit))
        #self.emit.printout(self.emit.emitLABEL(frameInit.getStartLabel(), frameInit))
        #self.emit.printout(self.emit.emitREADVAR("this", ClassType(self.className), 0, frameInit))
        #self.emit.printout(self.emit.emitINVOKESPECIAL(frameInit))
        
        #self.emit.printout(self.emit.emitREADVAR("this",ClassType(self.className), 0, frameInit))
        self.emit.printout(self.emit.emitPUSHICONST(arraySize,frameInit))
        self.emit.printout(self.emit.jvm.emitNEWARRAY(self.emit.getFullType(eleType)))
        self.emit.printout(self.emit.emitPUTSTATIC(self.className + "." + o[1],ast,frameInit))
        
        
        #self.emit.printout(self.emit.emitLABEL(frameInit.getEndLabel(), frameInit))
        self.emit.printout(self.emit.emitRETURN(VoidType(), frameInit))
        self.emit.printout(self.emit.emitENDMETHOD(frameInit))
        #frameInit.exitScope();

        
        #self.emit.printout(self.emit.emitLABEL(label1,frame))
        
        #self.emit.printout(self.emit.emitLABEL(label2,frame))
    def visitId(self,ast,o):
        accessCtxt = o
        frame = accessCtxt.frame
        symList = accessCtxt.sym
        isLeft = accessCtxt.isLeft
        isFirst = accessCtxt.isFirst

        sym = self.lookup(ast.name.lower(),symList, lambda x: x.name)
        if isLeft:
            return sym.name.lower(), sym.mtype, sym.value
        if sym.value is None: #global var
            return self.emit.emitGETSTATIC(self.className + "." + sym.name.lower(),sym.mtype, frame), sym.mtype
        return self.emit.emitREADVAR(sym.name.lower(), sym.mtype, sym.value.value, frame), sym.mtype
    def visitAssign(self,ast,o):
        subBodyCtxt = o
        frame = subBodyCtxt.frame
        sym = subBodyCtxt.sym 
        writevar = ""
        putstatic = ""

        result = list()
        
        lhsName, lhsType, lhsValue = self.visit(ast.lhs,Access(frame, sym, True, True))
        if type(lhsType) == ArrayType:
            lhsCode,temp = self.visit(ast.lhs,Access(frame,sym,True,False))
            self.emit.printout(lhsCode)
        rhsCode, rhsType = self.visit(ast.exp,Access(frame, sym, False, False))
        if (type(rhsType), type(lhsType)) == (IntType,FloatType):
            rhsCode = rhsCode + self.emit.emitI2F(frame)
        self.emit.printout(rhsCode)
        result.append(rhsCode)

        if lhsValue:
            writevar = ""
            if type(lhsType) == ArrayType:
                writevar = self.emit.emitWRITEVAR2(lhsName,lhsType.eleType,frame)
            else: writevar = self.emit.emitWRITEVAR(lhsName,lhsType,lhsValue.value,frame)

            result.append(writevar)
            self.emit.printout(writevar)
        else:
            result.append(putstatic)
            putstatic = ""
            if type(lhsType) == ArrayType:
                putstatic = self.emit.emitWRITEVAR2(lhsName,lhsType.eleType,frame)
            else:   putstatic = self.emit.emitPUTSTATIC(self.className + "." + lhsName,lhsType,frame)
            
            self.emit.printout(putstatic)
        
        return ''.join(result)
    def visitArrayCell(self,ast,o):
        accessCtxt = o
        frame = accessCtxt.frame
        sym = accessCtxt.sym
        lhsName, lhsType, lhsValue = self.visit(ast.arr,Access(frame,sym,True,True))
        #arraySym = self.lookup()
        if not accessCtxt.isLeft:
            result = list()
            
            if lhsValue is None: #global var
                result.append(self.emit.emitGETSTATIC(self.className + "." + lhsName,lhsType, frame))
            else: result.append(self.emit.emitREADVAR(lhsName, lhsType, lhsValue.value, frame))
            indexCode, indexType = self.visit(ast.idx,Access(frame,sym,False,False))
            result.append(indexCode)
            result.append(self.emit.emitALOAD(lhsType.eleType,frame))
            return ''.join(result), lhsType.eleType

        if accessCtxt.isFirst:
            return lhsName.lower(),lhsType,lhsValue
        else: 
            arrCode, arrType = self.visit(ast.arr,Access(frame,sym,False,True))
            indexCode, indexType = self.visit(ast.idx,Access(frame,sym,False,False))
            return arrCode+indexCode,arrType
        


