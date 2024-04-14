# add_ind_transformer Function Documentation

The `add_ind_transformer` function is used to add a transformer to a Simulink model.

## Function Signature

```matlab
function add_ind_transformer(mdl, name, posx, posy, params, fbus, tbus)
```

## Parameters

- `mdl` (string): The name of the Simulink model to which the transformer will be added.
- `name` (string): The name of the transformer block to be added.
- `posx` (double): The x-coordinate for the position of the transformer block.
- `posy` (double): The y-coordinate for the position of the transformer block.
- `params` (structure): A structure containing the following fields:
 - `Winding1Connection`: Connection type for the first winding.
 - `Winding2Connection`: Connection type for the second winding.
- `fbus` (integer): The "from" bus number.
- `tbus` (integer): The "to" bus number.

## Usage

To use the `add_ind_transformer` function, follow these steps:

1. Provide the name of the Simulink model (`mdl`).
2. Specify the name of the transformer block (`name`).
3. Specify the x and y coordinates for the position of the transformer block (`posx`, `posy`).
4. Provide a structure (`params`) containing the connection types for the windings.
5. Specify the "from" and "to" bus numbers (`fbus`, `tbus`).

## Example

```matlab
mdl = 'myModel';
name = 'TR_1_2';
posx = 100;
posy = 200;
params = struct('Winding1Connection', {'D11'}, 'Winding2Connection', {'Y'});
fbus = 1;
tbus = 2;

add_ind_transformer(mdl, name, posx, posy, params, fbus, tbus);
```

This example adds a transformer named `TR_1_2` to the Simulink model `myModel`, positioned at (100, 200), with the specified connection types for the windings and bus numbers.

## Note

The function checks if the specified block already exists in the model. If it does, the function displays a message and returns without adding the block.

Remember to replace the model name, transformer name, coordinates, and bus numbers with your own data.

That's it! You can now use the `add_ind_transformer` function to add transformers to your Simulink model based on the provided data.

Feel free to modify the documentation as needed to fit your specific documentation website format.
