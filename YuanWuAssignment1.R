#0
print("Yuan Wu 1307193")
#1
#a
library(foreign)
df.dta<-read.dta("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_dta.dta")
#b
cf.csv<-read.csv("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_CSV.csv")
#c
df.td<-read.table("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_TSV.txt",sep="\t", header=TRUE)
#d
df.rdata<-load(url("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_RData.RData"))
print("The name of the dataset is NHIS_2007_RData")
#2
print("RData is the smallest, only 45.3 KB. CSV and TXT file are both 138 KB. 
    STATA file is the largest at 188 KB. Most likely, these differences
    was caused by the way the data was saved in each form. TXT and CSV files
    save a lot empty spaces as part of the dataset, while R can ignore
    the spaces and only store the meaningful part.")
#3
class(NHIS_2007_RData)
print("data.frame")
typeof(NHIS_2007_RData)
print("list")
length(NHIS_2007_RData)
print("9 in length")
dim(NHIS_2007_RData)
print("4785 by 9")
nrow(NHIS_2007_RData)
print("4785 rows")
ncol(NHIS_2007_RData)
print("9 columns")
summary(NHIS_2007_RData)
print("      HHX             FMX             FPX             SEX       
 Min.   :   16   Min.   :1.000   Min.   :1.000   Min.   :1.000  
      1st Qu.:13404   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:1.000  
      Median :27527   Median :1.000   Median :1.000   Median :2.000  
      Mean   :27009   Mean   :1.019   Mean   :1.359   Mean   :1.549  
      3rd Qu.:40192   3rd Qu.:1.000   3rd Qu.:2.000   3rd Qu.:2.000  
      Max.   :53955   Max.   :6.000   Max.   :8.000   Max.   :2.000  
      BMI            SLEEP             educ           height     
      Min.   :12.91   Min.   : 3.000   Min.   : 0.00   Min.   :59.00  
      1st Qu.:23.63   1st Qu.: 6.000   1st Qu.:12.00   1st Qu.:64.00  
      Median :26.97   Median : 7.000   Median :13.00   Median :67.00  
      Mean   :31.73   Mean   : 9.507   Mean   :14.25   Mean   :69.58  
      3rd Qu.:31.51   3rd Qu.: 8.000   3rd Qu.:16.00   3rd Qu.:71.00  
      Max.   :99.99   Max.   :99.000   Max.   :99.00   Max.   :99.00  
      weight     
      Min.   :100.0  
      1st Qu.:149.0  
      Median :175.0  
      Mean   :266.2  
      3rd Qu.:215.0  
      Max.   :999.0  ")
#4
df<-read.dta("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/org_example.dta")
str(df)
print("'data.frame':	1119754 obs. of  30 variables:...")
summary(df$rw)
print("   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
          1.8    10.7    15.9    19.8    24.4   354.8  521279 ")
#5
a<-c(1,2,3,4,5,6,7,4,NULL,NA)
length(a)
print("length=9,NULL was ignored and not exist in the dataset.")
mean(a,na.rm=TRUE)
print("mean=4")
#6
x<-matrix(c(1,2,3,4,5,6,7,8,9),ncol=3,byrow=TRUE)
t(x)
print("     [,1] [,2] [,3]
      [1,]    1    4    7
      [2,]    2    5    8
      [3,]    3    6    9")
y<-eigen(x)
y$val
print("[1]  1.611684e+01 -1.116844e+00 -1.303678e-15")
y$vec
print("           [,1]        [,2]       [,3]
      [1,] -0.2319707 -0.78583024  0.4082483
      [2,] -0.5253221 -0.08675134 -0.8164966
      [3,] -0.8186735  0.61232756  0.4082483")
y<-matrix(c(1,2,3,3,2,1,2,3,0),ncol=3,byrow=TRUE)
solve(y)
print("        [,1]    [,2]  [,3]
      [1,] -0.1875  0.5625 -0.25
      [2,]  0.1250 -0.3750  0.50
      [3,]  0.3125  0.0625 -0.25")
y%*%solve(y)
print("              [,1]         [,2]          [,3]
      [1,]  1.000000e+00 5.551115e-17 -2.220446e-16
      [2,]  0.000000e+00 1.000000e+00  5.551115e-17
      [3,] -5.551115e-17 0.000000e+00  1.000000e+00")
print("It should be the identity matrix.")
#7
carat<-c(5,2,0.5,1.5,5,NA,3)
cut<-c("fair","good","very good","good","fair","Ideal","fair")
clarity<-c("SI1","I1","VI1","VS1","IF","VVS2",NA)
price<-c(850,450,450,"Null",750,980,420)
frame<-data.frame(carat,cut,clarity,price)
pricenum<-c(850,450,450,NA,750,980,420)
frame2<-data.frame(carat,cut,clarity,pricenum)
mean(pricenum,na.rm=TRUE)
print("mean price is 650.")
faircut<-subset(frame2,cut=="fair")
mean(faircut$pricenum,na.rm=TRUE)
print("mean price for fair cuts is 673.33")
gvgicut<-subset(frame2,cut!="fair")
mean(gvgicut$pricenum,na.rm=TRUE)
print("mean price for good, very good and ideal cuts is 626.67")
large<-subset(frame2,carat>2&cut=="Ideal"|cut=="very good"&carat>2)
median(large$pricenum,na.rm=TRUE)
print("median price for large diamonds(greater than 2 carats) with ideal or very good cuts
      do not exist, since diamond satisfy such condition does not exsit in the dataset")