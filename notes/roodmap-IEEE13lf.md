Roadmap

# titles


Design and management for the operation of the UPC based on AI for unsymmetrical three phase distribution system 

Real time operation tool for optimal management of UPC for distribution system

unbalancing device to enhance the distribution system performance considJrign the loading uncertainty

adaptive management and Design for unbalancing device to enhance power quality and decrease the power losses

Artificial inelegance(AI) based management and design for unbalancing device to enhance the power quality and decrease the power losses

# paper objective

1. Design - chose the rating of the device 
2. operation - chose the operating points for the installed device to enhance the system performance according to objective 


# work step

- [x] find the load profile for every phase for every load - the load profile is created by random form between 0 and 1
- [ ] find the rating of the installed device
    + [ ] find the $k_{Un}$ for every hour 
    + [ ] find the loading at the max $k_{Un}$
    + [ ] determine the rating of the device
- [X] at every hour find the operating point of the device
    + [X] GA run every hour
    + [ ] flow chart management
    + [ ] signal processing

# headings

- [x]  introduction
- [x] principle of operation 
    + [ ] science
    + [ ] practical implementation
- [x] system description
    + [x] ieee 13 bus
    + [x] Design >> device is 0.8 of the load
- [ ] methodology
    + [ ] management
    + [x] optimization
- [ ] case study and results
- [ ] assessment and economics
- [ ] conclusions

# Future idea

the role of the UPC to enhance the contingency of the DS because from the results of [[roodmap-IEEE13lf]] we found that the device works great in case of high loading condition 

protection effect of using the [[roodmap-IEEE13lf |UPC]] in the DS system 

how to assess the effect of the [[roodmap-IEEE13lf |UPC]] in the DS as reliability and protection enhancements



Rating of the [[roodmap-IEEE13lf |UPC]] in the DS Roadmap Roadmap
1. for balancing only without Reactive power compensation 

this device will compensation the negative and zero component 

    1. load flow at a certain load 24 worse condition
    2. the calculate the currents in the grid $I_a,I_b,I_c$
    3. calculate the positive and negative and zero component for load
    4. Negative an zero is the output currents of the device 
    5. from those components we can can calculate the output currents in $I_a,I_b,I_c$
    6. calculate the apparent power of each device phase then algebraic summation

2. for balancing and Reactive power compensation 

this device will compensation apart of positive component related to reactive power, besides the negative and zero component hint(no.4)

    1. load flow at a certain load 24 worse condition
    2. the calculate the currents in the grid $I_a,I_b,I_c$
    3. calculate the positive and negative and zero component for load
    4. the device has three currents, $I_{p.REactive}=abs{I_{positive}}*sin(\theta_v-\theta_i)$, $I_{negative}$, $I_{zero}$
    5. From those components we can can calculate the output currents in $I_a,I_b,I_c$
    6. calculate the apparent power of each device phase then algebraic summation

3. another way to calculate the device rating

this 

    1. define SCR of the system 
    2. define m the ratio between the loading and short circuit power
    3. define the $p_{rating}$ and $q_{rating}$ 
    4. then draw the curve for defining the $k_{Un}$
    5. define the max $k_{Un}$
    6. define the currents and the voltages
    7. define the rating of the device
