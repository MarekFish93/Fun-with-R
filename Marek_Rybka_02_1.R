df <- data.frame(litary = c("X","B","Y","D"), liczby = c("1","2","3,0","4,0"), braki = c(NA,1,NA,1), stringsAsFactors = FALSE)
names(df)<-c("litery","liczby całkowite","braki")
df[1,1]<-c("A");df[3,1]<-c("B");df[1,3]<-c("0");df[3,3]<-c("0")