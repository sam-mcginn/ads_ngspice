* NAND gate

.subckt nand2 a b out
+ params:
+ d_LP=65n d_WP=215n d_TOXEP=1.95n
+ d_LN=65n d_WN=130n d_TOXEN=1.85n

* Syntax: Name drain gate source body model_name
* + <parameters>
M1 out b vdd vdd tp L={d_LP} W={d_WP}
+ AS=75.3f AD=65.3f PS=1.23u PD=1.23u

M2 out a vdd vdd tp L={d_LP} W={d_WP}
+ AS=75.3f AD=65.3f PS=1.23u PD=1.23u

M3 out a n0 vss tn L={d_LN} W={d_WN}
+ AS=75.3f AD=75.3f PS=1.12u PD=1.23u

M4 n0 b vss vss tn L={d_LN} W={d_WN}
+ AS=75.3f AD=75.3f PS=1.12u PD=1.23u


* BSIM 4.8.2 models
.model tp pmos level=54 version=4.8.1 TOXE={d_TOXEP}
.model tn nmos level=54 version=4.8.1 TOXE={d_TOXEN}

.ends

