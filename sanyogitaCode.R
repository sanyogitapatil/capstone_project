setwd("D:\\Sanyogita\\Upgrad\\Healthcare\\capstone\\Hospital_Revised_FlatFiles_20161110")
list.files(pattern = ".csv$")
list.filename<-list.files(pattern=".csv$")
list.filenames<-  gsub(".csv","",list.filename)
list.filenames<-  gsub(" ","-",list.filenames)
list.filenames<-  gsub("---","-",list.filenames)

# create a loop to read in your data
for (i in 1:length(list.filename))
{
  list.data[[i]]<-read.csv(list.filename[i])
}
names(list.data)<-list.filenames
list.data[1]
