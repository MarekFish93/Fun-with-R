df1 <- read.table(text="X;Y;Z  
ID2; 2016-06; 566  
ID1; 2016-06; 10239  
ID6; 2016-06; 524  
ID2; 2016-07; 2360  
ID1; 2016-07; 13853  
ID6; 2016-07; 2352  
ID2; 2016-08; 3950  
ID1; 2016-08; 14738  
ID6; 2016-08; 4104",header=TRUE, sep=";")
library(tidyr)
library(dplyr)
df1_l<-spread(df1,Y,Z)

df1_l %>%
 summarise(Suma_za_czerwiec= sum(` 2016-06`, na.rm=T),
          Suma_za_lipiec= sum(` 2016-07`, na.rm=T),
          Suma_za_sierpien= sum(` 2016-08`, na.rm=T))

-------------------------------------------------------------------------------------------------
#nieco mniej eleganckie rozwiązanie, bo po dodaniu zmienia się tabela i dalsza praca na niej
#jest utrudniona, jednakże polecenie "add_row" jest calkiem wygodne i pochodzi z pakietu dplyr
df1_l %>%
  add_row(X='', ` 2016-06`=sum(df1_l$` 2016-06`),
                    ` 2016-07`=sum(df1_l$` 2016-07`),
                    ` 2016-08`=sum(df1_l$` 2016-08`))






 
                   
      

