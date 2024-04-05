# Documentation for `rn_st_simulink` Function

## Function Signature

```matlab
function simOut = rn_st_simulink(simulinkFilePath, startTime, pauseTime, stopTime, paramFunc)
```

## Function Code

```matlab
function simOut = rn_st_simulink(simulinkFilePath, startTime, pauseTime, stopTime, paramFunc)
    % Load the model into memory
    load_system(simulinkFilePath);
    
    % Get the model name from the file path
    [~, mdl, ~] = fileparts(simulinkFilePath);
    
    % Set parameters for saving final state
    set_param(mdl, 'SaveFinalState', 'on', 'FinalStateName','SimState','SaveCompleteFinalSimState', 'on')
    
    % Run simulation for first interval
    simOut_1 = sim(mdl, [startTime pauseTime]);
    
    %% continue tomorrow
    simOut_1_var = createVariables(simOut_1, 'regular');
    
    % Insert new Simulink parameters
    paramFunc(simOut_1_var);
    
    % Update the model with new parameters
    set_param(mdl, 'SimulationCommand', 'update');
    
    % Run a short simulation to capture new operating point
    simOut_new = sim(mdl, [startTime pauseTime]);
    
    % Set parameters for loading initial state
    set_param(mdl, 'LoadInitialState', 'on', 'InitialState','simOut_new.SimState');
    
    % Run simulation for second interval
    simOut_2 = sim(mdl, [pauseTime stopTime]);
    
    % Reset initial state loading parameter
    set_param(mdl, 'LoadInitialState', 'off');
    
    simOut = createVariablesConcat(simOut_1, simOut_2, 'regular');
end
```

## Description

This function runs a Simulink model for two intervals with a pause in between to update the model parameters.

## Parameters

- `simulinkFilePath` (string): The file path to the Simulink model.
- `startTime` (double): The start time of the simulation.
- `pauseTime` (double): The time at which the simulation is paused to update the model parameters.
- `stopTime` (double): The stop time of the simulation.
- `paramFunc` (function handle): A function that updates the model parameters. This function should take one argument: the output of the first interval of the simulation.

## Returns

- `simOut` (struct): The output of the simulation. This is a structure that contains the concatenated outputs of the two intervals of the simulation.

## Example for `paramFunc`

```matlab
function paramFunc(simOut_1_var)
    % calculate the power voltage for upc inductance equations
    [p_curve_bus_1,q_curve_bus_1] = dis_power(simOut_1_var.V_1, simOut_1_var.I_1, F, Ts);
    [~, v_curve_bus_1] = rms_value(simOut_1_var.V_1, F, Ts);

    % transform those curves to number
    E_phase_a=mean(v_curve_bus_1(:,1));
    E_phase_b=mean(v_curve_bus_1(:,2));
    E_phase_c=mean(v_curve_bus_1(:,3));

    p_na=mean(p_curve_bus_1(:,1));
    p_nb=mean(p_curve_bus_1(:,2));
    p_nc=mean(p_curve_bus_1(:,3));

    q_na=-1*mean(q_curve_bus_1(:,1));
    q_nb=-1*mean(q_curve_bus_1(:,2));
    q_nc=-1*mean(q_curve_bus_1(:,3));
end

simOut = rn_st_simulink('path_to_your_simulink_file', 0, 0.2, 1, @paramFunc);
```

In this example, `paramFunc` is a function that updates the model parameters. It should be defined in your MATLAB workspace.

---
