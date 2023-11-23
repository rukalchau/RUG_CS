# Number System

- binary is a nuatral way to represent two states, as we have the on and off of the a switch 
    
- positional vs non- positional

    1010\
    the first 1 is 1000 and the second 1 is 10, value of the number depends on its postiton\
    XI\
    the symbol of the value regardless of it position 


- convert dex to bin\
    repeated division by radix(2)

- convert bin to dex 
    multiply digit by radix to the power of the position of the digit 

- signed integer 

    - signed magnitude
        - first digit 0 = positive, 1 = negative 
        - range = [-2^(n-1),2^(n-1)]
        - example : 7 = 0111 and -7 = 1111

    - 1's complement
        - flip the positive 
        - example : 5 = 00101 and -5 = 11010

    - 2's complement
### Q: what is the problem with sign-mag and 1's complement 
    sign-mag: 10000 == 00000 == 0
    1's com : 00000 == 11111 == 0 
    1. two zeros 
    2. operation is not simple for all cases

- 2s complement
    - motivation = to simplify circuit (to use binary arithmetic for all cases)
    - define add (x,-x)= 0 
    - assgined to -x the pattern according the defination 

    - exmaple : 5 = 00101 and -5 = 11011, 00101 + 11011 = 100000, cuz its 5 bits, ignore the 1, 00101+11011 = 00000
    - range = [-2^(n-1),2^(n-1)-1] 
    - 3 bits example 
        0:000   
        1:001   -1:111
        2:010   -2:110
        3:011   -3:101
                -4:100
     - x -> -x 
        flip all bit and aad 1 

- fixed-point binary 
    - = integer . fraction 
    - example : the -1 bit = 2^(-1) = 0.5 

### Q: how to convert decimal fraction to bin 
    for i in range: 
        dex X *=2 
        B pos(-i-1) = (X>=1)

- subtaction in base-2 == negate the second operand and do addiction

### Q: How to do sign extension 
    4 bits bin -> 8 bits bin 
    0100(+4) -> 00000100
    1100(-4) -> 11111100

    extend the bits depending on the sign

- oveflow
    - overflow only happen when you trying to add two positive bumbers or two negative numbers 
    - example : 01000 + 01001 = 10001(8+9=-15)

### Q: How to test overflow 
    use AND to check the sign 
    overflow = (sign of operand_1 AND sign of operand_2 ) != sign of result

- Hex Notation 

### Q: How to convert a Bin to Hex 
    group every 4 digits form right to left 
    1010 1011 1100 (bin)
    10   11   12   (dex)
    A    B    C    (hex)

- Floating-Point 
    - motivation : to deal with very large and very small numbers 
    - N = F x 2^(E)
    - 32 bits : S(1 bit)+E(8 bits)+F(23 bits)

    - F is normalized -> [1,2)
    - assuming 1 exist in F, so F = .xxxx not x.xxxx
    
    - 127 is added to E, so the negtive exponent will be [1,126]
    - if E is 0, the fration will be subnormal, which means we don't assume the 1

    - N = (-1)^S x 1.fraction x 2^(exponent-127) E = [1,254]
    - N = (-1)^S x 0.fraction x 2^(-126)         E = 0 

- infinity
    - if E =11111111
    - positive or negative depends on the sign 

- subnormal 
    - if E = 00000000
    - N = (-1)^S x 0.fraction x 2^(-126) 
    - extend range into very small numbers 
- zero
    - 00000000000000000000000000000000
    - see explaination by chatgpt
### Q: give a example in floating point binary and covert it to dex
    1 01111110 10000000000000000000000
    -> -1 x 1.4194304 x 2^(126-127) = -0.75

### Q: convert dex to floating point binary
    -0.75 
    -1 x 1.1 x 2^(-1)
    1 -1+127 =126 .1
    1 01111110 10000000000000000000000 
    * fraction field = left to the right from the binary point!

- the use of binary fractions has some untended consequences
    - example: bank system 
    - solution: BCD

- Binary Code Decimal
    - represent 0-9 in four bits 
    - example: 3 : 0011

- Character Set
    - more than 1 interpretation can be used by bits 
    - ASCII

- Floating point binary is dicrete subset of real number 

### Q: What is the smallest number represented by floating point binaray 
    0.00000001 x 2^(-126) = 2^(-131)
    IEEE : 1.00000001 x 2^(-127)

    to be anwser 


