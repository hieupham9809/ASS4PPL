.source MPClass.java
.class public MPClass
.super java.lang.Object

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a F from Label0 to Label1
.var 2 is b F from Label0 to Label1
Label0:
	bipush 100
	i2f
	fstore_1
	bipush 100
	ineg
	i2f
	fstore_2
Label2:
	fload_1
	fload_2
	if_icmpeq Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	ifle Label3
	iconst_1
	ineg
	i2f
	fload_1
	fadd
	fstore_1
	iconst_1
	i2f
	fload_2
	fadd
	fstore_2
	goto Label2
Label3:
	fload_1
	fload_2
	fsub
	invokestatic io/putFloat(F)V
Label1:
	return
.limit stack 4
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
