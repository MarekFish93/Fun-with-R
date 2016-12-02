library(dplyr)
punkty <- read.csv("punkty.csv",
                   sep=";", na.strings = "-", dec=",")

prog<- c(0,5,9,11,13,15)
slownie<- c("ndst","dst","dst+","db","db+","bdb")

funkcja <- function(dane)
{
  
  if(is.data.frame(dane)==TRUE | is.table(dane)==TRUE) {
    dane<-mutate(dane,Suma_punktów=rowSums(dane[,-1], na.rm=T), Ocena="") 
    for(i in 1:nrow(dane)){
      if(dane$Suma_punktów[i] >= 5 && dane$Suma_punktów[i] < 9){
        dane$Ocena[i] <- "dst"
      } else if(dane$Suma_punktów[i] >= 9 && dane$Suma_punktów[i] < 11){
        dane$Ocena[i] <- "dst+"
      } else if(dane$Suma_punktów[i] >= 11 && dane$Suma_punktów[i] < 13){
        dane$Ocena[i] <- "db"
      } else if(dane$Suma_punktów[i] >= 13 && dane$Suma_punktów[i] < 15){
        dane$Ocena[i] <- "db+"
      } else if(dane$Suma_punktów[i] >= 15){
        dane$Ocena[i] <- "bdb"
      } else {
        dane$Ocena[i] <- "ndst"
      }
    }
    print.data.frame(dane)
  } 
  else{
    
    print("Wprowadziłeś nieprawidłowe dane. Program obsługuje dane typu data.frame lub table")
  }
}

ramka <-funkcja(punkty)
----------------------------------------------------------------------------------
funkcja2 <- function(dane)
{
  if(is.data.frame(dane)==TRUE | is.table(dane)==TRUE) {
  dane<-mutate(dane,Suma_punktów=rowSums(dane[,-1], na.rm=T), Ocena="") 
    for (i in 1:nrow(dane)) {
      for(n in 1:length(prog)){
        if(dane$Suma_punktów[i]>=prog[n]){
        dane$Ocena[i]<-slownie[n]
      }}
    }
  print.data.frame(dane)
  }
else{
  print("Wprowadziłeś nieprawidłowe dane. Program obsługuje dane typu data.frame lub table")
}}



ramka1 <- funkcja2(punkty)







