.source MPClass.java
.class public MPClass
.super java.lang.Object

.method public static abs(I)I
.var 0 is i I from Label0 to Label1
Label0:
	iload_0
	iconst_0
	if_icmplt Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	ifle Label2
	iload_0
	ireturn
	goto Label3
Label2:
	iload_0
	ineg
	ireturn
Label3:
Label1:
.limit stack 4
.limit locals 1
.end method

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	sipush 167
	invokestatic MPClass/abs(I)I
	invokestatic io/putIntLn(I)V
	sipush 167
	ineg
	invokestatic MPClass/abs(I)I
	invokestatic io/putIntLn(I)V
	sipush 167
	invokestatic MPClass/abs(I)I
	sipush 167
	ineg
	invokestatic MPClass/abs(I)I
	isub
	invokestatic io/putIntLn(I)V
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
