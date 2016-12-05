caller:		addi 	$a0, $zero, -13		
		jal	fib			
end:		j	end

fib: 		addi	$sp, $sp, -12 		
		sw 	$ra, 8($sp) 		
		sw 	$t0, 4($sp) 				
		sw 	$a0, 0($sp) 		
		slt	$t0, $a0, $zero		
 		beq	$t0, $zero, call
 		sub	$a0, $zero, $a0	
call:		jal	fib_abs
		beq	$t0, $zero, return
		sub	$v0, $zero, $v0
return:		lw 	$a0, 0($sp) 		
		lw 	$t0, 4($sp) 		
		lw 	$ra, 8($sp) 		
		addi 	$sp, $sp, 12 				
		jr	$ra

fib_abs:	addi	$v0, $zero, 1
		slt	$at, $v0, $a0		
		bne	$at, $zero, gen		
		add	$v0, $zero, $a0		
		jr	$ra			
gen:		addi	$sp, $sp, -12 		
		sw 	$ra, 8($sp) 		
		sw 	$s0, 4($sp) 		
		sw 	$a0, 0($sp) 		
		addi 	$a0, $a0, -1 		
		jal 	fib_abs			
		add 	$s0, $v0, $0 		
		addi 	$a0, $a0, -1 		
		jal 	fib_abs			
		add 	$v0, $v0, $s0 		
		lw 	$a0, 0($sp) 		
		lw 	$s0, 4($sp) 		
		lw 	$ra, 8($sp) 		
		addi 	$sp, $sp, 12 		
		jr 	$ra

exit:
