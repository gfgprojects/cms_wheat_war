#this script is run by r_make_maps.R

#build the imp.dyn array by running the r_cost_comparison.R script
#source("r_origin.R")
countries.names<-dimnames(imp.dyn)[[1]]
#isocodes
buyers.data<-read.csv("../../rs_model/cms_wheat/data/buyers_Misc.csv")
#Adjust Oceania coordinates for better visualization
buyers.data[7,3]<--25.5607640622395
buyers.data[7,4]<-134.376078573618
#Adjust South America coordinates for better visualization
buyers.data[2,3]<--35.2201719959357
buyers.data[2,4]<--65.149543390921
	
iso3<-as.character(buyers.data$ISO3.Code[order(buyers.data$Area)])

p.matrix<-imp.dyn[,,period]
c.total<-rowSums(p.matrix)
c.national<-diag(p.matrix)
imports<-c.total-c.national
tot.q<-sum(c.total)
w.matrix<-100*p.matrix/tot.q
write("Source,Target,Type,Weight",out_file_name)
for(i in 1:ncol(p.matrix)){
	for(j in 1:ncol(p.matrix)){
		if(p.matrix[i,j]>0){
			if(i==j){
			}else{
			write(paste(iso3[j],iso3[i],"Direct",w.matrix[i,j],sep=","),out_file_name,append=T)
			}
		}
	}
}
