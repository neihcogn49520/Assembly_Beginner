.model samll
.stack 100h
.data
tb1 db 10,13,"Hay nhap mot ky tu: $"
tb2 db 10,13,"Ky tu da nhap la: $"
tb3 db 10,13,"Ky tu dung truoc la: $"
tb4 db 10,13,"Ky tu dung sau la: $"
x db ? ;khai bao ky tu can nhap
.code
main proc 
    mov ax, @data
    mov ds,ax
    ;hien thi thong bao 1
    lea dx, tb1
    mov ah, 9
    int 21h
    ;nhap 1 ky tu
    mov ah, 1
    int 21h
    mov x, al
    ;hien thi thong bao 2
    lea dx,tb2
    mov ah, 9
    int 21h
    ;in ra ky tu da nhap
    mov ah, 2
    mov dl, x
    int 21h
    
    
main endp
end main


