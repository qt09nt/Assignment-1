#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)



server = function(input, output){
    
    user_input<-reactive({
        
        region<-input$userregion
        race<-input$userrace
        age<-input$userage
        sex<-input$usersex
        relationship<-input$userrelation
        status<-input$userstatus
        education<-input$usereducation
        occupation<-input$useremployment
        workclass<-input$useremploymenttype
        gain<-input$usercapgain
        loss<-input$usercaploss
        weekly_hours<-input$userweeklyhours
        
        
        user_input<-cbind(region,race,age,sex,relationship,status,education,occupation,workclass,gain,loss,weekly_hours)
        user_input<-as.data.frame(user_input)
        user_input$income<-""
        user_input$age<-as.numeric(user_input$age)
        user_input
        
        
    })
    
    
    
    test<-eventReactive(input$calc,
                        {
                            prob<-predict(logmodel,user_input(),type='response')
                            if (prob >0.5)
                                print("Based on your inputs, income is predicted above 50K USD")
                            else
                                print("Based on your inputs, income is predicted below 50K USD")
                            
                        })
    
    output$text1<-renderText(test())
}
