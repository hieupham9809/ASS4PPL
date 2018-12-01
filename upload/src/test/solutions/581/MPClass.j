.source MPClass.java
.class public MPClass
.super java.lang.Object
.field static i I
.field static j I

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
Label2:
	iconst_1
	ifle Label3
	ldc "LOOPING..."
	invokestatic io/putStringLn(Ljava/lang/String;)V
	goto Label3
	goto Label2
Label3:
	iconst_1
	putstatic MPClass.i I
Label4:
	getstatic MPClass.i I
	bipush 100
	if_icmpgt Label6
	iconst_1
	goto Label7
Label6:
	iconst_0
Label7:
	ifle Label5
Label8:
	iconst_0
	ifgt Label10
	iconst_1
	goto Label11
Label10:
	iconst_0
Label11:
	ifgt Label12
	iconst_1
	goto Label13
Label12:
	iconst_0
Label13:
	ifgt Label14
	iconst_1
	goto Label15
Label14:
	iconst_0
Label15:
	ifle Label9
	goto Label9
	goto Label8
Label9:
	bipush 9
	ineg
	putstatic MPClass.j I
Label16:
	getstatic MPClass.j I
	iconst_1
	ineg
	if_icmpgt Label18
	iconst_1
	goto Label19
Label18:
	iconst_0
Label19:
	ifle Label17
	getstatic MPClass.j I
	getstatic MPClass.i I
	imul
	ineg
	invokestatic io/putInt(I)V
	getstatic MPClass.j I
	iconst_1
	iadd
	putstatic MPClass.j I
	goto Label16
Label17:
	goto Label17
	getstatic MPClass.i I
	iconst_1
	iadd
	putstatic MPClass.i I
	goto Label4
Label5:
Label1:
	return
.limit stack 19
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
