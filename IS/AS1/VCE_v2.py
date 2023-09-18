def vigenere_chipher_encoder(msg,key):
    n_msg=""
    key_len=len(key)
    j=0
    for i in msg:
        if j ==key_len:
            j=0
        if ord(i)>=65 and ord(i)<=90:
            n_msg+=chr((ord(i)+ord(key[j])-ord('a')-65)%26+65)
            j+=1
        elif ord(i)>=97 and ord(i)<=122:
            n_msg+=chr((ord(i)+ord(key[j])-97-97)%26+97)
            j+=1
        else:
            n_msg+=i
    return n_msg

def vigenere_chipher_dencoder(msg,key):
    n_msg=""
    key_len=len(key)
    j=0
    for i in msg:
        if j ==key_len:
            j=0
        if ord(i)>=65 and ord(i)<=90:
            n_msg+=chr((ord(i)-ord(key[j])+ord('a')-65+26)%26+65)
            j+=1
        elif ord(i)>=97 and ord(i)<=122:
            n_msg+=chr((ord(i)-ord(key[j])+26)%26+97)
            j+=1
        else:
            n_msg+=i

    return n_msg








the_string = input()
func,key= the_string.split()

lines = []
while True:
    line = input()
    if line:
        lines.append(line)
    else:
        break
msg = '\n'.join(lines)

if func=="e":
    print(vigenere_chipher_encoder(msg,key),end='\n\n')
else:
    print(vigenere_chipher_dencoder(msg,key),end='\n\n')




