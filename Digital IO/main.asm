.ORG 0x00 			;code origin
.equ num = 0			;global variable declared
main:				;main part of the code
ldi r16, low(ramend)		
out spl, r16
ldi r16, high(ramend)
out sph, r16
ldi r16, 0
ldi r25, 0xff
ldi r24, 0
OUT DDRB, r25
out ddrd, r24
;out portd, r24
;sbi ddrd, 0
call SevenSegment		;calling seven segment function
call delay			;calling delay, approx. 500ms
in r26, pind
cpi r26, 0
breq descending
ascending:
cpi r16, 9
brne j1
ldi r16, -1
j1:
inc r16
in r26, pind
cpi r26, 0
breq descending
call delay
call SevenSegment
jmp ascending
descending:
cpi r16, 0
brne j2
ldi r16, 10
j2:
dec r16
in r26, pind
cpi r26, 0
brne ascending
call delay
call SevenSegment
jmp descending
SevenSegment:	;code for seven segment
ldi r17, 0xff
cpi r16, 0
brne f1
ldi r17, 0x01
f1:
cpi r16, 1
brne f2
ldi r17, 0x4f
f2:
cpi r16, 2
brne f3
ldi r17, 0x12
f3:
cpi r16, 3
brne f4
ldi r17, 0x06
f4:
cpi r16, 4
brne f5
ldi r17, 0x4c
f5:
cpi r16, 5
brne f6
ldi r17, 0x24
f6:
cpi r16, 6
brne f7
ldi r17, 0x20
f7:
cpi r16, 7
brne f8
ldi r17, 0x0f
f8:
cpi r16, 8
brne f9
ldi r17, 0x00
f9:
cpi r16, 9
brne f10
ldi r17, 0x0c
f10:
OUT PORTB, r17
ret
delay:				;code for delay
ldi r22, 222
l3:
dec r22
cpi r22, 0
breq end
ldi r21, 150
l2:
dec r21
cpi r21, 0
breq l3
ldi r20, 1
l1:
dec r20
cpi r20, 0
brne l1
cpi r20, 0
breq l2
end:
ret  

