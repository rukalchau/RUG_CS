def dec (x):
    print('{0:06b}'.format(x),end="")
    
def char_code(char):
    if(ord(char)-65<26 and ord(char)-65>=0):
        return dec(ord(char)-65)
    if char==" ":
        return dec(26)
    if char=="?":
        return dec(27)
    if char==".":
        return dec(28)

msg="THIS IS A SAMPLE STRING. OR IS IT?"
print(len(msg))

for i in range(33//5+1):
    j=i*5
    char_code(msg[j])
    char_code(msg[j+1])
    char_code(msg[j+2])
    char_code(msg[j+3])
    char_code(msg[j+4])
    print()


# 01001100011100100001001001101000 4C721268
# 00100001001001101000000001101000 21268068
# 01001000000000110000111100101100 48030F2C
# 00010001101001001001001101000100 11A49344
# 00100000110100011001110001101000 20D19C68
# 00111001000101101000100001001000 39168848
# 01101000100001001101101100000000 6884DB00
