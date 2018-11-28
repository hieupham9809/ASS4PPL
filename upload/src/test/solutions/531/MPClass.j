.source MPClass.java
.class public MPClass
.super java.lang.Object
.field static x I
.field static y I

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is z I from Label0 to Label1
Label0:
	iconst_1
	istore_1
.var 2 is z I from Label0 to Label1
	iconst_4
	istore_2
	iload_2
	invokestatic io/putInt(I)V
Label1:
	return
.limit stack 1
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
