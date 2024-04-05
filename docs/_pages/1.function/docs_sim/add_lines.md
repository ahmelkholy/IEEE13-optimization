Sure! Here's a markdown documentation for the add_lines function:

# add_lines Function Documentation

The `add_lines` function is used to add lines to a Simulink model based on data provided in CSV files.

## Function Signature


matlab
function add_lines(mdl, lines_csv, cordinates_csv, config_folder)

## Parameters

- `mdl` (string): The name of the Simulink model to which the lines will be added.
- `lines_csv` (string): The path to the CSV file containing the lines data.
- `cordinates_csv` (string): The path to the CSV file containing the coordinates data.
- `config_folder` (string): The path to the folder containing the configuration files.

## Usage

To use the `add_lines` function, follow these steps:

1. Provide the name of the Simulink model (`mdl`).
2. Specify the path to the CSV file containing the lines data (`lines_csv`).
3. Specify the path to the CSV file containing the coordinates data (`cordinates_csv`).
4. Provide the path to the folder containing the configuration files (`config_folder`).

## CSV File Format

The lines data CSV file should have the following columns:

1. From bus
2. To bus
3. Length (in miles)
4. Configuration number
5. Base Kv

The coordinates data CSV file should have the following columns:

1. X-coordinate
2. Y-coordinate

## Configuration Files

The configuration files should be named in the format `config_<config_number>.csv` and should contain the following columns:

1. Resistance for the first phase
2. Reactance for the first phase
3. Resistance for the second phase
4. Reactance for the second phase
5. Resistance for the third phase
6. Reactance for the third phase
7. B1
8. B2
9. B3

## Unit Conversion

The function performs unit conversion for the following constants:

- Miles to kilometers: `mi2km = 1.60934`
- Feet to kilometers: `ft2km = 0.0003048`
- Microsiemens to Farads: `ms2F = 1/2/pi/60*1e-6`

## Example

matlab
mdl = 'my_model';
lines_csv = 'lines_data.csv';
cordinates_csv = 'coordinates_data.csv';
config_folder = 'configurations';

add_lines(mdl, lines_csv, cordinates_csv, config_folder);

This example adds lines to the Simulink model `my_model` using the lines data from `lines_data.csv`, coordinates data from `coordinates_data.csv`, and configuration files from the `configurations` folder.


Remember to replace the file paths and model name with your own data.

That's it! You can now use the `add_lines` function to add lines to your Simulink model based on the provided data.

Feel free to modify the documentation as needed to fit your specific documentation website format.