#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(dplyr)
library(tidyr)
library(RColorBrewer)

datos_michelin <- read.csv(file = "michelin_my_maps.csv")

datos_michelin <- datos_michelin %>% separate(col = Address, into = c('resto1', 'resto2','resto3','resto4','resto5', 'calle', 'ciudad','CP', 'Pais'),sep = ',', remove = FALSE, fill = 'left')
michelin_espania <- datos_michelin %>% filter(Pais == " Spain", preserve = TRUE)

Encoding(michelin_espania$Name) <- "UTF-8"
Encoding(michelin_espania$Address) <- "UTF-8"

michelin_espania$MinPrice <- as.numeric(michelin_espania$MinPrice)
michelin_espania$MaxPrice <- as.numeric(michelin_espania$MaxPrice)

michelin_espania$PriceFactor <- cut(michelin_espania$MinPrice,
                                    c(10,35,45,65,85,365), include.lowest = T,
                                    labels = c('10-35 €', '35-45 €', '45-65 €', '65-85 €', '85-365 €'))

PriceCol <- colorFactor(palette = rev(brewer.pal(5,"RdYlGn")), michelin_espania$PriceFactor)

lat_espania <- 40.416775
long_espania <- -3.703790

mapa_espania <- leaflet() %>% 
  setView(lat = lat_espania, 
          lng = long_espania, 
          zoom = 6)

# Define UI for application that draws a map
ui <- fluidPage(

    # Application title
    titlePanel("Michelin Guide Restaurants 2021 - Spain"),

    # Sidebar Layout
    sidebarLayout(
      sidebarPanel(
        checkboxGroupInput(inputId = "category", 
                           label = "Award", 
                           choices = unique(michelin_espania$Award),
                           selected = unique(michelin_espania$Award)),
        h2("Michelin Guide"),
        br(),
        img(src = "https://www.culinaryartseurope.com/wp-content/uploads/2019/08/michelin-star-png-2-1.png", height = 50, width = 50),
        br(),
        br(),
        p("A very good restaurant in its category"),
        br(),
        br(),
        img(src = "data:image/png;base64,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",height = 50, width = 100),
        br(),
        br(),
        p("Excellent cooking, worth a detour"),
        br(),
        br(),
        img(src = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Etoile_Michelin-3.svg/1200px-Etoile_Michelin-3.svg.png",height = 50, width = 150),
        br(),
        br(),
        p("Exceptional cuisine, worth a special journey"),
        img(src = "https://www.gastroteca.cat/wp-content/uploads/bib-gourmand2x.png",height = 150, width = 120),
        p("Exceptionally good food at moderate prices"),
        ),
        
        # Main Panel
        mainPanel(
          img(src = "http://www.advertiser-serbia.com/advertiser/wp-content/uploads/2020/10/Michelin-Star.jpg", height = 190, width = 380),
          br(),
          leafletOutput("mymap"),
          br(),
          "Dataset obtained from:", 
          a("https://www.kaggle.com/datasets/ngshiheng/michelin-guide-restaurants-2021?resource=download")
        )
      )
    )

# Define server logic required to draw a map
server <- function(input, output) {
  filtro <- reactive({
    michelin_espania %>% filter(Award %in% input$category)
  })
  

  output$mymap <- renderLeaflet({
    mapa_espania %>% addTiles()%>%
      addCircleMarkers(lat = filtro()$Latitude, 
                       lng = filtro()$Longitude, 
                       popup = paste("<strong>", filtro()$Name, "</strong>", 
                                      "<br>", filtro()$Cuisine, 
                                      "<br>", filtro()$Award,
                                      "<br><p style=color:#808080>", filtro()$Address, '</p>'), 
                       color = PriceCol(filtro()$PriceFactor), 
                       radius=5, 
                       opacity =1)%>%
      addLegend('bottomright', 
                pal = PriceCol, 
                values = michelin_espania$PriceFactor,
                title = 'Price',
                opacity = 1)
  
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
