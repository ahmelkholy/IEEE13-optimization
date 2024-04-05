# Cons_trof Function Documentation

This function constructs the `trof` matrix based on input trof data from a CSV file. The `trof` matrix contains information about transformer connections, impedance, and other parameters.

## Syntax

```matlab
trof = Cons_trof(trof_csv, baseMVA, save_as_csv)
```

### Inputs

- `trof_csv` (string): The path to the input CSV file containing trof data.
- `baseMVA` (double): The new base MVA value.
- `save_as_csv` (int, optional): If set to 1, the `trof` matrix will be saved as a CSV file.

### Outputs

- `trof` (double matrix): The resulting `trof` matrix containing information about transformer connections, impedance, and other parameters.

## Description

The function takes in trof data from a CSV file, processes it, and constructs the `trof` matrix. The trof data includes information about transformer connections (e.g., Yg-Yg, D-D), R% and X%, and other parameters. The trof matrix is constructed based on this data, and optionally, it can be saved as a CSV file.

## Connection Types

The connection types are defined as follows:

- `Yg-Yg`: Yg-Yg connection
- `D-Yg`: D-Yg connection
- `Yg-D`: Yg-D connection
- `D-D`: D-D connection
- `Y-Y`: Y-Y connection
- `Y-D`: Y-D connection
- `D-Y`: D-Y connection

## Example Usage

```matlab
trof_csv = 'trof_data.csv';
baseMVA = 100; % Set the base MVA value
save_as_csv = 1; % Save the trof matrix as CSV
trof = Cons_trof(trof_csv, baseMVA, save_as_csv);
```

## Notes

- The `basekva` values in the CSV file are used to convert R% and X% from percentage to per unit using the new `baseMVA` value.

- The `TConn` column in the resulting matrix corresponds to the transformer connection type as described above.

