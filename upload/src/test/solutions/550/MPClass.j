.source MPClass.java
.class public MPClass
.super java.lang.Object
.field static globalint I
.field static globalfloat F
.field static globalbool Z

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is localint I from Label0 to Label1
.var 2 is localfloat F from Label0 to Label1
.var 3 is localbool Z from Label0 to Label1
Label0:
	iconst_0
	istore_1
	iload_1
	putstatic MPClass.globalint I
	iconst_1
	i2f
	fstore_2
	fload_2
	putstatic MPClass.globalfloat F
	iconst_1
	ifgt Label2
	iconst_1
	goto Label3
Label2:
	iconst_0
Label3:
	ifgt Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	ifgt Label6
	iconst_1
	goto Label7
Label6:
	iconst_0
Label7:
	putstatic MPClass.globalbool Z
	getstatic MPClass.globalbool Z
	istore_3
	getstatic MPClass.globalint I
	invokestatic io/putIntLn(I)V
	iload_1
	invokestatic io/putIntLn(I)V
	getstatic MPClass.globalfloat F
	invokestatic io/putFloatLn(F)V
	fload_2
	invokestatic io/putFloatLn(F)V
	iload_3
	invokestatic io/putBoolLn(Z)V
	getstatic MPClass.globalbool Z
	invokestatic io/putBoolLn(Z)V
Label1:
	return
.limit stack 11
.limit locals 4
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
