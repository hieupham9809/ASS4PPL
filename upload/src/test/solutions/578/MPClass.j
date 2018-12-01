.source MPClass.java
.class public MPClass
.super java.lang.Object
.field static i I

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	bipush 9
	putstatic MPClass.i I
Label2:
	getstatic MPClass.i I
	iconst_5
	if_icmplt Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	ifle Label3
	getstatic MPClass.i I
	iconst_3
	rem
	iconst_0
	if_icmpne Label8
	iconst_1
	goto Label9
Label8:
	iconst_0
Label9:
	ifle Label6
	getstatic MPClass.i I
	iconst_3
	idiv
	invokestatic io/putFloatLn(F)V
	goto Label7
Label6:
Label7:
	getstatic MPClass.i I
	iconst_1
	isub
	putstatic MPClass.i I
	goto Label2
Label3:
Label1:
	return
.limit stack 9
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
