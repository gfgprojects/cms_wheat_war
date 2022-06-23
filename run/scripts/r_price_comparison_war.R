outputdir<-"../output/output_war_no"
source("r_sim_prices.R")
sessions.prices.w.no<-sessions.prices

outputdir<-"../output/output_war_yes"
source("r_sim_prices.R")
sessions.prices.w.yes<-sessions.prices

x<-seq(1991+1/24,2017+1/24,by=1/12)

#western europe
plot(x,100*(sessions.prices.w.yes[,12]/sessions.prices.w.no[,12]-1),type="l",xlim=c(2016,2017),ylab="percentage deviation",xlab="time")
points(x,100*(sessions.prices.w.yes[,12]/sessions.prices.w.no-1)[,12])
#usa
lines(x,100*(sessions.prices.w.yes[,11]/sessions.prices.w.no[,11]-1),col=2)
points(x,100*(sessions.prices.w.yes[,11]/sessions.prices.w.no[,11]-1),col=2)
#oceania
lines(x,100*(sessions.prices.w.yes[,7]/sessions.prices.w.no[,7]-1),col="green")
points(x,100*(sessions.prices.w.yes[,7]/sessions.prices.w.no[,7]-1),col="green")
#northern america
lines(x,100*(sessions.prices.w.yes[,5]/sessions.prices.w.no[,5]-1),col="blue")
points(x,100*(sessions.prices.w.yes[,5]/sessions.prices.w.no[,5]-1),col="blue")
grid(col="grey10")
legend(2016,100,c("Western Europe","USA","Oceania","Canada"),lty=1,bty="n",col=c("black","red","green","blue"))

