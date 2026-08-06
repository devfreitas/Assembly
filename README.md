# Calculadora Simples em Assembly (NASM)

Uma calculadora simples desenvolvida em **Assembly x86 (NASM)** para ambiente **DOS**, capaz de somar dois números inteiros de **0 a 9** e exibir corretamente resultados entre **0 e 18**.

## Funcionalidades

- Exibe mensagem de boas-vindas.
- Solicita dois números ao usuário.
- Converte os caracteres ASCII para valores numéricos.
- Realiza a soma.
- Exibe o resultado corretamente, incluindo números com duas casas (10–18).
- Finaliza o programa utilizando interrupções do DOS.

## Tecnologias

- Assembly x86
- NASM (Netwide Assembler)
- DOS Interrupts (`INT 21h`)

## Estrutura do Programa

O programa é dividido em três seções:

- **`.data`**
  - Armazena as mensagens exibidas ao usuário.

- **`.bss`**
  - Reserva memória para os dois números digitados.

- **`.text`**
  - Contém toda a lógica do programa.

## Funcionamento

1. Exibe uma mensagem de boas-vindas.
2. Solicita o primeiro número.
3. Solicita o segundo número.
4. Converte ambos de ASCII para inteiro.
5. Soma os valores.
6. Divide o resultado por 10 para separar dezena e unidade.
7. Exibe o resultado.
8. Encerra a execução.

## Como Executar (How To)

### Pré-requisitos

- NASM instalado
- DOSBox ou outro emulador DOS (caso esteja utilizando um sistema operacional moderno)

### 1. Compile o código

```bash
nasm -f bin calculadora.asm -o calculadora.com
```

### 2. Execute

No DOS ou no DOSBox:

```dos
calculadora.com
```

### Exemplo

```
Bem-vindo a Calculadora Simples em Assembly!

Digite o primeiro numero (0-9): 7
Digite o segundo numero (0-9): 8

O resultado da soma e: 15
```

## Explicação da Lógica

### Entrada

A leitura é feita utilizando:

```assembly
mov ah,01h
int 21h
```

O valor retornado é um caractere ASCII.

---

### Conversão ASCII → Número

Como o teclado retorna caracteres ASCII, é necessário converter:

```assembly
sub al,'0'
```

Por exemplo:

```
'5' (53 ASCII)
↓

5
```

---

### Soma

A soma é realizada diretamente:

```assembly
add al,bl
```

---

### Separação da Dezena

Para imprimir corretamente números maiores que 9, o programa divide o resultado por 10:

```assembly
mov bl,10
div bl
```

Após a divisão:

- **AL** → dezena (quociente)
- **AH** → unidade (resto)

Exemplo:

```
15 / 10

AL = 1
AH = 5
```

Assim, o programa consegue imprimir ambos os dígitos.

## Limitações

- Aceita apenas números de **0 a 9**.
- Não valida entradas inválidas.
- Realiza apenas a operação de soma.
- Desenvolvido para ambiente DOS.

##  Licença
Verifique a licença em <a href="LICENSE">MIT LICENSE</a>
