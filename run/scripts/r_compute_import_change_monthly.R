#this script load data from sim_input_demand.csv and sim_input_demand_minus_production.csv
#if they are not in the folder,
#run r_compute_aggregate_demand_and_supply.R before to create them
tick.start<-301
tick.end<-312
imp.dyn.w.no.sub<-imp.dyn.w.no[,,tick.start:tick.end]
imp.dyn.expenditures.w.no.sub<-imp.dyn.expenditures.w.no[,,tick.start:tick.end]

imp.dyn.w.yes.sub<-imp.dyn.w.yes[,,tick.start:tick.end]
imp.dyn.expenditures.w.yes.sub<-imp.dyn.expenditures.w.yes[,,tick.start:tick.end]

data.demand<-read.csv("sim_input_demand.csv")
buyers.demand<-data.demand[13:23,]
buyers.demand<-buyers.demand[,-1]
buyers.demand.names<-names(buyers.demand)
#buyers.demand.base.year<-buyers.demand[,which(buyers.demand.names==paste("X",year.of.interest,sep=""))]
buyers.monthly.demand.base.year<-round(buyers.demand[,which(buyers.demand.names==paste("X",2016,sep=""))]/12)

if(F){
	data.import.sim.input<-read.csv("sim_input_demand_minus_production.csv")
	import.sim.input<-data.import.sim.input[13:23,]
	import.sim.input<-import.sim.input[,-1]
	import.sim.input.2014<-import.sim.input$X2014
	import.sim.input.2015<-import.sim.input$X2015
	import.sim.input.2016<-import.sim.input$X2016
}


data.producers<-read.csv("../../rs_model/cms_wheat/data/producers_w.csv")
data.buyers<-read.csv("../../rs_model/cms_wheat/data/buyers_Food.csv")
buyers.names<-data.buyers$Area[(nrow(data.producers)+1):nrow(data.buyers)]

buyers.position.in.imp.dyn<-numeric()
for(i in buyers.names){
	buyers.position.in.imp.dyn[length(buyers.position.in.imp.dyn)+1]<-which(dimnames(imp.dyn.w.no)[[1]]==i)
}

dimnames(imp.dyn.w.no)[[2]]<-dimnames(imp.dyn.w.no)[[1]]

#start.year<-2013
#start.year<-year.neutral-year.for.check #year.neutral set in r_cost_comparison.R while year.for.check is set in r_aggregate_import_dynamics.R 
#phase<-"nina"
n.period<-1
#main.title<-paste("change in Q,",phase,"in 2013 and 2014")
#main.title1<-paste("change in P,",phase,"in 2013 and 2014")
#limit.in.palette<-4
#limit.in.palette1<-32


imp.aggreg.monthly.war.no<-matrix(0,nrow=length(buyers.position.in.imp.dyn),ncol=dim(imp.dyn.w.no.sub)[3],dimnames=list(buyers.names,seq(1,dim(imp.dyn.w.no.sub)[3])))
imp.aggreg.monthly.war.yes<-matrix(0,nrow=length(buyers.position.in.imp.dyn),ncol=dim(imp.dyn.w.no.sub)[3],dimnames=list(buyers.names,seq(1,dim(imp.dyn.w.no.sub)[3])))

imp.expenditures.aggreg.monthly.war.no<-matrix(0,nrow=length(buyers.position.in.imp.dyn),ncol=dim(imp.dyn.w.no.sub)[3],dimnames=list(buyers.names,seq(1,dim(imp.dyn.w.no.sub)[3])))
imp.expenditures.aggreg.monthly.war.yes<-matrix(0,nrow=length(buyers.position.in.imp.dyn),ncol=dim(imp.dyn.w.no.sub)[3],dimnames=list(buyers.names,seq(1,dim(imp.dyn.w.no.sub)[3])))

for(n.period in 1:(dim(imp.dyn.w.no.sub)[3])){
	imp.table.w.no<-imp.dyn.w.no.sub[,,n.period]
	imp.table.w.yes<-imp.dyn.w.yes.sub[,,n.period]
	imp.table2<-imp.table.w.yes[buyers.position.in.imp.dyn,-buyers.position.in.imp.dyn]
	imp.table1<-imp.table.w.no[buyers.position.in.imp.dyn,-buyers.position.in.imp.dyn]
	imp.aggreg.monthly.war.yes[,n.period]<-rowSums(imp.table2)
	imp.aggreg.monthly.war.no[,n.period]<-rowSums(imp.table1)

	imp.expenditures.table.w.no<-imp.dyn.expenditures.w.no.sub[,,n.period]
	imp.expenditures.table.w.yes<-imp.dyn.expenditures.w.yes.sub[,,n.period]
	imp.expenditures.table2<-imp.expenditures.table.w.yes[buyers.position.in.imp.dyn,-buyers.position.in.imp.dyn]
	imp.expenditures.table1<-imp.expenditures.table.w.no[buyers.position.in.imp.dyn,-buyers.position.in.imp.dyn]
	imp.expenditures.aggreg.monthly.war.yes[,n.period]<-rowSums(imp.expenditures.table2)
	imp.expenditures.aggreg.monthly.war.no[,n.period]<-rowSums(imp.expenditures.table1)
}

av.prices.neut<-imp.expenditures.aggreg.monthly.war.no/imp.aggreg.monthly.war.no
av.prices.nino<-imp.expenditures.aggreg.monthly.war.yes/imp.aggreg.monthly.war.yes

imp.aggreg.change.nino<-imp.aggreg.monthly.war.yes-imp.aggreg.monthly.war.no
imp.expenditures.aggreg.change.nino<-imp.expenditures.aggreg.monthly.war.yes-imp.expenditures.aggreg.monthly.war.no
av.prices.change.nino<-100*(av.prices.nino-av.prices.neut)/av.prices.neut

imp.aggreg.change.nino.demand.ratio<-imp.aggreg.change.nino

for(i in 1:ncol(imp.aggreg.change.nino)){
	imp.aggreg.change.nino.demand.ratio[,i]<-100*imp.aggreg.change.nino[,i]/buyers.monthly.demand.base.year
}
last.reliable.year<-2016
if(T){
write.table(round(av.prices.change.nino,digits=2),file=paste("change_monthly_price_war",last.reliable.year,".csv",sep=""),sep=",",quote=F,col.names=NA)
write.table(round(imp.aggreg.change.nino.demand.ratio,digits=2),file=paste("change_monthly_import_war",last.reliable.year,".csv",sep=""),sep=",",quote=F,col.names=NA)
}

