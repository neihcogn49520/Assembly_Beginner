.model small
.stack 100
.data  
tb1 db "Nhap so: $"  
tb2 db 10,13,"So vua nhap la: $"     ;10,13: xuong dong
x dw ?  ;dw: kieu cua bien (db, dd), ? là chua biet gia tri cua bien x
y dw ?
.code
main proc 
    mov ax, @data
    mov ds,ax
    ;nhap so 
    mov ah, 9
    lea dx, tb1  ;hien thi dong thong bao tb1
    int 21h
    call nhapso
    ;hien thi so
    mov ah, 9
    lea dx, tb2
    int 21h
    call hienthi
    ;ket thuc
    mov ah,4ch  ;ah=4ch: thoat chuong trinh
    int 21h
main endp 
nhapso proc
   mov x,0 ;khoi tao gia tri bien x, y la 0  
   mov bx, 10 ;chuyen co so 10 vao thanh ghi bx, neu he nhi phan: 2,...
nhap:
   mov ah,1
   int 21h    ;nhap vao mot so
   cmp al, 13 ;khi bam enter , chuong trinh dung lai
   je thoat   ;thoat
   sub al, 30h  ;lay ra gia tri vua nhap - 30h: vi ma ascii cua  la 35
   xor ah, ah   ;xoa thanh ghi ah: vi chuyen gia tri tu thanh ghi ax sang bien y 
   mov y, ax   
   mov ax, x
   mul bx      ;nhan voi 10
   add ax, y   ;cong y vao ax
   mov x,ax    ;cat ax vao bien x de khong bi mat khi thuc hien cac cau lenh tiep
   jmp nhap    ;quay lai nhap chu so tiep theo
thoat:
   ret ;return
nhapso endp
   ;Xuat
hienthi proc 
    mov bx, 10
    mov ax, 0
    mov cx, 0
chia:
    mov dx, 0
    div bx
    inc cx ;sau moi lan chia tang cx len 1
    push dx  ;cat dx vao ngan xep
    cmp al, 0  ;neu bang 0 => hien thi (de xem chia het hay chua)
    je hthi
    jmp chia   ; neu khong bang 0 => chia tiep
hthi:
    pop dx    ;lap du lieu tu dinh ngan xep de dua vao thanh ghi dx
    add dl, 30h  ;chuyen tu so sang ma ascii cua so: cong them 30h
    mov ah, 2
    int 21h     
    dec cx     ;giam cx di sau moi lan hien thi mot so
    cmp cx, 0  ; khi cx bang 0 => dung lai
    jne hthi   ;cx khac 0 => quay lai hien thi
    ret        ;quay lai dong 23 => thoat chuong trinh
hienthi endp
end main
    
    


