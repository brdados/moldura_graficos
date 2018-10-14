library(ggplot2)
library(magick)
library(dplyr)

chamada <- function(texto = "texo aqui \n com ponto final", cor = "amarelo"){
  
  texto <- toupper(texto)
  corh <- switch(cor, "amarelo" = "#FBDE4B",
                 "azul" = "#042971",
                 "verde" ="#449847")

 top <- ggplot() + ggtitle(texto) +
    theme(plot.title = element_text(hjust = 0.5, vjust = -6, color="white",
                                    size=30, face = "bold", family = "Futura-Bold"),
          plot.background = element_rect(fill = corh),
          panel.background = element_rect(fill = corh))
 top
}

moldura <- function(diretorio = "molduras", cor = "verde"){
   mold <- image_read(paste0(diretorio, "/moldura_", cor, ".png"))
   mold
}

# exemplo plotar o grafico
grf <- image_graph(width = 900, height = 640, res = 96)
  ggplot(mtcars, aes(mpg, wt, color = cyl)) + geom_point()
dev.off()

# lendo a moldura
mod <- moldura(cor = "azul")

# criando o texto parte superior
topo <- image_graph(width = 1050, height = 640, res = 96)
chamada(texto = "texto da chamada \n  aqui", cor = "azul")
dev.off()

# jutando tudo
image_composite(mod, grf, offset = "+75+210") %>%
image_composite(image_crop(topo, "800x150+90"), offset = "+70-1")
  
 