.source MPClass.java
.class public MPClass
.super java.lang.Object
.field static a [F

.method public <clinit>()V
	iconst_2
	newarray float
	putstatic MPClass.a [F
	return
.limit stack 1
.limit locals 0
.end method
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
	iconst_1
	ldc 1.0
	invokestatic MPClass/floattoint(F)I
	iastore
	getstatic MPClass.b [I
	iconst_2
	ldc 2.5
	invokestatic MPClass/floattoint(F)I
	iastore
	getstatic MPClass.b [I
	iconst_1
	iaload
	invokestatic io/putIntLn(I)V
	getstatic MPClass.b [I
	iconst_2
	iaload
	invokestatic io/putIntLn(I)V
Label1:
	return
.limit stack 8
.limit locals 1
.end method

.method public static inttofloat(I)F
.var 0 is i I from Label0 to Label1
Label0:
	iload_0
	i2f
	ldc 1.0
	fmul
	freturn
Label1:
.limit stack 2
.limit locals 1
.end method

.method public static floattoint(F)I
.var 0 is f F from Label0 to Label1
.var 1 is i I from Label0 to Label1
.var 2 is sign I from Label0 to Label1
Label0:
	iconst_0
	istore_1
	fload_0
	iconst_0
	i2f
	fcmpl
	iflt Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	ifle Label2
	iconst_1
	istore_2
	goto Label3
Label2:
	iconst_1
	ineg
	istore_2
Label3:
	fload_0
	iload_2
	i2f
	fmul
	fstore_0
Label6:
	fload_0
	iconst_1
	i2f
	fcmpl
	iflt Label8
	iconst_1
	goto Label9
Label8:
	iconst_0
Label9:
	ifle Label7
	fload_0
	iconst_1
	i2f
	fsub
	fstore_0
	iload_1
	iconst_1
	iadd
	istore_1
	goto Label6
Label7:
	iload_1
	iload_2
	imul
	ireturn
Label1:
.limit stack 8
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
