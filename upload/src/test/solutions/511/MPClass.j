.source MPClass.java
.class public MPClass
.super java.lang.Object

.method public static foo()[Ljava/lang/String;
.var 0 is x [Ljava/lang/String; from Label0 to Label1
.var 1 is i I from Label0 to Label1
Label0:
	iconst_2
	ineg
	istore_1
Label2:
	iload_1
	iconst_2
	if_icmpgt Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	ifle Label3
	aload_0
	iload_1
	ldc "HELLO"
	aastore
	iload_1
	iconst_1
	iadd
	istore_1
	goto Label2
Label3:
	aload_0
	areturn
Label1:
.limit stack 9
.limit locals 2
.end method

.method public static printarray([Ljava/lang/String;)V
.var 0 is a [Ljava/lang/String; from Label0 to Label1
.var 1 is i I from Label0 to Label1
Label0:
	iconst_2
	ineg
	istore_1
Label2:
	iload_1
	iconst_2
	if_icmpgt Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	ifle Label3
	aload_0
	iload_1
	aaload
	invokestatic io/putStringLn(Ljava/lang/String;)V
	iload_1
	iconst_1
	iadd
	istore_1
	goto Label2
Label3:
Label1:
	return
.limit stack 6
.limit locals 2
.end method

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	invokestatic MPClass/foo()[Ljava/lang/String;
	invokestatic MPClass/printarray([Ljava/lang/String;)V
Label1:
	return
.limit stack 1
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
