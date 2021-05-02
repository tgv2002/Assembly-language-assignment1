.global _start

.text

_start:
mov $3,%r8        #a=3
mov $5,%r9       #b=5
mov $67,%r10       #n=67
mov $1,%r11       #acc=1 (final answer is stored here)

calc:
cmp %r10,%r8     #checking if a is greater than n
jl loop          #going to next step,if a%n < n
sub %r10,%r8     #a-=n
jmp calc         #performing repeated subtraction until a%n < n

loop:
mov %r9,%r12     #temp register r12 holding value of b
and $1,%r12      #value in r12 is updated to (b&1)
cmp $1,%r12      #comparing 1 and (b&1)
je sett          #if b is odd,entering the if condition of C-code
jmp proceed      #if b is even,continue

sett:
imul %r8,%r11
jmp update       #acc=(acc*a)

update:
cmp %r10,%r11
jl proceed
sub %r10,%r11
jmp update      #evaluating (acc*a)%n using the algorithm discussed above,and storing in acc

proceed:
shr $1,%r9     #b=b/2
imul %r8,%r8   #a=a*a

next:
cmp %r10,%r8
jl final
sub %r10,%r8
jmp next      #a=(a*a)%n

final:
cmp $0,%r9    #checking if b>0
jg loop       #execute loop again if b>0

exit:
mov $60,%rax
xor %rdi,%rdi
syscall

