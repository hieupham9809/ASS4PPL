.source MPClass.java
.class public MPClass
.super java.lang.Object

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	ldc 31400000000.0
	fneg
	fneg
	fneg
	fneg
	fneg
	fneg
	fneg
	fneg
	fneg
	fneg
	invokestatic io/putFloatLn(F)V
	iconst_0
	iconst_1
	idiv
	invokestatic io/putIntLn(I)V
	iconst_0
	ineg
	i2f
	iconst_1
	ineg
	i2f
	fdiv
	invokestatic io/putFloat(F)V
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
