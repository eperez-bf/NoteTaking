# Takes the necesary arguments for the script to work
param(
    [Parameter(Mandatory=$true, HelpMessage="Please specify a path where the folders and files should be created.")]
    [string]$Path,
    [Parameter(Mandatory=$true, HelpMessage="Please specify a project name.")]
    [string]$ProjectName
)

if (-not (Test-Path -Path $Path -PathType Container)) {
    Write-Host "Error: The specified path does not exist or is not a directory."
    Write-Host "Usage: .\windows.ps1 -Path <path> -ProjectName <project name>"
    Write-Host ""
    Write-Host "Where <path> is the path to the directory where the folders and files should be created."
    Write-Host "<project name> is the name of the project."
    exit
}

# Create the basic folders
New-Item -ItemType Directory -Path "$Path/Findings"
New-Item -ItemType Directory -Path "$Path/ss"
New-Item -ItemType Directory -Path "$Path/Methodology"

# Create the four markdown files for note taking
$ConfigContent = @"
# Project: $ProjectName
## Scope: 
- 
## Kali: 
- 
## Credentials:
- 
"@
New-Item -ItemType File -Path "$Path/Config.md" -Value $ConfigContent
New-Item -ItemType File -Path "$Path/IA.md"
New-Item -ItemType File -Path "$Path/Kickoff.md"
New-Item -ItemType File -Path "$Path/TODO.md"