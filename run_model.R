# use this to run a model

library('caret');
library(parallel); 
library(doParallel);

set.seed(1234)

#trCtrl <- trainControl(method="cv", number=10)
trCtrl <- trainControl(method="repeatedcv", number=20, repeats = 5)

registerDoParallel(clust <- makeForkCluster(detectCores()-1))

#model_RF_cv_10 <- train(classe ~.,data=df, method="rf", trControl = trCtrl)
#model_NNET_cv_10 <- train(classe ~.,data=df, method="nnet", trControl = trCtrl)
#model_PLS_cv_10 <- train(classe ~.,data=df, method="pls", trControl = trCtrl)
#model_GBM_cv_10 <- train(classe ~.,data=df, method="gbm", trControl = trCtrl)

#model_RF_repeatedcv_20_5 <- train(classe ~.,data=df, method="rf", trControl = trCtrl)
model_GBM_repeatedcv_20_5 <- train(classe ~.,data=df, method="gbm", trControl = trCtrl)


stopCluster(clust)

