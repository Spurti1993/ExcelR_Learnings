#Basic Operations in R

1+1
2+2*3
3^2
pi
exp(1)
sqrt(4)
2*pi* exp(2)
x <- 2
y <- 4
z <- 2
x*y+z
a.c <- 2011

a <- c(10,2,30,4)
rep(2,4)
b <- c(1,4,8,9)
p <- a+b
q <- c(2,3)
x <- b*q
seq(1,5)
seq(2,9)
seq(2,30,by=6)
sqrt(a)
x[2]
x[-2]#only the 2nd index is not printable but it is still present is x vector
x
sd=x[-2]#variable sd doesnt contail index 2 i.e index 2 value is replaced with
        #index3 of x in sd
x[1]
x[2]
x[3]
x[4]
x[5]
x[-2] = 1
x < 5
x < p
p[x<8] = 5
p[p<6]
p[p<6] = 1

#-------------------Data Frames--------------------#

df = data.frame(weight=c(80,55.6,79),sex=c("Female","male","male"))
df1 = data.frame(x = 1:3, y = c("a","b","c"), z = c(2,9,0))
df2 = data.frame(x=1:3,y=c("a","b","c"))
df$sex#$ represents listing of column data
df1
df2
    #-------------------Slicing of DataFrame class exersise from PPT----------------------#
    df2[1,1]#prints value 1
    df2[1,c(1,2)]#print value 1 and a
    df2[c(1,3),2]#print value a and c
    df2[c(1,3),1]#print value 1 and 3
    df2[c(1,3),c(1,2)]#print 1,a,3,c
    