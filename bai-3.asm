.model small 
.stack 100h
.data

leap dw 'Leap year$'
nleap dw 'Not Leap year$'
a dw ?
b dw ?
c dw ?
.code
string macro str
    
    push ax
    push dx
    
    mov dx,offset str
    mov ah,9         
    int 21h
    
    pop dx
    pop ax
endm

main proc
    mov ax,@data
    mov ds,ax    
    INPUT:
	   MOV AH,1
	   INT 21H
	   CMP AL,13D
	   JNE NUMBER 
	   
	   JMP CHECK
	   
	   
	   NUMBER:
	   SUB AL,30H
	   MOV CL,AL
	   MOV AL,BH
	   MUL BL
	   ADD AL,CL
	   MOV BH,AL
	   
	   JMP INPUT   
	   
	   CHECK:   
	   
	   CMP BH,1
	   JLE NOT_PRIME
	   
	   MOV CX,2
	   AND AX,0
	   AND DX,0
	   
	   MOV AL,BH
	   DIV CX
	   
	   MOV CX,AX               
	   
	   ISPRIME:
	   CMP CX,2
	   JL PRIME
	   AND AX,0
	   AND DX,0
	   MOV AL,BH              
	   DIV CX 
	   DEC CX
	   CMP DX,0
	   JE NOT_PRIME
	   JMP ISPRIME
	   
	   
	   
	   
	   PRIME:
	   MOV AH,2 
	   MOV DL,0AH
	   INT 21H
	   MOV DL,0DH
	   INT 21H


	   
	   
	   NOT_PRIME:
	   MOV AH,2 
	   MOV DL,0AH
	   INT 21H
	   MOV DL,0DH
	   INT 21H
    

    push ax
    
    mov bx,400
    div bx  ; ax=ax/400
    mov a,dx
    mov dx,0
    
    pop ax
    push ax
    
    mov bx,4
    div bx  ;ax=ax/4
    mov b,dx
    mov dx,0
    
    pop ax
    
    push ax
    
    mov bx,100
    div bx; ax=ax/100
    mov c,dx
    mov dx,0
    
    pop ax

    
    cmp a,0
    jne @else1
    
    string leap
    jmp @endelse
    
    @else1:
    
    cmp b,0
    jne @else2
    cmp c,0
    je  @else2
    
    string nleap
    
    jmp @endelse
    
    @else2:
    
    string leap
    
    @endelse:
    
    

    mov ax,4ch
    int 21h
    main endp

end main