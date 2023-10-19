inf12 = 1:2:inf12

hhh (a,b)  | a==1 =[b]
         | a==2 =[b,b]

gen xs = concat[hhh (i,j)|(i,j)<-zip xs inf12] 

selfrle = gen[1,2]

