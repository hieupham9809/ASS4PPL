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
	putstatic MPClass.x I
Label2:
	getstatic MPClass.x I
	iconst_4
	if_icmpge Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	ifle Label3
	getstatic MPClass.x I
	iconst_1
	iadd
	putstatic MPClass.x I
	getstatic MPClass.x I
	iconst_2
	if_icmpne Label8
	iconst_1
	goto Label9
Label8:
	iconst_0
Label9:
	ifle Label6
	goto Label2
	goto Label7
Label6:
	goto Label3
Label7:
	goto Label2
Label3:
	getstatic MPClass.x I
	invokestatic io/putInt(I)V
Label1:
	return
.limit stack 5
.limit locals 2
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
