.source MPClass.java
.class public MPClass
.super java.lang.Object

.method public static foo(I)V
.var 0 is i I from Label0 to Label1
Label0:
	iload_0
	iconst_0
	if_icmplt Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	ifle Label2
	ldc "POSITIVE"
	invokestatic io/putStringLn(Ljava/lang/String;)V
	goto Label3
Label2:
	ldc "NEGATIVE"
	invokestatic io/putStringLn(Ljava/lang/String;)V
Label3:
Label1:
	return
.limit stack 4
.limit locals 1
.end method

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	bipush 100
	invokestatic MPClass/foo(I)V
	iconst_0
	invokestatic MPClass/foo(I)V
	iconst_1
	ineg
	invokestatic MPClass/foo(I)V
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
