#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
#include <string.h>
/*
.globl add
	.type	add, @function
add:
	pushl	%ebp 		// Something of obvious note: we can tell this is 32-bit because there is no 'rsp' or 'rbp'
	movl	%esp, %ebp	 
	movl	12(%ebp), %eax	// Pushing variables into %eax
	addl	8(%ebp), %eax	// Adding first var to location of second var in %eax
	popl	%ebp		
	ret			// Returns
	.size	add, .-add
	 */

/*This looks like a basic add function*/

int num[199];


int add(int x, int y){
	return x+y;
}

/*--------------------------------------------


.globl dothething
	.type	dothething, @function
dothething:
	pushl	%ebp		// Standard ops
	movl	%esp, %ebp
	pushl	%ebx
	subl	$28, %esp	// Subtracting 28 from the stack
	movl	8(%ebp), %eax
	movl	num(,%eax,4), %eax 
	cmpl	$-1, %eax	
	je	.L4	
	movl	8(%ebp), %eax	// Moving values to/from %eax/%ebp
	movl	num(,%eax,4), %eax // Multiplies value in %eax by 4
	movl	%eax, -24(%ebp)
	jmp	.L6		// Jumps to L6
.L4:
	movl	$-1, -8(%ebp)	// This chunk declares value at %ebp to -1
	cmpl	$0, 8(%ebp)	
	jne	.L7		
	movl	$0, -8(%ebp)	
	jmp	.L9		// Jumps to L9
.L7:
	cmpl	$1, 8(%ebp)	// Checks to see if value at %ebp = 1
	jne	.L10		// If %ebp[value] !=1 , Jumps to L10
	movl	$1, -8(%ebp)
	jmp	.L9		// Jumps to L9
.L10:
	movl	8(%ebp), %eax	// Compares entries in %ebp and %eax
	subl	$2, %eax
	movl	%eax, (%esp)
	call	dothething 	// This is likely a recursive call
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	subl	$1, %eax	// Compares element at %eax 
	movl	%eax, (%esp)
	call	dothething	// Another recursive call, corresponds with "return add(dothething(i-1),dothething(i-2));"
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	add		// Calls "Add" function from before
	movl	%eax, -8(%ebp)	// Moves to value at %ebp
.L9:
	movl	8(%ebp), %eax
	movl	num(,%eax,4), %eax // Multiplies %eax by 4
	cmpl	$-1, %eax
	jne	.L12		   // If entry at %eax > -1, Jumps to L12
	movl	8(%ebp), %edx
	movl	-8(%ebp), %eax
	movl	%eax, num(,%edx,4) // Multiplies value in %edx by 4?
.L12:
	movl	8(%ebp), %eax	// Compares values at %ebp and %eax again
	movl	num(,%eax,4), %eax
	movl	%eax, -24(%ebp)	// I don't follow/ Multiplies value at %epb by -24?
.L6:
	movl	-24(%ebp), %eax // We see the -24 again
	addl	$28, %esp	// Now we see a comparison at %esp to 28
	popl	%ebx		// Pops from stack
	popl	%ebp		// Pops from stack
	ret
	.size	dothething, .-dothething
	.section	.rodata
*/


/*Fibonacci sequence*/

int dothething(int i){


	if(i <=0){
		return 0;
	} else if (i == 1){
		return 1;
	} else if (i > 1){
		return add(dothething(i-1),dothething(i-2));
	}
	return 0;
}

/*--------------------------------------------


main:
	leal	4(%esp), %ecx // Load Effective Arithmetic: Performs arithmetic on values without altering memory
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ecx
	subl	$36, %esp
	movl	4(%ecx), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, -12(%ebp)
	movl	$0, -8(%ebp)
	jmp	.L16		// Jump to L16
.L17:
	movl	-8(%ebp), %eax 
	movl	$-1, num(,%eax,4)
	addl	$1, -8(%ebp)
.L16:
	cmpl	$199, -8(%ebp)	// It seems that the maximum value of some number is capped at 199
	jle	.L17		// If number  < 199, Jump to 17
	movl	-12(%ebp), %eax	// Comparison being made from %ebp to %eax
	movl	%eax, (%esp)
	call	dothething	// Calls 'dothething' (Fibonacci sequence)
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)	// I don't understand what "LC0" entails, it is likely a comparison
	call	printf		// Simple print statement
	movl	$0, %eax
	addl	$36, %esp	// Adds value to the stack at %esp
	popl	%ecx		// Pops from stack
	popl	%ebp		// Pops from stack
	leal	-4(%ecx), %esp	// Load Effective Arithmetic: performs arithmetic operation on values in the main function
	ret
	.size	main, .-main
*/


/*Main function*/

int main(int argc, char** argv) {

	/*ERROR CHECKS*/
	/*
	1. If args =/= 2
	2. If 0 < var <= 46
	*/
	int tmp = 0;
	int var = atoi(argv[1]);

	if(argc > 2){
		printf("Incorrect number of arguments\n");
		return -1;
	} 
	if(argc < 1){
		printf("Incorrect number of arguments\n");
		return -1;
	}
	if(var < 0){
		printf("Integer size is too small. Range is 1 -> 46\n");
		return -1;
	} 
	if(var > 46){
		printf("Integer size is too large. Range is 1 -> 46\n");
		return -1;
	}

	while(tmp < 199){
		num[tmp] = -1;
		tmp++;
	}

	printf("%s", "Value: ");
	printf("%d\n", dothething(var));
	return 0;


}







