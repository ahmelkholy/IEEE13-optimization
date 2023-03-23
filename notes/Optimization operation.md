
# Optimization for the fact devices for operation


this file opti_dpflow.m is the main file that uses the objective function to get the operation values for UPC device

## intro

the idea of this optimization is calculating the device reaction according to the objective function. the device reaction is varying  according to the device type. 

this idea appears due to the simulation results that proves the unbalancing ratio effect the power losses, that means there is unbalancing conditions that makes the losses less than other unbalancing condition. so the objective of this optimization process is to identify this unbalancing ratio.

## Devices locations and the effects

1. the device at the bus 634 >> load at this bus only 6 values
2. the device at the bus 675  >> the loads at the 675 6 values 

## step to construct the optimization file

1. identify the loading conditions from the load profile
2. load the case study 
3. change the values of the bus data matrix to specific values
4. calculate the objective function

## the input matrix
$x=[P_{A1},P_{B1},P_{C1},Q_{A1},Q_{B1},Q_{C1},P_{A2},P_{B2},P_{C2},Q_{A2},Q_{B2},Q_{C2}]$

## the output matrix

is the value of the active and reactive power 

## Objective Function

The objective in this problem is is multi-objective function

1. the minimum power losses
2. the median of unbalancing coefficient
3. the voltage profile enhancement


### 24.12.22-20:14

- [x] this is to add the wight to losses less than others objective because the effect is very high 

### minimum power losses

## constrain for the optimization


### equality constrains
the apparent power is not exceed the loading conditions 
$\sum_{phase=1}^3 S_{phase}=S_{3\Phi}$

### inequality constrains
in this the inequality constrains will be introduced in form of the burden of the reactive power supplying to the system 

- [x] adding the inequality constrains after discussing with Elgbaly
- [x] the device can supply the system (must be defined)

## 26.12.22-15:07 results

this constrains the power losses and unbalancing coefficient for the system when the phase a is variable and phase b and c is equal.

In this optimization we have two way to do 

1. first one is changing the power of the phase A while phase p and c is equal to each others
2. the second one is changing all phase power but it takes time to reach the solution 
3. the device will moved to another place 

in four scenarios the results are introduced the power losses is decreased by smart controlling the UPC with GA 



the system used is IEEE 13 with phases excluded from the

to write about the results [[results-GA-UPC]]

- [x] about the system 
- [x] load cases and branch and power losses
- [ ] using the GA to smart controlling UPC 
- [ ] objective function and the constrains to operate the UPC 
- [ ] two variable is used to speed up the processing of the data
- [ ] total reactive power compensation and controlled reactive power
