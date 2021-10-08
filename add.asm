.model small
.stack 100
.data
.code
main proc
    ;ham add: cong
    mov al, 9
    mov bl, 5
    add al,bl ;ket qua cong luu vao al: lay bl cong vao al
    ;ham sub: tru
    mov al, 9
    mov bl, 4
    sub al, bl  ;ket qua tru luu vao al
    ;ham mul: nhan
    mov al, 200
    mov bl, 4
    mul bl ;mac dinh lay mot thua so trong al nhan voi trong ham mul la bl
    ;ham div: chia kieu byte va chia kieu word
    mov ax, 20
    mov bx, 6
    ;chia thanh ghi 8bit: ax, phan nguyen luu vao al, du luu vao ah
    div bl ;mac dinh lay so trong ax chia chia cho bx luu vao bl
    ;chia thanh ghi 16bit: bx, phan nguyen luu vao ax, phan du luu vao dx
    div bx ;mac dinh lay so trong ax chia chia cho bx luu vao bl
main endp
end main
    
    


