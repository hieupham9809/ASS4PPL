.source MPClass.java
.class public MPClass
.super java.lang.Object

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	iconst_1
	ifle Label2
	iconst_0
	ifle Label2
	iconst_1
	goto Label3
Label2:
	iconst_0
Label3:
	invokestatic io/putBoolLn(Z)V
	iconst_1
	ifle Label4
	iconst_1
	ifle Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	invokestatic io/putBoolLn(Z)V
	iconst_0
	ifle Label6
	iconst_1
	ifle Label6
	iconst_1
	goto Label7
Label6:
	iconst_0
Label7:
	invokestatic io/putBoolLn(Z)V
	iconst_0
	ifle Label8
	iconst_0
	ifle Label8
	iconst_1
	goto Label9
Label8:
	iconst_0
Label9:
	invokestatic io/putBoolLn(Z)V
	iconst_0
	ifle Label12
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
	ifle Label12
	iconst_1
	goto Label13
Label12:
	iconst_0
Label13:
	invokestatic io/putBoolLn(Z)V
	return
Label1:
	return
.limit stack 27
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
