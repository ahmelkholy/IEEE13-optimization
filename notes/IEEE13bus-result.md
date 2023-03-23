## adding the device (UPC) to the buses
the results before adding UPC

### Adding to bus 633
that's meaning the load at 634 will be balanced 
active power=[0.1600000000    0.1200000000    0.1200000000]
total active power will be 0.4 the power per phase 0.13
reactive power=[0.1100000000    0.0900000000    0.0900000000]
the total reactive power is 0.29 the power per phase 0.0967

### adding to bus 692

That's meaning the load at bus 675 will be balanced
that's meaning the load at bus 692 will be balanced
note. The line between the bus 692 to 675 >>> this line is not changed 

## important note the capacitor banks has been added as capacitance in the line B11, B22, B33

# 08.12.22-15:39

In this day the device will be added in the bus 633 and the power losses and the power supplied from the load are calculated.

The voltage profile will be drawn to show the difference.

## Writing to do

- [x] IEEE 13 bus system
- [ ] method of unbalancing improvements
- [x] Results at three scenarios 
	- [x] losses reduction
	- [x] voltage profile improvements >> unbalancing coefficient in every bus can be calculated to show the enhancement over all grid 
- [ ] check the results in the scenario three and four

## SVC @ the same buses

this device will be modeled as reactive power compensation in the same bus using reduction in the load 

## AC voltage regulator @ the same buses

this device can realize by adding new transformer with creating new bus 


# defining the rating of the UPC

the objective of the part is defining the rating of the UPC to use it in the economical study

## notes in the results
the results on the scenario 3 is better than scenario 4  however the scenario 4 is the scenario where the load at bus 634 is balanced.

This is because the loading at 632 is b-c there is no a, where the bus at 634 the load at phase a is higher than b and c, so this enhanced the overall unbalancing ratio is enhanced.  

## Introduction

The device is responsible for supplementing the negative and zero sequence in the DS, so to define the [[UPC-rating]]. The supplying current and the operating voltage must be identified by the load flow program, to do so, scenario is creating.

The device is installed in the DS to device the supplying current and operating voltage must be calculated, the supplying the current calculated by converting the unbalanced current of the load and removing the positive component, and getting the phases current again, because this device supplying the negative and zero component to balance the load. While the operating voltage can be calculated by knowing the voltage at the buses after balanced the load.

## Step for calculating the rating of the reactive power

- [ ] define the max loading percent by defining the unbalancing ratio equal to 10 %
- [ ] removing the positive component 
- [ ] creating the phases currents again after removing the positive component
- [ ] unbalancing the load 
- [ ] calculate the balancing voltage 
- [ ] defining the rating by the calculated voltages and currents


# 16.12.22-16:20 Result

## upc
this device is installed on two  location in the IEEE13 bus system and four scenarios is created as the following 

1. the original system without adding any device 
2. the second scenario is installing the device at bus 633
3. the third scenario is installing the device at bus 692
4. the fourth scenario is installing the device at two buses 633 and 692 




device =

    'upc'


total_active_losses_1 =

   1.4651e+04


total_reactive_losses_1 =

   1.4860e+04


total_active_losses_2 =

   1.4650e+04


total_reactive_losses_2 =

   1.4859e+04


total_active_losses_3 =

   1.4640e+04


total_reactive_losses_3 =

   1.4833e+04


total_active_losses_4 =

   1.4640e+04


total_reactive_losses_4 =

   1.4834e+04
	
![[fig-UPCOPSIM/png/f4-1.png]]

## SVC

this device is installed on two location in the IEEE13 bus system and four scenarios is created as the following

1. the original system without adding any device 
2. the second scenario is installing the device at bus 633
3. the third scenario is installing the device at bus 692
4. the fourth scenario is installing the device at two buses 633 and 692 

device =

    'svc'


total_active_losses_1 =

   1.4651e+04


total_reactive_losses_1 =

   1.4860e+04


total_active_losses_2 =

   1.4646e+04


total_reactive_losses_2 =

   1.4847e+04


total_active_losses_3 =

   1.4647e+04


total_reactive_losses_3 =

   1.4841e+04


total_active_losses_4 =

   1.4643e+04


total_reactive_losses_4 =

   1.4829e+04

![[fig-UPCOPSIM/png/f5-1.png]]

## upc_svc
in this section the results of the adding device can do both of two jobs balancing and compensating the reactive power at the same time 

1. the original system without adding any device 
2. the second scenario is installing the device at bus 633
3. the third scenario is installing the device at bus 692
4. the fourth scenario is installing the device at two buses 633 and 692 


device =

    'upc_svc'


total_active_losses_1 =

   1.4651e+04


total_reactive_losses_1 =

   1.4860e+04


total_active_losses_2 =

   1.4646e+04


total_reactive_losses_2 =

   1.4847e+04


total_active_losses_3 =

   1.4639e+04


total_reactive_losses_3 =

   1.4830e+04


total_active_losses_4 =

   1.4639e+04


total_reactive_losses_4 =

   1.4829e+04

![[fig-UPCOPSIM/png/f6-1.png]]

## Booster
in this section the results of the adding device can do both of two jobs balancing and compensating the reactive power at the same time 

1. the original system without adding any device 
2. the second scenario is installing the device at bus 633
3. the third scenario is installing the device at bus 692
4. the fourth scenario is installing the device at two buses 633 and 692 


device =

    'booster'


total_active_losses_1 =

   1.4651e+04


total_reactive_losses_1 =

   1.4860e+04


total_active_losses_2 =

   1.4686e+04


total_reactive_losses_2 =

   1.4952e+04


total_active_losses_3 =

   1.4653e+04


total_reactive_losses_3 =

   1.4860e+04


total_active_losses_4 =

   1.4685e+04


total_reactive_losses_4 =

   1.4930e+04

![[fig-UPCOPSIM/png/f7-temp.png]]