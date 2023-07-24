
###################################################
### recommended RStudio to run the following code
### NOTICE: You need replace path with origional data-set Path
###################################################

pathRandom=NULL

pathRandom="E:\\Research-Articles\\Journal-Software-Technology\\Effort-Aware-Replication\\Effort-Aware-classification\\Dataset\\Eclipse-3.0.csv"


####Effort Aware ranking with Random Model ######################################
EffortAwareRankingRandom<-function(pathRandom)
{
  
  data=NULL
  
  data<- read.csv(pathRandom)
  data
  
  nProness <- cumsum(data$post)
  kLoc <- cumsum(data$pkgKLOC)
  plot(kLoc/max(kLoc)*1000, nProness/max(nProness)*100, ylab="% Package Faults", xlab="KSLOC", sub="dataset", bty="L", pch=19)

}



 
#Below is an example how path is set
pathIdeal=NULL

pathIdeal="E:\\Research-Articles\\Journal-Software-Technology\\Effort-Aware-Replication\\Effort-Aware-classification\\Dataset\\Eclipse-3.0.csv"



####Effort Aware ranking with Random Model ######################################
EffortAwareRankingIdeal<-function(pathIdeal)
{

      data=NULL
      data=read.csv(pathIdeal)
      data<-data.frame(data)
      data<-data[, c("post", "pkgKLOC")]
      data
      data <- data[order(-data$post,data$pkgKLOC),]
      data1
      nProness1 <- cumsum(data$post)
      kLoc1<- cumsum(data$pkgKLOC)

lines(kLoc1/max(kLoc1)*1000, nProness1/max(nProness1)*100,col="red")

}




################################################## Effort Aware Prediction Plots with R.M ###################
  pathTmodel<-NULL
  pathTmodel <- read.csv("E:\\Research-Articles\\Journal-Software-Technology\\Effort-Aware-Replication\\Effort-Aware-classification\\Dataset\\Eclipse-3.0.csv")
  pathTmodel<-pathTmodel[, c("N", "post", "A","Ca", "Ce", "I", "D", "pkgKLOC")]
  

  EffortAwareRankingTModel<-function(pathTmodel)
  {
  library("dplyr")
  data2=pathTmodel
  colnames(data2)
  
  attach(data2)
  result<-NULL
  mydata<-NULL
  result <- list()
  
  n.folds<-10
  folds <- cut(sample(seq_len(nrow(data2))),  breaks=n.folds, labels=FALSE)
  tmp<-NULL
  model.pred<-NULL
  
  thresh.pred=NULL
  logit.prob=NULL
  
  all.confusion.tables <- list()
  
  
    for(i in seq_len(n.folds))
    {
      
      
      train <-filter(data2, folds !=i)
      test <- filter(data2, folds==i)
      
     
       glm.model <- glm(post ~ N+A+Ce+Ca+I+D,  data=train)
      
      
      
      model.pred<-predict(glm.model, newdata=test[,-2])
      
      thresh.pred <-model.pred>=0.5
      
      tmp <- thresh.pred * 1
      result <- append(result, tmp)
      
      
    }
    
    
  
  
  
  result
  names(result) <- 1:length(result)
  names(result)
  
  mydata<-NULL
  predictnproness<-NULL
  predictKLOC<-NULL
  mydata <-data.frame(data2$pkgKLOC,data2$post)
  df <- data.frame(matrix(unlist(result),nrow = length(result), byrow=T))
  
  df
  mydata$predict <- df$matrix.unlist.result...nrow...length.result...byrow...T.
  
  mydata
  colnames(mydata) <- c("pkgKLOC","post","predict")
  mydata <- mydata[order(-mydata$predict,mydata$pkgKLOC),]
  
  
  mydata
  
  predictnProness <- cumsum(mydata$post)
  predictKLOC <- cumsum(mydata$pkgKLOC)
  
  lines(predictKLOC/max(predictKLOC)*1000,predictnProness/max(predictnProness)*100,col="blue")
  
  }






 ######################### Effort-Aware Ranking with H.Abdeen+T ################################

pathTHabdeen<-NULL


pathTHabdeen <- read.csv("E:\\Research-Articles\\Journal-Software-Technology\\Effort-Aware-Replication\\Effort-Aware-classification\\Dataset\\Eclipse-3.0.csv")


pathTHabdeen<-pathTHabdeen[, c("N", "post", "A","Ca", "Ce", "I", "D", "pkgKLOC", "IIPED", "IIPUD", "PF", "IPSC")]
colnames(pathTHabdeen)

EffortAwareTplussHAbdeenModel<-function(pathTHabdeen)
{
  
  data2=pathTHabdeen    
  library("dplyr")
  data2
  colnames(data2)
  
  attach(data2)
  result<-NULL
  mydata<-NULL
  result <- list()
  
  n.folds<-10
  folds <- cut(sample(seq_len(nrow(data2))),  breaks=n.folds, labels=FALSE)
  tmp<-NULL
  model.pred<-NULL
  
  thresh.pred=NULL
  logit.prob=NULL
  
  all.confusion.tables <- list()
  
  
    for(i in seq_len(n.folds))
    {
      
      
      train <-filter(data2, folds !=i)
      test <- filter(data2, folds==i)
      
      glm.model <- glm(post ~N+A+Ce+Ca+I+D+IIPUD+IIPED+IPSC+PF,  data=train)
      
      model.pred<-predict(glm.model, newdata=test[,-2])
      thresh.pred <-model.pred>=0.5
      tmp <- thresh.pred * 1
      result <- append(result, tmp)
      
      
    }
    
  
  
  
  
  result
  names(result) <- 1:length(result)
  names(result)
  mydata<-NULL
  predictnproness<-NULL
  predictKLOC<-NULL
  mydata <-data.frame(data2$pkgKLOC,data2$post)
  df <- data.frame(matrix(unlist(result),nrow = length(result), byrow=T))
  df
  mydata$predict <- df$matrix.unlist.result...nrow...length.result...byrow...T.
  
  mydata
  colnames(mydata) <- c("pkgKLOC","post","predict")
  mydata <- mydata[order(-mydata$predict,mydata$pkgKLOC),]
  
  
  mydata
  predictnProness <- cumsum(mydata$post)
  predictKLOC <- cumsum(mydata$pkgKLOC)
  
  lines(predictKLOC/max(predictKLOC)*1000,predictnProness/max(predictnProness)*100,col="green")
  
}

##################################################################
#Generating graphs as shown in Figure-2
#############################################################
  
  EffortAwareRankingRandom(pathRandom) 

  EffortAwareRankingIdeal(pathIdeal)
  
  EffortAwareRankingTModel(pathTmodel)
  
  EffortAwareTplussHAbdeenModel(pathTHabdeen)
  
  
  
  
  
  

  







###################################################################



legend(c("Random Model", "RM", "RM+PkgReuse", "RM+Sarkar"))

x<-1:10; y1=x*x; y2=2*y1
plot(x, y1, type="b", pch=19, col="red", xlab="x", ylab="y")
# Add a line
lines(x, y2, pch=18, col="blue", type="b", lty=2)
# Add a legend
legend(1, 95, legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty=1:2, cex=0.8)












