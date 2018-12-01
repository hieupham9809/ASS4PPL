.source MPClass.java
.class public MPClass
.super java.lang.Object
.field static b [I

.method public <clinit>()V
	iconst_4
	newarray int
	putstatic MPClass.b [I
	return
.limit stack 1
.limit locals 0
.end method

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	getstatic MPClass.b [I
	iconst_0
	iconst_0
	iastore
	getstatic MPClass.b [I
	iconst_1
	getstatic MPClass.b [I
	iconst_0
	iaload
	iconst_1
	iadd
	iastore
	getstatic MPClass.b [I
	iconst_2
	getstatic MPClass.b [I
	iconst_1
	iaload
	iconst_1
	iadd
	iastore
	getstatic MPClass.b [I
	iconst_3
	getstatic MPClass.b [I
	iconst_2
	iaload
	iconst_1
	iadd
	iastore
	getstatic MPClass.b [I
	iconst_2
	iaload
	invokestatic io/putInt(I)V
Label1:
	return
.limit stack 14
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
