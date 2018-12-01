.source MPClass.java
.class public MPClass
.super java.lang.Object
.field static i I

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	iconst_0
	putstatic MPClass.i I
Label2:
	getstatic MPClass.i I
	bipush 10
	if_icmpgt Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	ifle Label3
	getstatic MPClass.i I
	iconst_5
	if_icmple Label8
	iconst_1
	goto Label9
Label8:
	iconst_0
Label9:
	ifle Label6
	goto Label3
	goto Label7
Label6:
Label7:
	getstatic MPClass.i I
	iconst_1
	iadd
	putstatic MPClass.i I
	goto Label2
Label3:
	getstatic MPClass.i I
	invokestatic io/putIntLn(I)V
	iconst_0
	putstatic MPClass.i I
Label10:
	getstatic MPClass.i I
	bipush 100
	if_icmpgt Label12
	iconst_1
	goto Label13
Label12:
	iconst_0
Label13:
	ifle Label11
	getstatic MPClass.i I
	bipush 10
	if_icmplt Label16
	iconst_1
	goto Label17
Label16:
	iconst_0
Label17:
	ifle Label14
	goto Label10
	goto Label15
Label14:
	getstatic MPClass.i I
	invokestatic io/putInt(I)V
Label15:
	getstatic MPClass.i I
	iconst_1
	iadd
	putstatic MPClass.i I
	goto Label10
Label11:
Label1:
	return
.limit stack 12
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
