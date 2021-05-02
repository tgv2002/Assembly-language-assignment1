.global _start

.text

_start:
mov $25,%r8           #x=25
mov $1,%r10             #let register r10 contain the value of n factorial for every iteration,initialized by 1
mov $1,%rdi             #let register rdi be the register which maintains the count of iterations, and thus,the answer,i.e,here , count=0;
mov $1,%r9              #temp register r9,used to update n factorial,by multiplying it with (n+1) for its next iteration
mov %r10,%r11           #temp register , which stores n factorial,to perform modulus operations

check:
sub %r8,%r11           #division by repeated subtraction
cmp %r8,%r11           #comparing n factorial and x
jge check               #continuing repeated subtraction , as this not the true value of n factorial mod x
cmp $0,%r11             #checking if x divides n factorial
je exit                 #if the above case occurs,exit program
jmp loop                #updating the counter,as x doesn't divide n factorial in this iteration

loop:
add $1,%rdi             #count++
add $1,%r9              #updating n for next iteration
imul %r9,%r10           #transforming n factorial to (n+1)factorial
mov %r10,%r11           #copying n factorial to temp register for modulus operation
jmp check               #performing division by repeated subtraction again

exit:
mov %rdi,%r11
mov $60,%rax
xor %rdi,%rdi
syscall

