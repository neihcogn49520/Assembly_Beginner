DSEG SEGMENT
chuoi DB ?DAI HOC GIAO THONG VAN TAI PHAN HIEU TPHCM.$?
DSEG ENDS
CSEG SEGMENT
 ASSUME CS: CSEG, DS: DSEG
start: mov ax, DSEG
 mov ds, ax
mov ah, 09h  ;Ham 9, in chuoi ra man hinh 
 lea dx, chuoi ;dl chua ky tu can in 
 int 21h       ;goi ngat thuc hien
 mov ah, 08h
 int 21h
 mov ah, 4Ch ;thoat khoi chuong trinh
 int 21h
CSEG ENDS
 END start