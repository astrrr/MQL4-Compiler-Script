param (
    [string]$mql4FilePath,
    [string]$outputDir
)

# Check if MQL4 file exists
if (-not (Test-Path $mql4FilePath -PathType Leaf)) {
    Write-Host "Error: MQL4 file not found: $mql4FilePath"
    exit 1
}

# Check if output directory exists
if (-not (Test-Path $outputDir -PathType Container)) {
    Write-Host "Error: Output directory not found: $outputDir"
    exit 1
}

# Get compiler path from environment variable
$metaEditorPath = $env:MT4_COMPILER_PATH

# Check if compiler path is set
if (-not $metaEditorPath) {
    Write-Host "Error: MT4 compiler path not set. Please set the 'MT4_COMPILER_PATH' environment variable."
    exit 1
}

# Compile MQL4 to EX4
$outputFilePath = Join-Path $outputDir ([System.IO.Path]::GetFileNameWithoutExtension($mql4FilePath) + ".ex4")

# Compile MQL4 file
Start-Process -FilePath $metaEditorPath -ArgumentList "/compile:$mql4FilePath" -Wait

# Move compiled EX4 file to output directory
Move-Item -Path ([System.IO.Path]::ChangeExtension($mql4FilePath, ".ex4")) -Destination $outputFilePath -Force

Write-Host "Compilation completed. Output file: $outputFilePath"
