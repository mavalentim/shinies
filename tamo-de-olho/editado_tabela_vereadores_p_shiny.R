# editor da tabela do marcello
library(tidyverse)

setwd("~/Documentos/jfemdados/vereadores")


tabela <- rio::import("vereadores.xlsx", sheet = "count_vereador")%>%
  select(-porcentagem)%>%
  pivot_wider(id_cols = 'Autor',
              names_from = 'ImpactoLegislativo',
              values_from = 'n')%>%
  filter(!Autor == 'Executivo' ,!Autor == 'Mesa Diretora - biênio 2017/2018' ,
         !Autor == 'Mesa Diretora - Biênio 2019/2020')%>%
  mutate(Total = `Impacto Variado` + `Legislação Simbólica ou Irrelevante`,
        `Porcentagem de projetos úteis` = `Impacto Variado`/`Total`)

rio::export(tabela, "meus-vereadores.csv")

tabelat<-tabela%>%
  filter(Autor == "Delegada Sheila" | Autor == 'Pardal')

ggplot(tabela, aes(x= Autor, y= `Porcentagem de projetos úteis`)) + geom_col(width = 0.4, fill= 'red') +
  coord_flip()



