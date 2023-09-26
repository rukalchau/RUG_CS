def char_pos(char: str) -> int:
    if char.isupper():
        return ord(char) - ord("A")
    else:
        return ord(char) - ord("a")

def reverse_key (key):
    alpha="abcdefghijklmnopqrstuvwxyz"
    r_key=""
    x=97
    for i in range(26):
        for j in range(26):
            if ord(key[j])==x:
                r_key+=alpha[j]
                x+=1
    return(r_key)

def encrypt_mapping(text: str, mapping: str) -> str:
    encrypted = ""
    for ch in text:
        if ch.isalpha():
            mapped_ch = mapping[char_pos(ch)]

            if ch.isupper():
                encrypted += mapped_ch.upper()
            else:
                encrypted += mapped_ch.lower()
        else:
            encrypted += ch

    return encrypted


key="qwertyuiopasdfghjklzxcvbnm"

encrypted=encrypt_mapping("hello",key)

print(encrypted)
#output: itssg
print(encrypt_mapping(encrypted,reverse_key(key)))
#output: hello
