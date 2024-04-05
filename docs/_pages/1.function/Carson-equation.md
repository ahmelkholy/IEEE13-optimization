# Carson equations

The modelling of the DS system Transmission Line (TL) starts with the Carson paper [[@Carson1926]]. In this paper, wave propagation is used to create the model for the overhead transmission line. This paper uses image theory to calculate the impedance between the overhead conductor and the earth. According to the image theory, every conductor at a given elevation has an image conductor at the same elevation below ground [[@Carson1926]].

{Ciric2004} describes how the Carson equation in the distribution system

$$  
\bar{z}_{a u}=r_a+j 4 \pi \times 10^{-4} f \ln \left(\frac{2 h_a}{\mathrm{GMR}_a}\right) \Omega / \mathrm{km}  
$$ 

and the mutual impedance between phases $a$ and $b$ is

$$\bar{z}_{a b}=j 4 \pi \times 10^{-4} f \ln \left(\frac{\sqrt{d_{a b}^2+\left(h_a+h_b\right)^2}}{\sqrt{d_{a b}^2+\left(h_a-h_b\right)^2}}\right) \Omega / \mathrm{km}$$

where

$r_a$ is the resistance of the phase wire.

$h_a, h_b$ are the heights of the phase wire in meters.

$d_{ab}$ is the horizontal distance between the phases.

$GMR_a$ is the geometric mean radius of phase wire an in meters.


The limitation of the earth's conductivity was not taken into account by this methodology [[@Ciric2004]]. According to [[@Carson1926]] the earth is a solid that is infinite, uniform, and has a flat, uniform surface as well as a constant resistivity. Any end effects introduced at the neutral grounding points are ignored because they are unimportant at power frequencies. Further calculations and models for the impedance matrix were carried out in [[@Kersting2011]] but due to the small size of the integral, the basic equation[] will be the applicable in this study.

In recent years, the application of Carson's equation has become the standard for the computation of line impedance. Because Carson's equation results in an infinite series, approximations have been made to ease in the computation of the impedance. The purpose of this paper is to investigate some of the more common approximations and determine what, if any, errors are made [[@Kersting2011]]. 

## step to calculate the electrical model for the TL

the calculations is started by defining the TL geometry, then a matrix is constructed to calculate the the distances and the angles between the conductors as shown in figure, the third and the final step is applying the Carson equation to get the electrical model of the TL. 

the output of this equations is [[admittance-matrix]]