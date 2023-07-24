#E:\Research-Articles\Journal-Software-Technology\Effort-Aware-Replication\Effort-Aware-classification\Dataset 

#E:\Research-Articles\Journal-Software-Technology\Effort-Aware-Replication\Effort-Aware-classification\Dataset 
#E:\Research-Articles\Journal-Software-Technology\Effort-Aware-Replication\Effort-Aware-classification\Dataset

data2=NULL #Dataset reset 

data2<-NULL
data2 <- read.csv("E:\\Research-Articles\\Journal-Software-Technology\\Effort-Aware-Replication\\Effort-Aware-classification\\Dataset\\Eclipse-3.0.csv")
data2  #Reading the dataset 

data2=data.frame(data2)

colnames(data2) 

data2<-data2[, c("N", "A", "post", "Ca", "Ce", "I", "D", "pkgKLOC")] 
#Getting required columns of metric
dataset=data2  
dataset
    
###########################################################################################################################
# In below part of experiment, all the variables are defined and innitialized 

#=========================================================================================================
EffortAwareTModel<-function(dataset)
{
  
  
  colnames(dataset)
  library("dplyr")
  
  attach(dataset)
  
  n.folds<-10
  folds <- cut(sample(seq_len(nrow(dataset))),  breaks=n.folds, labels=FALSE)
  
  TP=NULL
  FN=NULL
  FP=NULL
  TN=NULL
  PD=NULL
  PF=NULL
  
  MFM=NULL
  accuracy=NULL
  precission=NULL
  recall=NULL
  
  
  
  sensitivity=NULL
  specificity=NULL
  
  thresh.pred=NULL
  logit.prob=NULL
  balance<-NULL
  
  
  colnames(dataset)
  
  all.confusion.tables<-list()
  
  ################################################################################################################
  #In below part of experiment, test and train data sets are seperated. Then logistic regression is applied 
  #to get prediction result of 0 or 1. This is repeated 10 times with 10 folds of dataset. 
  
  ########################################################################################################
  
    for (i in seq_len(n.folds))
    {
      
      
      train <-filter(dataset, folds !=i)
      test <- filter(dataset, folds==i)
      glm.model <- glm((post>0) ~   N+A+Ce+Ca+D+I+pkgKLOC,  data=train, family= "binomial")
      
      # above equation acquires glm model. Model uses metrics are indepedent variables and bug as dependent variable
      
      model.pred<-predict(glm.model, newdata=test[, -3])
      
      # Logistic regression model (glm) is then applied over test data 
      
      thresh.pred <-model.pred>=0.5 
      # if the prediction threshhold is more than 0.52, we say this is positive 
      #mapply(result,thresh.pred, SIMPLIFY = TRUE)
      
      all.confusion.tables[[i]]<-table(factor(test$post>0, levels=c(F,T)), factor(thresh.pred, levels=c(F,T)))
      
      TN[i]=all.confusion.tables[[i]][1,1]
      FN[i]=all.confusion.tables[[i]][2,1]
      FP[i]=all.confusion.tables[[i]][1,2]
      TP[i]=all.confusion.tables[[i]][2,2]
      
      
      accuracy[i] <- (TP[i] + TN[i]) / (TN[i] + FN[i] + FP[i] + TP[i])
      
      precission[i] <- if (TP[i] + FP[i] ==0) { 1 } else (TP[i]) / (TP[i] + FP[i])
      recall[i] <- TP[i] / (TP[i] + FN[i])
      
      MFM[i]<- (2*recall[i]*precission[i])/(recall[i]+precission[i])
      
      sensitivity[i] <-  (TP[i]) / ( FN[i]+ TP[i])
      
      PD[i] <-  (TP[i]) / ( FN[i]+ TP[i])
      PF[i]<- (FP[i]) / ( FN[i]+ TP[i])
      
      specificity[i] <- (TN[i]) / (TN[i]+FP[i]) 
      
      balance[i]= 1- sqrt((0-PF[i])^2+(1-PD[i])^2)
      
    }
  
  
  #########################################################
  
  #After compeleting the data set, we get accuracy and F measure values for performance of model 
  
  #########################################################
  #sensitivity<-(sensitivity, na.rm=TRUE)
  #specificity<-(specificity, na.rm=TRUE)
  
  #balance[i]= 1- sqrt((0-sensitivity[i])^2+(1-specificity[i])^2)
  
  
  balance
  
  max(balance)  
  
  MFM
  accuracy
  precission
  recall
  max(MFM, na.rm=TRUE)
  max(MFM)
  mean(accuracy)
  sd(accuracy)
  result=NULL
  result<-data.frame(accuracy, balance, MFM)
  result[is.na(result)]<-0
  
  
  cat("10-fold 10 times cross validation result at prediction threshold", "\n")
  
  print(result)
  
  
  cat("Mean Accuracy=", mean(accuracy), "\n")
  cat("Standard Deviation of accuracy=", sd(accuracy), "\n")
  cat("Mean balance metrics value=", mean(balance), "\n")
  cat("Mean MFM metric value=", mean(MFM),"\n")
  cat(" ")

} 
  
  
 EffortAwareTModel(dataset)
 
 ################################################
 #Obtain mean values of balance and MFM from 
 #Above table and re-execute the function by
 #changing threshold
 #accuracy values for particular data-set
 ###################################################
  