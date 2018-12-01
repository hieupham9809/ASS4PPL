.source MPClass.java
.class public MPClass
.super java.lang.Object
.field static globalint I
.field static globalfloat F
.field static globalbool Z
.field static globalarray [F

.method public <clinit>()V
	iconst_5
	newarray float
	putstatic MPClass.globalarray [F
	return
.limit stack 1
.limit locals 0
.end method

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is localint I from Label0 to Label1
.var 2 is localfloat F from Label0 to Label1
.var 3 is localbool Z from Label0 to Label1
.var 4 is localarray [F from Label0 to Label1
Label0:
	iconst_1
	ineg
	iconst_2
	ineg
	imul
	iconst_1
	iadd
	iconst_3
	rem
	putstatic MPClass.globalint I
	getstatic MPClass.globalint I
	i2f
	fstore_2
	aload 4
	iconst_2
	fload_2
	fastore
	getstatic MPClass.globalarray [F
	iconst_1
	aload 4
	iconst_2
	faload
	fastore
	getstatic MPClass.globalarray [F
	iconst_1
	faload
	invokestatic io/putFloatLn(F)V
	aload 4
	iconst_2
	faload
	invokestatic io/putFloatLn(F)V
	fload_2
	invokestatic io/putFloatLn(F)V
	getstatic MPClass.globalint I
	invokestatic io/putIntLn(I)V
Label1:
	return
.limit stack 8
.limit locals 5
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
