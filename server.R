library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot


  output$distPlot <- renderPlot({
    R_<-seq(1.01,4,.01)
    g1<-c(1.25,1.5,2,2.5,3,4,10)
    p1<-list()
    for (i in 1:length(g1)){
      p1[[i]]<-(R_-1)/(g1[i]-1)
    }
    layout(cbind(1, 2), width=c(7, 1))
    plot(R_,p1[[1]],ylim=c(0,1),type='l',xlim=c(1,4),ylab="Prevalence in exposed population",xlab=expression(paste("Robust Threshold Upper Confidence Limit Size exp(",beta,'*'[tcl],")")),xaxt="n",yaxt="n",col="gray88",lwd=4)
    axis(1)
    axis(2,las=2)
    lines(R_,p1[[2]],col="gray77",lwd=4)
    lines(R_,p1[[3]],col="gray66",lwd=4)
    lines(R_,p1[[4]],col="gray55",lwd=4)
    lines(R_,p1[[5]],col="gray44",lwd=4)
    lines(R_,p1[[6]],col="gray33",lwd=4)
    lines(R_,p1[[7]],col="gray22",lwd=4)
    abline(h=seq(0,1,.1), v=seq(0,4,.1), col="gray", lty=3)
    abline(v=input$R,col="red",lwd=4)
    par(mar=c(0, 0, 0, 0))
    plot.new()
    legend('center',legend=c(expression(Gamma[1]),1.25,1.5,2,2.5,3,4,10),lwd=c(0,rep(4,7)), col=c(0,"gray88","gray77","gray66","gray55","gray44","gray33","gray22"))	
  })
})