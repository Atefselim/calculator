.model 
.stack 100h 
.data 
mes1 db "Enter 1st Number : $"
mes2 db 0dh,0ah,"Enter 2nd Number :$"
mes3 db 0dh,0ah," Enter any arithmetic operation (+,-,%,/,*) $"
mes4 db 0dh,0ah,"The answer of addition is : $"   
mes5 db 0dh,0ah,"The answer of subtraction  is : $"     
mes6 db 0dh,0ah,"The answer of multioplication is : $" 
mes7 db 0dh,0ah,"The answer of division  is : $" 
mes8 db 0dh,0ah,"The answer of moudle is : $"  
.code 
main proc 
    mov ax,@data 
    mov ds,ax 
    
    lea dx,mes1 
    mov ah,9
    int 21h 
    
    mov ah,1
    int 21h 
    sub al,30h
    mov bl,al
    mov ax,0 
    
    lea dx,mes2
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,30h
    mov bh,al
    mov ax,0 
    
    lea dx,mes3
    mov ah,9
    int 21h
    
    mov dx,0 
    mov ah,1
    int 21h
    mov dl,al  
    mov ax,0
    
    cmp dl,2bh 
    je plus 
    
    cmp dl,2dh  
    je minus
    
    cmp dl,2ah 
    je multiply 
    
    cmp dl,25h
    je division   
    
    cmp dl,2fh
    je module  
    
    plus:
    
    lea dx,mes4
    mov ah ,9
    int 21h 
    
    mov dx,0 
    mov ax,0 
    add bl,bh
    mov al,bl 
    
    mov bx,0
    mov bl,10d 
    div bl 
    mov ch,ah 
    mov cl,al 
    mov dl,cl 
    add dl,30h
    mov ah,2
    int 21h 
    
    mov dl,ch 
    add dl,30h 
    mov ah,2
    int 21h 
    
    mov ah,4ch
    int 21      
    
    minus: 
    
    lea dx ,mes5
    mov ah,9
    int 21h 
    
    mov dx,0 
    mov ax,0
    sub bl,bh 
    mov dl,bl 
    add dl,30h
    mov ah,2
    int 21h
    
    mov ah,4ch 
    int 21h
    
    multiply: 
    lea dx,mes6
    mov ah,9
    int 21h 
    
    mov dx,0
    mov ax,0 
    mov al,bl
    mul bh 
    aam 
    mov cl,al 
    mov ch,ah
     
    mov dl,ch 
    add dl,30h
    mov ah,2
    int 21h 
    mov dl,cl 
    add dl,30h 
    mov ah,2
    int 21h 
    
    mov ah,4ch 
    int 21h
    
    division: 
    
     
    lea dx,mes8
    mov ah,9
    int 21h 
    
    mov ax,0 
    mov dx,0 
    mov cx,0 
    
    mov al,bl 
    div bh 
    mov ch,ah
    mov dl,ch 
    add dl,30h
    mov ah,2
    int 21h 
    mov ah,4ch 
    int 21h    
    
    module:
   
    lea dx,mes7
    mov ah,9
    int 21h

    mov ax,0
    mov bx,0
    mov cx,0

    mov al,bl
    div bh
    mov cl,al
    add dl,30h
    mov ah,2
    int 21h

    mov ah,4ch
    int 21h
    
    main endp 
end main