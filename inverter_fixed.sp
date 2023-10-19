* inverter

.subckt inverter in out

M1 out in vdd vdd tp L=65n W=130n
+ AS=75.3f AD=65.3f PS=1.23u PD=1.23u

M2 out in vss vss tn L=65n W=130n
+ AS=75.3f AD=75.3f PS=1.12u PD=1.23u

* BSIM 4.8.2 models
.model tp pmos level=54 version=4.8.1 TOXE=1.95n
.model tn nmos level=54 version=4.8.1 TOXE=1.85n

.ends inverter
