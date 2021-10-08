.model small
.stack 100
.data
    TBao1    db    "Hay nhap so N: $"
    TBao2    db    0DH,0AH,"So N da nhap: $"
    soN    db    ?
.code 
Main proc
    Mov ax,@data
       Mov ds,ax
 
       Lea dx, TBao1
       Mov ah, 9           
       int 21h
    
       Mov ah, 1       
       Int 21h    
       Mov soN, al
   
       lea dx, TBao2
       mov ah, 9       
       int 21h
      
       Mov ah, 2       
       Mov dl, soN
       Int 21h
    MOV AH, 4Ch
    INT 21h  
    
Main endp    
end main