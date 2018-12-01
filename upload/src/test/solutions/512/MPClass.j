.source MPClass.java
.class public MPClass
.super java.lang.Object

.method public static hello([Ljava/lang/String;)V
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
Label1:
	return
.limit stack 9
.limit locals 2
.end method

.method public static goodbye([Ljava/lang/String;)V
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
	ldc "GOODBYE"
	aastore
	iload_1
	iconst_1
	iadd
	istore_1
	goto Label2
Label3:
Label1:
	return
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
.var 1 is arr [Ljava/lang/String; from Label0 to Label1
.var 2 is i I from Label0 to Label1
Label0:
	iconst_2
	ineg
	istore_2
Label2:
	iload_2
	iconst_2
	if_icmpgt Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	ifle Label3
	aload_1
	iload_2
	ldc "HI"
	aastore
	iload_2
	iconst_1
	iadd
	istore_2
	goto Label2
Label3:
	aload_1
	invokestatic MPClass/hello([Ljava/lang/String;)V
	aload_1
	invokestatic MPClass/printarray([Ljava/lang/String;)V
	aload_1
	invokestatic MPClass/goodbye([Ljava/lang/String;)V
	aload_1
	invokestatic MPClass/printarray([Ljava/lang/String;)V
Label1:
	return
.limit stack 9
.limit locals 3
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
