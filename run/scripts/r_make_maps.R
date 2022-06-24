
period<-301
out_file_name<-"wheat_gephi_edges_2016_01.csv"
source("r_write_import_network_for_gephi.R")
source("r_makeExportMap2.R")
system("mv index.html index_2016_01.html")

period<-312
out_file_name<-"wheat_gephi_edges_2016_12.csv"
source("r_write_import_network_for_gephi.R")
source("r_makeExportMap2.R")
system("mv index.html index_2016_12.html")
