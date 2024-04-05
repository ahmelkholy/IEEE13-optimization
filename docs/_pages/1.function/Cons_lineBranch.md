
# Cons_lineBranch

This function constructs a `line_branch` matrix suitable for the `dpflow` package.

## Syntax

```matlab
line_branch_matrix = Cons_lineBranch(path_config_csv, path_segment_file, baseMVA, length_unit)
```

## Description

`line_branch_matrix = Cons_lineBranch(path_config_csv, path_segment_file, baseMVA, length_unit)` returns a matrix `line_branch_matrix` with structure `"fbus tbus line_branch Status"` where `Status` is always on for all branches. The function takes four input arguments:

- `path_config_csv`: The path to the directory containing the config CSV files. The name format of the config files should be like this: `config_724.csv`. The number of the config is 724 and the included data is like this: `"r1,x1,r2,x2,r3,x3,b1,b2,b3"`.
- `path_segment_file`: The path to a CSV file that contains the segment data. The name of the file should be like this: `sg_sysname.csv`. The format of the data should be like this: `"fbus tbus length config"`. This is an example of the data: `"701,702,960,722"`.
- `baseMVA`: The `baseMVA` value to use when calling the `config2dpflow` function.
- `length_unit`: The length unit to use when calling the `config2dpflow` function. Either `'mile'` or `'km'`.

## Examples

```matlab
line_branch_matrix = Cons_lineBranch('path/to/config/files', 'path/to/segment/file.csv', 100, 'mile');
```

This example constructs a `line_branch` matrix using config files located in `'path/to/config/files'`, segment data located in `'path/to/segment/file.csv'`, a `baseMVA` value of 100, and a length unit of `'mile'`.
