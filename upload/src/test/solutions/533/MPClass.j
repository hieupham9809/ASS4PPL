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
	iconst_1
	putstatic MPClass.x I
Label2:
	getstatic MPClass.x I
	iconst_4
	if_icmpgt Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	ifle Label3
.var 2 is z I from Label0 to Label1
	iconst_4
	istore_2
	iload_2
	invokestatic io/putIntLn(I)V
	getstatic MPClass.x I
	iconst_1
	iadd
	putstatic MPClass.x I
	goto Label2
Label3:
Label1:
	return
.limit stack 5
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
