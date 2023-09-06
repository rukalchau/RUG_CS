
def shift_chipher(msg,shift):
    while shift<0:
        shift+=26
    n_msg=""
    for i in msg:
        n_msg+=chr((ord(i)-97+shift)%26+97)
    return n_msg


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



print(shift_chipher(shift_chipher("rukal",-12),12))
print(vigenere_chipher_encoder("rukal","abc"))