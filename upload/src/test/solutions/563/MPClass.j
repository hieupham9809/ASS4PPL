.source MPClass.java
.class public MPClass
.super java.lang.Object

.method public static ispositive(I)Z
.var 0 is i I from Label0 to Label1
Label0:
	iload_0
	iconst_0
	if_icmplt Label2
	iconst_1
	goto Label3
Label2:
	iconst_0
Label3:
	ireturn
Label1:
.limit stack 4
.limit locals 1
.end method

.method public static getmaxint()I
.var 0 is i I from Label0 to Label1
Label0:
	iconst_0
	istore_0
Label2:
	iload_0
	invokestatic MPClass/ispositive(I)Z
	iload_0
	iconst_1
	iadd
	invokestatic MPClass/ispositive(I)Z
	iand
	ifle Label3
	iload_0
	iconst_1
	iadd
	istore_0
	goto Label2
Label3:
	iload_0
	ireturn
Label1:
.limit stack 3
.limit locals 1
.end method

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is i I from Label0 to Label1
Label0:
	invokestatic MPClass/getmaxint()I
	invokestatic io/putInt(I)V
Label1:
	return
.limit stack 1
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
