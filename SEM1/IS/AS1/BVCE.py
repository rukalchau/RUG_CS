import math 
def count_sd(msg):
    s=0
    d=0
    freq = {}
 
    for i in msg:
        if i in freq:
            freq[i] += 1
        else:
            freq[i] = 1

    for i in freq.values():
        s+=i*i
        d+=i
    return math.sqrt((s/26)-(d*d/676))

def avg_sd(msg,x):
    sd=0
    res=[]
    j=0
    for i in msg:
        if ord(i)>=97 and ord(i)<=122:
            if len(res) == x:
                res[j%x]+=i
            else:
                res.append(i)
            j+=1
    
    for i in res:
         sd+=count_sd(i)
    
    return res,x,sd

def craking (msg,low,upp):
    result=[]
    for i in range(low,upp+1):
        result.append(avg_sd(msg,i))
    


craking("djwuhduwhdiuwe",2,5)