library('caret');
load('./repeatedcv_20_5.models.RData')

tdf = read.csv("./pml-testing.csv", 
              header = TRUE, 
              na.strings = c("NA", ""), 
              stringsAsFactors = T)
# remove any predictors that are NA/empty
tdf = tdf[,colSums(is.na(tdf)) == 0]
# remove metadata fields
tdf = tdf[,-which(names(tdf) %in% c("X","user_name"))]
tdf = tdf[,-grep("timestamp|window", names(tdf))]
tdf = tdf[,-grep("_[xyz]$", names(tdf))]

pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("problem_id_",i,".txt")
    write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}

predictions = predict(model_RF_repeatedcv_20_5, newdata=tdf)
pml_write_files(predictions)