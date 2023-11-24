print(ord("A")-65)

def char_code(char):
    if(ord(char)-65<26 and ord(char)-65>=0):
        print(ord(char)-65,end=".")
    if char==" ":
        print(26,end=".")
    if char=="?":
        print(27,end=".")
    if char==".":
        print(28,end=".")

msg="THIS IS A SAMPLE STRING. OR IS IT?"

for i in msg:
    char_code(i)