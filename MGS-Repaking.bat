@echo off
setlocal

REM --- Configuration ---
REM Path to MArchiveBatchTool.exe relative to this script
set "TOOL_SUBDIR=MArchiveBatchTool"
set "TOOL_EXE=MArchiveBatchTool.exe"
set "TOOL_PATH=%~dp0%TOOL_SUBDIR%\%TOOL_EXE%"

REM MArchiveBatchTool specific parameters
set "CODEC=zlib"
set "SEED=25G/xpvTbsb+6"
set "KEY_LENGTH=64"
REM --- End Configuration ---

REM Check if a folder was dragged
if "%~1"=="" (
    echo ERROR: No folder dragged onto the script.
    echo Please drag and drop a folder onto this .bat file.
    goto :end
)

REM Check if the dragged item is a directory
if not exist "%~1\" (
    echo ERROR: "%~1" is not a valid folder.
    echo Please drag and drop a FOLDER.
    goto :end
)

REM Check if MArchiveBatchTool.exe exists
if not exist "%TOOL_PATH%" (
    echo ERROR: MArchiveBatchTool.exe not found at "%TOOL_PATH%"
    echo Please ensure the tool is in the "%TOOL_SUBDIR%" subdirectory next to this script.
    goto :end
)

set "INPUT_FOLDER=%~1"
set "INPUT_FOLDER_NAME=%~n1"
set "OUTPUT_FILENAME=%INPUT_FOLDER_NAME%"

echo ==================================================
echo MArchiveBatchTool Packer
echo ==================================================
echo Input Folder:   "%INPUT_FOLDER%"
echo Output BIN File: "%OUTPUT_FILENAME%" (will be created in script's directory)
echo Tool Path:      "%TOOL_PATH%"
echo Codec:          %CODEC%
echo Seed:           "%SEED%"
echo Key Length:     %KEY_LENGTH%
echo ==================================================
echo.
echo Press any key to start packing, or Ctrl+C to cancel...
pause >nul
echo.
echo Starting packing process...

REM Execute the command
REM The output .bin file will be created in the current directory (which is the script's directory)
"%TOOL_PATH%" archive build "%INPUT_FOLDER%" "%OUTPUT_FILENAME%" --codec %CODEC% --seed "%SEED%" --keyLength %KEY_LENGTH%

if errorlevel 1 (
    echo.
    echo ERROR: MArchiveBatchTool reported an error.
) else (
    echo.
    echo SUCCESS: "%OUTPUT_FILENAME%" created successfully!
)

:end
echo.
echo Press any key to close this window.
pause >nul
endlocal