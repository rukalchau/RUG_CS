x=0.028
while(x*2<1):
    x*=2
    print(0,end="")
print(" ",end="")
for i in range(24):
    x*=2
    if x >=1:
        print(1,end="")
        x-=1
    else:
        print(0,end="")

print(len("11001010110000001000001100010010"))
print(len("11001010110000001000001"))
# 10111100111001010110000001000001