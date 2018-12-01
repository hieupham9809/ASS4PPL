.source MPClass.java
.class public MPClass
.super java.lang.Object

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	iconst_2
	ineg
	i2f
	iconst_5
	i2f
	fdiv
	invokestatic io/putFloatLn(F)V
	bipush 27
	bipush 8
	rem
	invokestatic io/putIntLn(I)V
	bipush 27
	iconst_3
	ineg
	idiv
	invokestatic io/putIntLn(I)V
	bipush 28
	ineg
	iconst_3
	ineg
	idiv
	invokestatic io/putInt(I)V
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
