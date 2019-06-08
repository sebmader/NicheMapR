% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trans_behav.R
\encoding{UTF-8}
\name{trans_behav}
\alias{trans_behav}
\title{trans_behav - thermoregulatory model using a transient heat budget}
\usage{
trans_behav(t = seq(1, 60), Tc_init = rep(20, 60), Ts_init = Tc_init
  + 0.1, To_init = Tc_init + 0.2, Ww_g = 500, T_F_min = 33,
  T_F_max = 38, T_B_min = 25, CT_max = 43, rho_body = 932,
  x_shell = 0.001, lump = 1, q = 0, c_body = 3073,
  c_body_inner = c_body, c_body_outer = c_body, k_flesh = 0.5,
  k_inner = k_flesh, k_outer = k_flesh, emis = 0.95, alpha = 0.85,
  geom = 2, shape_b = 1/5, shape_c = 1/5, shape_coefs = c(10.4713,
  0.688, 0.425, 0.85, 3.798, 0.683, 0.694, 0.743), posture = "n",
  orient = 1, fatosk = 0.4, fatosb = 0.4, alpha_sub = 0.2,
  pctdif = 0.1, shade = 90, metout = metout, shadmet = shadmet,
  soil = soil, shadsoil = shadsoil, press = 101325)
}
\arguments{
\item{t}{time intervals (s) at which output is required}

\item{Tc_init}{= Tairf(1), initial temperature (°C) Organism shape, 0-5, Determines whether standard or custom shapes/surface area/volume relationships are used: 0=plate, 1=cyl, 2=ellips, 3=lizard (desert iguana), 4=frog (leopard frog), 5=custom (see details)}

\item{Ts_init}{= Tc_init + 0.1, initial shell temperature (°C)}

\item{To_init}{= Tc_init + 0.2, initial surface temperature (°C)}

\item{Ww_g}{= 500, weight (g)}

\item{T_F_min}{= 33, # minimum foraging body temperature threshold (°C)}

\item{T_F_max}{= 38, # maximum foraging body temperature threshold (°C)}

\item{T_B_min}{= 25, # basking body temperature threshold (°C)}

\item{CT_max}{= 43, # critical thermal maximum (°C)}

\item{rho_body}{= 932, animal density (kg/m3)}

\item{x_shell}{= 0.001, shell thickness, m}

\item{lump}{= 1, one lump (1) or two lump (2) model?}

\item{q}{= 0, metabolic rate (W/m3)}

\item{c_body}{= 3073, specific heat of flesh (J/kg-°C)}

\item{c_body_inner}{= c_body, Specific heat of flesh J/(kg-°C)}

\item{c_body_outer}{= c_body, Specific heat of outer shell J/(kg-°C)}

\item{k_flesh}{= 0.5, conductivity of flesh (W/m-K)}

\item{k_inner}{= k_flesh, Thermal conductivity of inner shell (W/m-K, range: 0.412-2.8)}

\item{k_outer}{= k_flesh, Thermal conductivity of outer shell (W/m-K, range: 0.412-2.8)}

\item{emis}{= 0.95, emissivity of skin (-)}

\item{alpha}{= 0.85, animal solar absorptivity (-)}

\item{geom}{= 2, Organism shape, 0-5, Determines whether standard or custom shapes/surface area/volume relationships are used: 0=plate, 1=cyl, 2=ellips, 3=lizard (desert iguana), 4=frog (leopard frog), 5=custom (see parameter 'shape_coeffs')}

\item{shape_b}{= 1/5, Proportionality factor (-) for going from volume to area, represents ratio of width:height for a plate, length:diameter for cylinder, b axis:a axis for ellipsoid}

\item{shape_c}{= 1/5, Proportionality factor (-) for going from volume to area, represents ratio of length:height for a plate, c axis:a axis for ellipsoid}

\item{shape_coefs}{= c(10.4713,.688,0.425,0.85,3.798,.683,0.694,.743), Custom surface area coefficients. Operates if posture = 5, and consists of 4 pairs of values representing the parameters a and b of a relationship AREA=a*Ww_g^b, where AREA is in cm2 and Ww_g is in g. The first pair are a and b for total surface area, then a and b for ventral area, then for sillhouette area normal to the sun, then sillhouette area perpendicular to the sun}

\item{posture}{= 'n', pointing normal 'n' or parallel 'p' to the sun's rays, or average 'a'?}

\item{orient}{= 1, does the object orient toward the sun? (0,1)}

\item{fatosk}{= 0.4, solar configuration factor to sky (-)}

\item{fatosb}{= 0.4, solar configuration factor to substrate (-)}

\item{alpha_sub}{= 0.2, substrate solar reflectivity, decimal percent}

\item{pctdif}{= 0.1, proportion of solar energy that is diffuse (rather than direct beam)}

\item{shade}{= 90, maximum shade level (%)}

\item{metout}{= metout, aboveground minimum shade microclimate output table from NicheMapR's microclimate model}

\item{shadmet}{= shadmet, metout, aboveground maximum shademicroclimate output table from NicheMapR's microclimate model}

\item{soil}{= soil, minimum shade soil temperature output table from NicheMapR's microclimate model}

\item{shadsoil}{= shadsoil, maximum shade soil temperature output table from NicheMapR's microclimate model}

\item{press}{air pressure (Pa)

\strong{Outputs:}

day_results variables:
\itemize{
\item 1 time - time (hours)
\item 2 hour - hour of day (rounded to nearest hour)
\item 3 T_air_shd - shaded air temperature at animal height  (°C)
\item 4 Tb - body temperature of thermoregulating animal (°C)
\item 5 Tb_final - steady state temperature in current environment (°C)
\item 6 Tb_open - body temperature of animal staying in the open (°C)
\item 7 Te_open  - operative temperature (zero heat capacity) of animal in open (°C)
\item 8 time_constant - time constant of animal (minutes)
\item 9 dTb_dt - rate of change of body temperature (°C / minute)
\item 10 posture - posture of animal ('n' = normal to sun's rays, 'p' = parallel to sun's rays , 'f' = foraging posture)
\item 11 active - is the animal inactive (0) or active (1)?
\item 12 state - activity state (0 = sleeping, 1 = basking, 2 = foraging in open, 3 = cooling in shade)
\item 13 mrate - total metabolic rate for time step (J)
}

act_window variables:
\itemize{
\item 1 time - time (hours)
\item 2 forage_sun - total foraging time in sun for this hour (minutes)
\item 3 max_bout_shd - maximum foraging bout in sun for this hour (minutes)
\item 4 forage_shd - total foraging time in shade for this hour (minutes)
\item 5 max_bout_shd - maximum foraging bout in shade for this hour (minutes)
}

sum_stats variables:
\itemize{
\item 1 loc - location of simulation (longitude, latitude, decimal degrees)
\item 2 Ww_g - wet weight of animal (g)
\item 3 T_F_min - minimum foraging temperature (°C)
\item 4 T_F_max - maximum foraging temperature (°C)
\item 5 max_bout_sun - longest foraging bout in sun (minutes)
\item 6 max_bout_shd - longest foraging bout in shade (minutes)
\item 7 sum_activity_sun - total activity in sun (minutes)
\item 8 sum_activity_shd - total activity in shade (minutes)
\item 9 bouts_sun - total number of foraging bouts in sun (#)
\item 10 bouts_shd - total number of foraging bouts in shade (#)
\item 11 morning_bask - morning basking time (minutes)
\item 12 morning_forage_sun - first foraging bout length in sun (minutes)
\item 13 morning_forage_shd - first foraging bout length in shade (minutes)
\item 14 first_midday_bout_sun - second foraging bout length in sun (minutes)
\item 15 first_midday_bout_shd - second foraging bout length in shade (minutes)
\item 16 mean_midday_bout_shd - average length of foraging bouts between the first and last foraging bouts in sun (mins)
\item 17 mean_midday_bout_sun - average length of foraging bouts between the first and last foraging bouts in shade (mins)
\item 18 afternoon_forage_sun - last foraging bout length in sun (minutes)
\item 19 afternoon_forage_shd - last foraging bout length in shade (minutes)
\item 20 mrate_sum - cumulative metabolic rate (kJ)
\item 21 mrate_sum_inactive_sun - cumulative metabolic rate while inactive, sun forager (kJ)
\item 22 mrate_sum_inactive_shd - cumulative metabolic rate while inactive, shade forager (kJ)
\item 23 mrate_sum_active_sun - cumulative metabolic rate while active in sun (kJ)
\item 24 mrate_sum_active_shd - cumulative metabolic rate while active in shade (kJ)
\item 25 T_F_max_time_Te - time operative temperature in open spent above maximum foraging temperature (minutes)
\item 26 CT_max_time_Te - time operative temperature in open spent above critical thermal maximum (minutes)
\item 27 T_F_max_time_Tb_open - time body temperature in open spent above maximum foraging temperature (minutes)
\item 28 CT_max_time_Tb_open - time body temperature in open spent above critical thermal maximum (minutes)
\item 29 T_F_maxtime - time body temperature of thermoregulating animal spent above maximum foraging temperature (minutes)
\item 30 CT_max_time - time body temperature of thermoregulating animal spent above critical thermal maximum (minutes)
\item 31 max_Tb_open - maximum body temperature in open (°C)
\item 32 min_Tb_open - minimum body temperature in open (°C)
\item 33 max_Te - maximum operative temperature in open (°C)
\item 34 min_Te - minimum operative temperature in open (°C)
\item 35 max_Tb - maximum body temperature of thermoregulating animal (°C)
\item 36 min_Tb - minimum body temperature of thermoregulating animal (°C)
}}
}
\description{
This model uses the transient heat budget models (i.e. accounting for heat storage and
hence lag-effects of body size) to simulate thermoregulatory behaviour of a diurnally active
ectotherm. It uses a set of events to break out of the ordinary differential
equation solver of the transient heat budget (onelump_var or twolump functions) to simulate
thermoregulation around setpoints, specifically the transition from sitting in the shade
overnight to basking in the sun perpendicular to the sun's rays (T_B_min), from basking to
foraging in the open in an 'average' posture (T_F_min), from foraging in the open to moving into
the shade (T_F_max), and then transitioning to basking in the afternoon and finally retreating
to the shade for the evening. It also computes the operative temperature (Te) of a
non-thermoregulating animal in the open, i.e. the steady state body temperature the animal would
come to if it had zero heat capacity, and the body temperature of a non thermoregulating animal
in the open accounting for the effect of thermal mass. The function computes a series of
summary statistics about the length of basking and foraging bouts, activity time, time spent
above high temperature thresholds (T_F_max and CT_max), and the extremes of body temperature.
}