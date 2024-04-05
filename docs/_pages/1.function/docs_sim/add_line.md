---
title: add_line 
author: Ahmed Elkholy
layout: post
mermaid: true
category: Jekyll
order: 3
---
## `add_line` Function Documentation

The `add_line` function adds a Pi Section Line block to a Simulink model.

### Parameters

- `mdl`: The Simulink model where the block will be added.
- `name`: Name of the new Pi Section Line block.
- `posx`, `posy`: Position of the block within the model.
- `length`: Length of the transmission line (not currently used).
- `frequency`: Frequency of the transmission line.
- `R`: Resistance of the transmission line.
- `L`: Inductance of the transmission line.
- `C`: Capacitance of the transmission line.

### Example Usage

```matlab
add_line('MyModel', 'Line1', 100, 100, 50, 60e6, 0.1, 0.01, 1e-6);
```

This function constructs the name of the block as `mdl/name`, adds the Pi Section Line block from the Simscape Electrical library to `mdl`, sets its position, phases, frequency, resistance, inductance, and capacitance.

**Note:** Ensure that the Simscape Electrical library is available in your MATLAB environment.

### Function Code

```matlab
function add_line(mdl, name, posx, posy, length, frequency, R, L, C)
    % This function adds a line to the model (mdl) with the given parameters:
    % name - Name of the new line block
    % posx, posy - Position of the block
    % length - Length of the line (not currently used)
    % frequency - Frequency of the line
    % R - Resistance of the line
    % L - Inductance of the line
    % C - Capacitance of the line
    
    try
        % Check if the specified block already exists
        if bdIsLoaded(mdl) && any(strcmp(get_param(bdroot(mdl),'Blocks'), name))
            disp(['Block "', name, '" already exists in model "', mdl, '".']);
            return;
        end
        
        % Construct the full name of the block as mdl/name
        blockName = [mdl '/' name];
        
        % Add the Pi Section Line block from the Simscape Electrical library to mdl, naming the new block
        add_block('powerlib/Elements/Pi Section Line', blockName);
        
        % Set the position of the Pi Section Line block
        blockPosition = [posx-30, posy-30, posx+30, posy+30];
        set_param(blockName, 'Position', blockPosition);
        
        % Set the number of phases to make it a three-phase system
        set_param(blockName, 'Phases', '3');
        
        % Set the parameters of frequency, resistance, inductance, and capacitance
        set_param(blockName, 'Frequency', num2str(frequency));
        set_param(blockName, 'Resistance', num2str(R));
        set_param(blockName, 'Inductance', num2str(L));
        set_param(blockName, 'Capacitance', num2str(C));
    catch
        % Display a message if the block doesn't exist in the library
        disp('This function requires a Pi Section Line block from the Simscape Electrical library.');
        disp('Please make sure you are using MATLAB 2023 and have the required library.');
    end
end
```

Replace `"Your Name"` and `"Date"` in the documentation with your actual name and the creation/last modified date of the function.

