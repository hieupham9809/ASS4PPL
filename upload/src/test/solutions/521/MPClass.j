.source MPClass.java
.class public MPClass
.super java.lang.Object
.field static x I
.field static y I

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	iconst_1
	putstatic MPClass.x I
	iconst_2
	putstatic MPClass.y I
	iconst_0
	ifle Label2
	getstatic MPClass.x I
	invokestatic io/putInt(I)V
	goto Label3
Label2:
	getstatic MPClass.y I
	invokestatic io/putInt(I)V
Label3:
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
