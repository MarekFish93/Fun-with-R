library(tidyr)
library(dplyr)
library(PogromcyDanych)
library(ggplot2)
data("auta2012")

auta_5<-
          auta2012%>%
          filter(Rok.produkcji=="2007", 
                 Marka=="Volkswagen") %>%
          select(Model,Rodzaj.paliwa)

freq<- 
          auta_5 %>%
          count(Model,Rodzaj.paliwa) %>%
          mutate(prop=prop.table(n),
                 pos = cumsum(prop.table(n)) - 0.5*prop.table(n))

chisq.test(auta_5$Model,auta_5$Rodzaj.paliwa)
         
ggplot(freq, aes(x = Model, y = prop,fill = Rodzaj.paliwa))     +
          geom_bar(stat = "identity" )                          +
          geom_text(aes(label=ifelse(prop >= 0.001,
          paste0(sprintf("%.0f", prop*100),"%"),""),
          y=pos), colour="black")                               +
          scale_y_continuous(labels = scales::percent_format()) +
          labs(y="Procent", x="Model")                          +
          ggtitle(label = "X-squared = 279.76, df = 36, p-value < 2.2e-16")


