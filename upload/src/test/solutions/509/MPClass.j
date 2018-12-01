.source MPClass.java
.class public MPClass
.super java.lang.Object

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	iconst_0
	ifgt Label2
	iconst_0
	ifgt Label2
	iconst_0
	goto Label3
Label2:
	iconst_1
Label3:
	invokestatic io/putBoolLn(Z)V
	iconst_0
	ifgt Label4
	iconst_1
	ifgt Label4
	iconst_0
	goto Label5
Label4:
	iconst_1
Label5:
	invokestatic io/putBoolLn(Z)V
	iconst_1
	ifgt Label6
	iconst_1
	ifgt Label6
	iconst_0
	goto Label7
Label6:
	iconst_1
Label7:
	invokestatic io/putBoolLn(Z)V
	iconst_1
	ifgt Label8
	iconst_0
	ifgt Label8
	iconst_0
	goto Label9
Label8:
	iconst_1
Label9:
	invokestatic io/putBoolLn(Z)V
	iconst_1
	ifgt Label12
	iconst_0
	iconst_0
	idiv
	iconst_0
	if_icmpne Label10
	iconst_1
	goto Label11
Label10:
	iconst_0
Label11:
	ifgt Label12
	iconst_0
	goto Label13
Label12:
	iconst_1
Label13:
	invokestatic io/putBoolLn(Z)V
	return
Label1:
	return
.limit stack 28
.limit locals 1
.end method

.method public <init>()V
.var 0 is this LMPClass; from Label0 to Label1
Label0:
	aload_0
	invokespecial java/lang/Object/<init>()V
Label1:
	return
.limit stack 1
.limit locals 1
.end method
