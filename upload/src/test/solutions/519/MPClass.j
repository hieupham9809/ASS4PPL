.source MPClass.java
.class public MPClass
.super java.lang.Object

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	iconst_1
	i2f
	iconst_1
	i2f
	fdiv
	invokestatic io/putFloatLn(F)V
	ldc 1.0
	iconst_1
	i2f
	fdiv
	invokestatic io/putFloatLn(F)V
	iconst_1
	i2f
	ldc 1.0
	fdiv
	invokestatic io/putFloatLn(F)V
	ldc 1.0
	ldc 1.0
	fdiv
	invokestatic io/putFloatLn(F)V
	ldc 1.0
	ldc 1.0
	fdiv
	iconst_1
	i2f
	iconst_1
	i2f
	fdiv
	fsub
	invokestatic io/putFloat(F)V
Label1:
	return
.limit stack 3
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
