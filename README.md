# MQL4 Compiler Script

This PowerShell script compiles MQL4 files to EX4 files using the MetaTrader 4 compiler (`metaeditor.exe`). It provides a convenient way to compile MQL4 files outside of the MetaEditor IDE, allowing users to integrate MQL4 development into their preferred text editors or development environments. This script can be particularly useful for developers who prefer using alternative IDEs or editors for coding MQL4, such as Visual Studio Code.

## Usage

```powershell
.\CompileMQL4.ps1 -mql4FilePath "C:\Path\To\Your\File.mq4" -outputDir "C:\Users\User\MetaTraderFiles"
```

- `-mql4FilePath`: Path to the MQL4 file to compile.
- `-outputDir`: Output directory for the compiled EX4 file.

## Prerequisites

- MetaTrader 4 must be installed.
- Set the environment variable `MT4_COMPILER_PATH` to the path of `metaeditor.exe`.

## Environment Variable

Set the `MT4_COMPILER_PATH` environment variable using PowerShell:

```powershell
$env:MT4_COMPILER_PATH = "C:\Program Files (x86)\MetaTrader 4\metaeditor.exe"
```

Replace the path with the actual path to `metaeditor.exe` on your system.

