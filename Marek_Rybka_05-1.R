library(tidyr)
library(dplyr)
library(ggplot2)

set.seed(333) # blokuje generator liczb pseudolosowych
akcje <- data_frame(time = as.Date('2017-01-01') + 0:9,
                    APPLE = rnorm(10, 0, 1),
                    GOOGLE = rnorm(10, 0, 2),
                    MICROSOFT = rnorm(10, 0, 4))

akcje_w<-akcje%>%
gather(firma, notowanie, APPLE:MICROSOFT)

akcje_w %>%
  ggplot(aes(x=time, y=notowanie, color=firma)) +
   geom_line(size=1)




