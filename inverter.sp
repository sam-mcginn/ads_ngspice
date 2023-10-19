* inverter

.subckt inverter in out
+ params:
+ d_LP=1 d_WP=1 d_TOXEP=1
+ d_LN=1 d_WN=1 d_TOXEN=1

M1 out in vdd vdd tp L={d_LP * 65n} W={d_WP * 215n}
+ AS=75.3f AD=65.3f PS=1.23u PD=1.23u

M2 out in vss vss tn L={d_LN * 65n} W={d_WN * 130n}
+ AS=75.3f AD=75.3f PS=1.12u PD=1.23u

* BSIM 4.8.2 models
.model tp pmos level=54 version=4.8.1 TOXE={d_TOXEP * 1.95n}
.model tn nmos level=54 version=4.8.1 TOXE={d_TOXEN * 1.85n}

.ends inverter

