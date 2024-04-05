# pwsh Function Documentation

## Overview

The `pwsh` function is designed to start a new PowerShell window with a custom prompt that displays 'PS> ' instead of the default prompt. This function is intended for use on Windows systems and requires PowerShell to be installed.

## Syntax

```matlab
pwsh()
```

## Description

The function works by executing a system command to start PowerShell with specific flags and a command to define a global prompt function. The `--nologo` flag suppresses the display of the copyright banner and profile script at startup. The `--noe` flag prevents the execution of the profile script. The `-Command` flag is used to define a global prompt function that returns the custom prompt string 'PS> '.

## Error Handling

The function checks if the operating system is Windows NT (or later) by comparing the value of the 'OS' environment variable. If the operating system is not Windows, an error message is displayed, and the function execution is halted.

## Example Usage

```matlab
% Start PowerShell with a custom prompt
pwsh();
```

## Notes

- This function is intended for use on Windows systems.
- The function assumes that PowerShell is installed and accessible from the system path.
- The function does not return any value.

## Copyright

Copyright 2023 The MathWorks, Inc.
