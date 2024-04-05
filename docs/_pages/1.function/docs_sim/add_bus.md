
## `add_bus` Function Documentation

The `add_bus` function adds a bus measurement block to a Simulink model.

### Parameters

- `mdl`: The Simulink model where the block will be added.
- `name`: Name of the new bus measurement block.
- `posx`, `posy`: Position of the block within the model.

### Example Usage

```matlab
add_bus('MyModel', 'Bus1', 100, 100);
```

This function constructs the name of the block as `mdl/name`, adds the bus measurement block from the Simscape Electrical library to `mdl`, sets its position, and enables voltage and current measurement labels.

**Note:** Ensure that the Simscape Electrical library is available in your MATLAB environment.

### Function Code

```matlab
function add_bus(mdl, name, posx, posy)
    % ADD_BUS Adds a bus measurement block to a Simulink model.
    %
    % ... (same content as above)
    % ...
end
```

Replace `"Your Name"` and `"Date"` in the documentation with your actual name and the creation/last modified date of the function.