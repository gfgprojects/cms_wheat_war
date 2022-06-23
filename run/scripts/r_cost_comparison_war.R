
year.of.interest<-2016
year.for.current.tick<-year.of.interest-1993  #used in file r_aggregate_import_dynamics.R

outputdir<-"../output/output_war_no"
source("r_source_for_comparison.R")
imp.dyn.w.no<-imp.dyn
source("r_sim_prices.R")
sessions.prices.w.no<-sessions.prices
source("r_import_expenditures.R")
imp.dyn.expenditures.w.no<-imp.dyn.expenditures
source("r_aggregate_import_dynamics.R")
imp.dyn.cum.w.no<-imp.dyn.cum
imp.dyn.expenditures.cum.w.no<-imp.dyn.expenditures.cum


outputdir<-"../output/output_war_yes"
source("r_source_for_comparison.R")
imp.dyn.w.yes<-imp.dyn
source("r_sim_prices.R")
sessions.prices.w.yes<-sessions.prices
source("r_import_expenditures.R")
imp.dyn.expenditures.w.yes<-imp.dyn.expenditures
source("r_aggregate_import_dynamics.R")
imp.dyn.cum.w.yes<-imp.dyn.cum
imp.dyn.expenditures.cum.w.yes<-imp.dyn.expenditures.cum

source("r_compute_import_change_monthly.R")
source("r_compute_import_change_aggregate.R")


