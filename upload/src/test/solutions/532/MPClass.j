.source MPClass.java
.class public MPClass
.super java.lang.Object
.field static a [F

.method public <clinit>()V
	sipush 201
	newarray float
	putstatic MPClass.a [F
	return
.limit stack 1
.limit locals 0
.end method

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	getstatic MPClass.a [F
	bipush 99
	iconst_1
	fastore
	getstatic MPClass.a [F
	bipush 99
	ineg
	iconst_1
	ineg
	fastore
	ldc 1234567
	ldc 1234567
	if_icmpne Label2
	iconst_1
	goto Label3
Label2:
	iconst_0
Label3:
	invokestatic io/putBool(Z)V
	getstatic MPClass.a [F
	bipush 99
	faload
	getstatic MPClass.a [F
	bipush 99
	ineg
	faload
	fadd
	ldc 0.0
	ldc 20000000000.0
	fmul
	fcmpl
	ifne Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	invokestatic io/putBool(Z)V
	getstatic MPClass.a [F
	bipush 99
	faload
	getstatic MPClass.a [F
	bipush 99
	faload
	fmul
	getstatic MPClass.a [F
	bipush 99
	ineg
	faload
	fsub
	iconst_2
	i2f
	fsub
	invokestatic io/putFloat(F)V
Label1:
	return
.limit stack 15
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
