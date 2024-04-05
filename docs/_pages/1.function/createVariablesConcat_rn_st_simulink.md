# Function Documentation for `createVariablesConcat_rn_st_simulink`

## Description

The `createVariablesConcat_rn_st_simulink` function concatenates variables from multiple Simulink logsout datasets. It creates a new struct `new` that contains variables named after the block path of each signal in the logsout dataset of the simulation outputs in `out`. The data values of each signal are converted to a timetable object or a regular matrix/cell array, depending on the value of `outputFormat`, and assigned to the corresponding variable in the new struct. If `outputFormat` is 'regular', a separate variable named 'Time' is also created and assigned the time values of the signals.

This function first calls `createVariables` for each simulation output to create variables, and then concatenates the time and data values of each variable to create a continuous time series.

## Example

Run your Simulink model twice and get the simulation outputs:

```matlab
out.simOut_1 = sim('your_model','ReturnWorkspaceOutputs','on');
out.simOut_2 = sim('your_model','ReturnWorkspaceOutputs','on');
```

Call the `createVariablesConcat_rn_st_simulink` function with the simulation outputs and desired output format as inputs:

```matlab
new = createVariablesConcat_rn_st_simulink(out, 'timetable');
```

or

```matlab
new = createVariablesConcat_rn_st_simulink(out, 'regular');
```

Access the variables in the new struct:

```matlab
data = new.i_1;
```

## See Also

- [SIM](https://www.mathworks.com/help/simulink/slref/sim.html)
- [TIMETABLE](https://www.mathworks.com/help/matlab/ref/timetable.html)

