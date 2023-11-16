def vigenere_chipher_encoder(msg,key):
    n_msg=""
    key_len=len(key)
    j=0
    for i in msg:
        n_msg+=chr((ord(i)+ord(key[j])-97-97)%26+97)
        if j ==key_len-1:
            j=0
        else:
            j+=1
    return n_msg

def vigenere_chipher_dencoder(msg,key):
    n_msg=""
    key_len=len(key)
    j=0
    for i in msg:
        n_msg+=chr((ord(i)-ord(key[j])+26)%26+97)
        if j ==key_len-1:
            j=0
        else:
            j+=1
    return n_msg








the_string = input()
func,key= the_string.split()
msg=input()
if func=="e":
    print(vigenere_chipher_encoder(msg,key),end='\n\n')
else:
    print(vigenere_chipher_dencoder(msg,key),end='\n\n')




