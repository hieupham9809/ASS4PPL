.source MPClass.java
.class public MPClass
.super java.lang.Object

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	invokestatic MPClass/t()Z
	invokestatic io/putBoolLn(Z)V
	invokestatic MPClass/f()Z
	invokestatic io/putBoolLn(Z)V
	invokestatic MPClass/t()Z
	ifle Label2
	invokestatic MPClass/foo()Z
	ifle Label2
	iconst_1
	goto Label3
Label2:
	iconst_0
Label3:
	invokestatic io/putBoolLn(Z)V
	invokestatic MPClass/f()Z
	ifle Label4
	invokestatic MPClass/foo()Z
	ifle Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	invokestatic io/putBoolLn(Z)V
Label1:
	return
.limit stack 7
.limit locals 1
.end method

.method public static t()Z
Label0:
	iconst_1
	ireturn
Label1:
.limit stack 2
.limit locals 0
.end method

.method public static f()Z
Label0:
	iconst_0
	ireturn
Label1:
.limit stack 2
.limit locals 0
.end method

.method public static foo()Z
Label0:
	ldc "FOO!"
	invokestatic io/putString(Ljava/lang/String;)V
	iconst_0
	ireturn
Label1:
.limit stack 2
.limit locals 0
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
