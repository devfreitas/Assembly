; Calculadora Simples em Assembly (NASM - DOS)
; Soma dois números de 0 a 9
; Exibe corretamente resultados de 0 a 18

section .data

    msg_boas_vindas db 'Bem-vindo a Calculadora Simples em Assembly!',0Dh,0Ah,'$'
    msg_primeiro_num db 'Digite o primeiro numero (0-9): ','$'
    msg_segundo_num db 'Digite o segundo numero (0-9): ','$'
    msg_resultado db 0Dh,0Ah,'O resultado da soma e: ','$'

section .bss

    num1 resb 1
    num2 resb 1

section .text
global _start

_start:

    ; Mensagem de boas-vindas

    mov ah,09h
    mov dx,msg_boas_vindas
    int 21h

    ; Lê o primeiro número

    mov ah,09h
    mov dx,msg_primeiro_num
    int 21h

    mov ah,01h
    int 21h
    mov [num1],al

    ; Lê o segundo número

    mov ah,09h
    mov dx,msg_segundo_num
    int 21h

    mov ah,01h
    int 21h
    mov [num2],al

    ; Converte ASCII para número

    mov al,[num1]
    sub al,'0'

    mov bl,[num2]
    sub bl,'0'

    ; Soma os números

    add al,bl

    ; Exibe mensagem do resultado

    mov ah,09h
    mov dx,msg_resultado
    int 21h

    ; Divide por 10
    ; AL = resultado
    ; AH = resto (unidade)
    ; AL = quociente (dezena)

    xor ah,ah        ; AX = resultado
    mov bl,10
    div bl           ; AX / 10

    ; Se houver dezena, imprime

    cmp al,0
    je unidade

    add al,'0'

    mov dl,al
    mov ah,02h
    int 21h

unidade:
    ; Imprime a unidade

    mov al,ah
    add al,'0'

    mov dl,al
    mov ah,02h
    int 21h

    ; Encerra o programa
    mov ah,4Ch
    int 21h
