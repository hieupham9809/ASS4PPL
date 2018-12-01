.source MPClass.java
.class public MPClass
.super java.lang.Object
.field static intmax I
.field static intmin I

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	ldc 2147483647
	putstatic MPClass.intmax I
	getstatic MPClass.intmax I
	iconst_1
	ineg
	imul
	iconst_1
	isub
	putstatic MPClass.intmin I
	getstatic MPClass.intmax I
	invokestatic io/putIntLn(I)V
	getstatic MPClass.intmin I
	invokestatic io/putIntLn(I)V
	getstatic MPClass.intmax I
	getstatic MPClass.intmin I
	iadd
	invokestatic io/putIntLn(I)V
Label1:
	return
.limit stack 2
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
