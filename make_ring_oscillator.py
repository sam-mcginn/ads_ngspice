#!/usr/bin/python3
from random import gauss

# define variables
lw_tolerance = 0.15
std_dev_lw = 0.065
toxe_tolerance = 0.1
std_dev_toxe = 0.05
num_oscillator = 6

def get_random(std_dev, tolerance):
    x = 0.0
    while not ((1.0-tolerance) <= x <= (1.0+tolerance)):
        x = gauss(1.0, std_dev)
        
    return x

print('* ring_oscillator_{X}'.format(X=num_oscillator))

print('.subckt ring_oscillator_{X} enable n12'.format(X=num_oscillator))
print('.include nand2.sp')
print('.include inverter.sp')

# print stuff for the NAND gate
print('x0 enable n12 n0 nand2')

# generate inverters
# parameters: d_LP, d_WP, d_TOXEP, d_LN, d_WN, d_TOXEN
fmt = "x{j} n{i} n{j} inverter " \
    "d_LP={d_LP} d_WP={d_WP} d_LN={d_LN} d_WN={d_WN} " \
    "d_TOXEP={d_TOXEP} d_TOXEN={d_TOXEN}"
    
for i,j in enumerate(range(1, 13)):
    d_LP = get_random(std_dev_lw, lw_tolerance)
    d_WP = get_random(std_dev_lw, lw_tolerance)
    d_LN = get_random(std_dev_lw, lw_tolerance)
    d_WN = get_random(std_dev_lw, lw_tolerance)
    
    d_TOXEP = get_random(std_dev_toxe, toxe_tolerance)
    d_TOXEN = get_random(std_dev_toxe, toxe_tolerance)
    
    print(fmt.format(i=i, j=i+1, d_LP=d_LP, d_WP=d_WP, d_LN=d_LN, d_WN=d_WN, d_TOXEP=d_TOXEP, d_TOXEN=d_TOXEN)) 
    
print('.ends ring_oscillator_{X}\n'.format(X=num_oscillator))
