import re

position = input() 
match = re.match(r'\((\d+)\, *(\d+)\)', position)   
x = int(match.group(1))
y = int(match.group(2))
base_point=(x,y)
lines=[]
a,b,p=map(int,input().split())
key_m,key_n=map(int,input().split())



def point_add(p1, p2):
    x1, y1 = p1
    x2, y2 = p2
    if p1==(float('inf'),float('inf')):
        return p2
    if p2==(float('inf'),float('inf')):
        return p1 
    if p1 == p2:
        if y1 ==0:
            return (float('inf'),float('inf')) # m = inf 
        alpha = ((3*x1**2 + a)*pow(2*y1,-1,p))%p
    else: 
        if x1 == x2:
            return (float('inf'),float('inf')) # m = inf 
        alpha = ((y2-y1)*pow(x2-x1,-1,p))%p

    x3 = (alpha**2 - x1 - x2)%p
    y3 = (-y1 +alpha*(x1-x3))%p

    return (x3,y3)

new=base_point
for i in (range(key_m-1)):          
    new=point_add(base_point,new)
    # print(i+2,new) #debug msg
base_point=new
for i in range(key_n-1):
    new=point_add(base_point,new)
    # print(i+2,new) #debug msg

print(new)
