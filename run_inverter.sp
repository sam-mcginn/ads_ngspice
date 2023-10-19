* run_inverter
.include inverter.sp

* supply
.global vdd vss
V0 vdd vss dc 1.2v
V1 vss 0 0

* inverter instance
x1 in out inverter
+ d_LP=65n d_WP=215n d_TOXEP=1.95n
+ d_LN=65n d_WN=130n d_TOXEN=1.85n

* voltage on the input
Vin in 0 0

* DC sweep on Vin
.dc Vin 0v 1.2v 0.01v

.control
* simulation control block
run
* plot input and output
plot in out
.endc
.end

