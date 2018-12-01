.source MPClass.java
.class public MPClass
.super java.lang.Object

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is i I from Label0 to Label1
Label0:
Label2:
	iconst_1
	ifle Label3
Label4:
	iconst_1
	ifle Label5
Label6:
	iconst_0
	ifgt Label8
	iconst_1
	goto Label9
Label8:
	iconst_0
Label9:
	ifle Label7
	goto Label7
	goto Label6
Label7:
	goto Label7
	goto Label4
Label5:
	goto Label7
	goto Label2
Label3:
	sipush 10000
	ineg
	istore_1
Label10:
	iload_1
	sipush 10000
	if_icmpgt Label12
	iconst_1
	goto Label13
Label12:
	iconst_0
Label13:
	ifle Label11
	iload_1
	iload_1
	imul
	bipush 9
	if_icmple Label16
	iconst_1
	goto Label17
Label16:
	iconst_0
Label17:
	ifle Label14
	goto Label10
	goto Label15
Label14:
Label15:
	iload_1
	invokestatic io/putIntLn(I)V
	iload_1
	iconst_1
	iadd
	istore_1
	goto Label10
Label11:
Label1:
	return
.limit stack 15
.limit locals 2
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
