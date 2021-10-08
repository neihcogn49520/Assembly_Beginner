.model small ;kich thuoc chuong trinh
.stack 100 ; vung nho
.data       ;khai bao du lieu  
nhan db "Xin chao$"    ;nhan: ten bien
.code
main proc
; add your code here
    ;ham ngat ah loai 1: de nhap 1 ky tu tu ban phim
    mov ah, 1
    int 21h    
    
    ;ham ngat ah loai 2: de in ra 1 ky tu
    mov ah, 2
    mov dl,35h ;in ra ma ascii
    int 21h   
                    
    ;ham ngat ah loai 9: de in ra chuoi ky tu
     mov ax,@data
     mov ds,ax
     mov ah, 9
     lea dx, nhan
     int 21h
     
     ;ham ngat ah, 4ch: de dung chuong trinh, dat cuoi ct, truoc main endp
     mov ah, 4ch
     int 21h



main endp
end main




