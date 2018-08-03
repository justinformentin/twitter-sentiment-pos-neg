library(shiny)

ui <- fluidPage( theme = "bootstrap.css", #Use bootstrap css
  
  shinyUI(navbarPage("Twitter Sentiment Analysis", #Main Navbar
                     
                     tabPanel("Analysis", #Analysis Tab
                        
                        #Designing sidebar components
                        sidebarPanel(helpText("When you enter related KEYWORDS, we can search Tweets through Twitter."),
                                     textInput("searchTerm", "Enter Keyword to Search Tweets", ""), #text input for get keywords
                                     HTML("<hr>"),
                                     helpText("How many number of Tweets you want to extract? Select between 5 - 1000"),
                                     sliderInput("maxTweets","Number of recent tweets to use for analysis:",min=5,max=1000,value=500), #slider for select tweet count 
                                     submitButton(text="Analyse") #submit keyword and tweet count to the server
                                     ), 
                        
                        #Designing mainPanel Components
                        mainPanel(tabsetPanel(
                          tabPanel("Results",
                                   HTML("<div class = text-center><h2>Bar-Chart</h3></div>"), 
                                   plotOutput("histPos")),
                          tabPanel("WordCloud",HTML("<div><h3>Most used words associated with the Keyword that you search!</h3></div>"),plotOutput("word"))
                          )))
                     
       
  ))
)