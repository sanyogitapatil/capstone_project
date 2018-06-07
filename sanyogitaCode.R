folder <- "D:\\Sanyogita\\Upgrad\\Healthcare\\capstone\\Hospital_Revised_FlatFiles_20161110/"      # path to folder that holds multiple .csv files
file_list <- list.files(path=folder, pattern="*.csv") # create list of all .csv files in folder
list.filenames<-  gsub(".csv","",file_list)
list.filenames<-  gsub(" ","-",list.filenames)
list.filenames<-  gsub("---","-",list.filenames)
# read in each .csv file in file_list and create a data frame with the same name as the .csv file
for (i in 1:length(file_list)){
  assign(list.filenames[i], 
         read.csv(paste(folder, file_list[i], sep=''))
  )}


#Combine files of hospital(facility),National,State

Ambul_surg_measure <- left_join(left_join(`Ambulatory-Surgical-Measures-Facility`,`Ambulatory-Surgical-Measures-National`,c("Year")),`Ambulatory-Surgical-Measures-State`,c("State","Year"))
Complications<-left_join(left_join(`Complications-Hospital`,`Complications-National`,c("Measure.Name","Measure.ID")),`Complications-State`,c("State","Measure.Name","Measure.ID"))
###Looking at files of hvbp They have identical rows Even first 6 cols are same so good to combine them via merge
##Two df hvbp_Efficiency_08_26_2016 and hvbp_imm2_08_26_2016 have col name as County_name and rest has county.Name
##so changed the col name 
colnames(hvbp_Efficiency_08_26_2016)[7] <- "County.Name"
colnames(hvbp_imm2_08_26_2016)[7] <- "County.Name"

hvbp<-merge(hvbp_ami_08_26_2016,hvbp_Efficiency_08_26_2016)
hvbp<-merge(hvbp,hvbp_hai_08_26_2016)
hvbp<-merge(hvbp,hvbp_hcahps_08_26_2016)
hvbp<-merge(hvbp,hvbp_imm2_08_26_2016)
hvbp<-merge(hvbp,hvbp_outcome_08_26_2016)
hvbp<-merge(hvbp,hvbp_pn_08_26_2016)
hvbp<-merge(hvbp,hvbp_scip_08_26_2016)
hvbp<-merge(hvbp,hvbp_tps_08_26_2016)
