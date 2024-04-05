---
title: Cons_load Function Documentation
author: Tao He
layout: post
mermaid: true
category: Jekyll
---

The `Cons_yload` function converts load data from an input CSV file into Y-connected (`yload`) and Delta-connected (`dload`) load matrices. It supports unit conversion and provides the option to save the resulting matrices as CSV files.

## Function Signature

```matlab
[yload, dload] = Cons_yload(spot_csv, powerunit, save_as_csv)
```

## Inputs

- `spot_csv` (string): The path to the input CSV file containing load data.
- `powerunit` (string): The power unit used in the CSV file. Valid options are 'w' (watts) or 'kw' (kilowatts), which will be converted to MW (megawatts).
- `save_as_csv` (optional, int): If set to 1, the `yload` and `dload` matrices will be saved as CSV files using the `save_csv` function. Default value is 0.

## Outputs

- `yload` (double matrix): The resulting Y-connected load matrix containing load data in the Y-PQ, Y-I, and Y-Z formats.
- `dload` (double matrix): The resulting Delta-connected load matrix containing load data in the D-PQ, D-I, and D-Z formats.

## Load Types

The function handles the following load types and constructs the matrices accordingly:

- Y-PQ: Y-connected load with power-constant components (MW and MVAR).
- Y-I: Y-connected load with current-constant components (MW and MVAR).
- Y-Z: Y-connected load with impedance-constant components (MW and MVAR).
- D-PQ: Delta-connected load with power-constant components (MW and MVAR).
- D-I: Delta-connected load with current-constant components (MW and MVAR).
- D-Z: Delta-connected load with impedance-constant components (MW and MVAR).
- 
## yload Matrix Columns

The resulting `yload` matrix contains the following columns:

1. **bID**: Bus to which the load is connected.
2. **YPd0A**: Phase-A active power load. Power-constant component (MW).
3. **YPd0B**: Phase-B active power load. Power-constant component (MW).
4. **YPd0C**: Phase-C active power load. Power-constant component (MW).
5. **YQd0A**: Phase-A reactive power load. Power-constant component (MVAR).
6. **YQd0B**: Phase-B reactive power load. Power-constant component (MVAR).
7. **YQd0C**: Phase-C reactive power load. Power-constant component (MVAR).
8. **YPd1A**: Phase-A active power load. Current-constant component (MW).
9. **YPd1B**: Phase-B active power load. Current-constant component (MW).
10. **YPd1C**: Phase-C active power load. Current-constant component (MW).
11. **YQd1A**: Phase-A reactive power load. Current-constant component (MVAR).
12. **YQd1B**: Phase-B reactive power load. Current-constant component (MVAR).
13. **YQd1C**: Phase-C reactive power load. Current-constant component (MVAR).
14. **YPd2A**: Phase-A active power load. Impedance-constant component (MW).
15. **YPd2B**: Phase-B active power load. Impedance-constant component (MW).
16. **YPd2C**: Phase-C active power load. Impedance-constant component (MW).
17. **YQd2A**: Phase-A reactive power load. Impedance-constant component (MVAR).
18. **YQd2B**: Phase-B reactive power load. Impedance-constant component (MVAR).
19. **YQd2C**: Phase-C reactive power load. Impedance-constant component (MVAR).
20. **Status**: Load status (0 is OFF, 1 is ON).

## dload Matrix Columns

The resulting `dload` matrix contains the following columns:

1. **bID**: Bus to which the load is connected.
2. **DPd0AB**: Active power load between phases A and B. Power-constant component (MW).
3. **DPd0BC**: Active power load between phases B and C. Power-constant component (MW).
4. **DPd0CA**: Active power load between phases C and A. Power-constant component (MW).
5. **DQd0AB**: Reactive power load between phases A and B. Power-constant component (MVAR).
6. **DQd0BC**: Reactive power load between phases B and C. Power-constant component (MVAR).
7. **DQd0CA**: Reactive power load between phases C and A. Power-constant component (MVAR).
8. **DPd1AB**: Active power load between phases A and B. Current-constant component (MW).
9. **DPd1BC**: Active power load between phases B and C. Current-constant component (MW).
10. **DPd1CA**: Active power load between phases C and A. Current-constant component (MW).
11. **DQd1AB**: Reactive power load between phases A and B. Current-constant component (MVAR).
12. **DQd1BC**: Reactive power load between phases B and C. Current-constant component (MVAR).
13. **DQd1CA**: Reactive power load between phases C and A. Current-constant component (MVAR).
14. **DPd2AB**: Active power load between phases A and B. Impedance-constant component (MW).
15. **DPd2BC**: Active power load between phases B and C. Impedance-constant component (MW).
16. **DPd2CA**: Active power load between phases C and A. Impedance-constant component (MW).
17. **DQd2AB**: Reactive power load between phases A and B. Impedance-constant component (MVAR).
18. **DQd2BC**: Reactive power load between phases B and C. Impedance-constant component (MVAR).
19. **DQd2CA**: Reactive power load between phases C and A. Impedance-constant component (MVAR).
20. **Status**: Load status (0 is OFF, 1 is ON).

The `dload` matrix represents Delta-connected load data in various formats based on the load type from the input CSV file.

## Unit Conversion

If `powerunit` is 'w' or 'kw', the function converts the power values to MW as needed.

## CSV Saving

If `save_as_csv` is set to 1, the resulting `yload` and `dload` matrices will be saved as CSV files using the `save_csv` function. The CSV filenames for `yload` and `dload` matrices are 'yload_matrix.csv' and 'dload_matrix.csv', respectively.

## Example Usage

```matlab
spot_csv = 'spot_loads.csv';
powerunit = 'kw';
save_as_csv = 1;
[yload, dload] = Cons_yload(spot_csv, powerunit, save_as_csv);
```

In this example, the function will read load data from 'spot_loads.csv', convert kilowatts to megawatts, and save the resulting matrices as CSV files.
