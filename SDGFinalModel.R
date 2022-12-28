DataSDG<-read.csv("/Users/sarahdoctor/Desktop/FinalData.csv")
attach(DataSDG)
head(DataSDG)


SDGreg<-lm(SDGIndexScore~GreenhouseGas+Normalized.Co2import+NormalizedCo2export
           +Renewable+InternationalSpillover+sdg13Dummy2+sdg13Dummy3)
summary(SDGreg)
 plot(SDGreg)
 


#Test for multicollinearity and heteroskedasticity
 library(lmtest)
 library(car)
 vif(SDGreg)

 bptest(SDGreg) 
 
 #removing variables with high p-values
 #scaling 
SDGreg2<-lm(SDGIndexScore~GreenhouseGas+Normalized.Co2import+InternationalSpillover
          +sdg13Dummy2)
summary(SDGreg2) 

plot(SDGreg2)

library(stargazer)
stargazer(SDGreg,SDGreg2,type="text",column.labels=c("Model 1 ","Model 2"))
