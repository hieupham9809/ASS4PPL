.source MPClass.java
.class public MPClass
.super java.lang.Object

.method public static sortarray([I)[I
.var 0 is a [I from Label0 to Label1
.var 1 is i I from Label0 to Label1
.var 2 is j I from Label0 to Label1
.var 3 is temp I from Label0 to Label1
Label0:
	iconst_0
	istore_1
Label2:
	iload_1
	bipush 8
	if_icmpgt Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	ifle Label3
	iconst_0
	istore_2
Label6:
	iload_2
	bipush 8
	if_icmpgt Label8
	iconst_1
	goto Label9
Label8:
	iconst_0
Label9:
	ifle Label7
	aload_0
	iload_2
	iaload
	aload_0
	iload_2
	iconst_1
	iadd
	iaload
	if_icmple Label12
	iconst_1
	goto Label13
Label12:
	iconst_0
Label13:
	ifle Label10
	aload_0
	iload_2
	iaload
	istore_3
	aload_0
	iload_2
	aload_0
	iload_2
	iconst_1
	iadd
	iaload
	iastore
	aload_0
	iload_2
	iconst_1
	iadd
	iload_3
	iastore
	goto Label11
Label10:
Label11:
	iload_2
	iconst_1
	iadd
	istore_2
	goto Label6
Label7:
	iload_1
	iconst_1
	iadd
	istore_1
	goto Label2
Label3:
	aload_0
	areturn
Label1:
.limit stack 19
.limit locals 4
.end method

.method public static printarray([I)V
.var 0 is a [I from Label0 to Label1
.var 1 is i I from Label0 to Label1
Label0:
	iconst_0
	istore_1
Label2:
	iload_1
	bipush 9
	if_icmpgt Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	ifle Label3
	aload_0
	iload_1
	iaload
	invokestatic io/putIntLn(I)V
	iload_1
	iconst_1
	iadd
	istore_1
	goto Label2
Label3:
Label1:
	return
.limit stack 6
.limit locals 2
.end method

.method public static main([Ljava/lang/String;)V
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is myarray [I from Label0 to Label1
Label0:
	aload_1
	iconst_0
	bipush 50
	iastore
	aload_1
	iconst_1
	bipush 70
	iastore
	aload_1
	iconst_2
	iconst_0
	iastore
	aload_1
	iconst_3
	bipush 10
	iastore
	aload_1
	iconst_4
	bipush 90
	iastore
	aload_1
	iconst_5
	bipush 60
	iastore
	aload_1
	bipush 6
	bipush 30
	iastore
	aload_1
	bipush 7
	bipush 20
	iastore
	aload_1
	bipush 8
	bipush 40
	iastore
	aload_1
	bipush 9
	bipush 80
	iastore
	aload_1
	invokestatic MPClass/sortarray([I)[I
	invokestatic MPClass/printarray([I)V
	aload_1
	invokestatic MPClass/printarray([I)V
Label1:
	return
.limit stack 31
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
