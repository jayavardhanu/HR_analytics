#import dataset

raw<-read.csv('C:/Users/JAYAVARDHAN/Desktop/HR analytics practice problem/train.csv')
library(MASS)
library(MLmetrics)
head(raw)
raw1<-raw[-c(1)]
raw1[raw1 == "NA"] <- 0
colnames(raw1)[colnames(raw1)=='KPIs_met..80.']<-'KPI'
colnames(raw1)[colnames(raw1)=='awards_won.']<-'awards_won'
head(raw1)
names(raw1)
modl<-lda(is_promoted~.,raw1)
#modl
pred<-predict(modl)
#pred

#yy<-data.frame(pred,raw1$is_promoted)
#yy

#str(yy)
#F1_Score(y_pred = pred, y_true = raw1$is_promoted)
#F1_Score(y_pred = pred, y_true = raw1$is_promoted, positive = "1")


cl<-pred$class
str(cl)
#cl

cmat<-table(raw1$is_promoted,cl)
str(cmat)
#cmat

diag(cmat)
sum(diag(cmat))/sum(cmat)
data.frame(raw1$is_promoted,pred$x,pred$class)
str(raw1)

str(x)
raw1<-x


newdata<-read.csv('C:/Users/JAYAVARDHAN/Desktop/HR analytics practice problem/test.csv')
newdat1<-read.csv('C:/Users/JAYAVARDHAN/Desktop/HR analytics practice problem/test.csv')
newdata<-newdata[-c(1)]
newdata[newdata == "NA"] <- 0

colnames(newdata)[colnames(newdata)=='KPIs_met..80.']<-'KPI'
colnames(newdata)[colnames(newdata)=='awards_won.']<-'awards_won'
result<-predict(modl,newdata=newdata)$class
result

new<-data.frame(newdat1$employee_id,result)
new[new == "NA"] <- 0
write.csv(new, file = "MyData.csv",row.names=FALSE)
