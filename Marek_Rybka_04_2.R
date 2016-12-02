df2 <- data.frame(name = c("Dzesika", "Brajan", "Seba"),  
                  matma = c(2, 3, 5), 
                  polak = c(5, 5, 4))
library(tidyr)
df2_w<-gather(df2, key=name);
colnames(df2_w)<-c("name","przedmiot","ocena")


df2


df2_w
