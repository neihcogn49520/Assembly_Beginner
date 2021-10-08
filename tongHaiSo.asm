.MODEL SMALL
.STACK 100h
.DATA                 
    tb1 DB "Chuong trinh tinh tong hai so$"
    tb2 DB 10,13,"Nhap vao X: $"
    tb3 DB 10,13,"Nhap vao Y: $"
    tb4 DB 10,13,"Tong hai so X+Y: $"
.CODE
    BEGIN:
        MOV AX,@DATA
        MOV DS,AX
;Xuat thong bao 1
        MOV AH,9
        LEA DX,tb1
        INT 21h
Nhap X
        MOV AH,9
        LEA DX,tb1
        INT 21h
        CALL    Nhap10
        MOV CX,BX
;Xuat Y
        MOV AH,9
        LEA DX,tb1
        INT 21h
        CALL    Nhap10
;Xuat ket qua
        MOV AH,9
        MOV DX,tb4
        INT 21h
        ADD ?,?
        CALL    Xuat10
        JMP Exit            
;Chuong trinh con nhap 1 so he so 10 tu ban phim
;Ket qua luu trong BX
        Nhap10  PROC
            PUSH AX
            PUSH CX
            PUSH DX
            PUSH SI
            PUSH DI
            Xuly:
                XOR BX,BX
                MOV DI,10
                XOR CH,CH
                MOV SI,1
                MOV AH,1
                INT 21h
                CMP AL,'-'
                JE  dautruSI
                CMP AL,'+'
                JE  daucongSI
                JMP lapr
                dautruSI: 
                    MOV SI,-1
                    INT 21h
                    JMP lapr
                daucongSI:
                    INT 21h
                lapr:
                    CMP AL,30h
                    JB  Xuly
                    CMP AL,39h
                    JA  Xuly
                    AND AL,0fh
                    MOV CL,AL
                    MOV AX,BX
                    MUL DI
                    ADD AX,CX
                    MOV BX,AX
                    MOV AH,1
                    INT 21h
                    CMP AL,13
                    JNE lapr
                    CMP SI,0
                    JGE thoi
                    NEG BX
                thoi:
                    POP DI
                    POP SI
                    POP DX
                    POP CX
                    POP AX
                    RET
        Nhap10 ENDP 
; Chuong trinh in 1 so ra man hinh dang thap phan
; So can in : BX
        Xuat10 PROC
            PUSH AX
            PUSH BX
            PUSH CX
            PUSH DX
            PUSH SI
            PUSH DI         ;so chia=10
            MOV DI,10
            TEST BX,8000h   ;BX<0? zf=0?
            JZ inra
            MOV ah,2
            MOV dl,'-'
            INT 21h         ;in ra dau '-'
            NEG BX          ;dao dau BX
            inra: MOV AX,BX ;so bi chia la BX
            xor CX,CX
            laps: 
                XOR DX,DX ; xoa phan cao cua so bi chia
                DIv DI      ; AX= thuong, DX = so du
                PUSH DX
                INC CX
                CMP AX,0    ;thuong=0?
                JNZ laps
                MOV AH,2
            lapf: 
                POP DX
                OR  DL,30h
                INT 21h
                LOOP lapf
            POP DI
            POP SI
            POP DX
            POP CX
            POP BX
            POP AX
            RET
        Xuat10 ENDP
        Exit:
            MOV AH,4ch
            INT 21h
    END BEGIN