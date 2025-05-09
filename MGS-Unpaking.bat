@echo off
setlocal

REM --- Configuration ---
set "TOOL_NAME=MArchiveBatchTool.exe"
set "TOOL_SUBDIR=MArchiveBatchTool"
set "CODEC=zlib"
set "SEED=25G/xpvTbsb+6"
set "KEY_LENGTH=64"
set "OUTPUT_SUFFIX=_extracted"
REM --- End Configuration ---

REM Get the directory of this batch script
set "SCRIPT_DIR=%~dp0"

REM Construct the full path to the tool
set "TOOL_PATH=%SCRIPT_DIR%%TOOL_SUBDIR%\%TOOL_NAME%"

REM Check if the tool exists
if not exist "%TOOL_PATH%" (
    echo ERROR: Tool not found at "%TOOL_PATH%"
    echo Please ensure the directory structure is correct:
    echo MGS-Master-Collection-Unpack\
    echo ^├── MGSUnpack.bat
    echo ^└── MArchiveBatchTool\
    echo     ^└── %TOOL_NAME%
    goto :end
)

REM Check if a file was dragged onto the script
if "%~1"=="" (
    echo Please drag and drop a .bin file onto this script.
    goto :end
)

REM Get the full path of the dropped file
set "INPUT_FILE=%~1"
REM Get the path of the dropped file (directory part)
set "INPUT_FILE_PATH=%~dp1"
REM Get the name of the dropped file without extension
set "INPUT_FILE_NAME_NO_EXT=%~n1"

REM Construct the output folder name
REM It will be created in the same directory as the input file
set "OUTPUT_FOLDER_NAME=%INPUT_FILE_NAME_NO_EXT%%OUTPUT_SUFFIX%"
set "OUTPUT_FOLDER_FULL_PATH=%INPUT_FILE_PATH%%OUTPUT_FOLDER_NAME%"

echo ================================================
echo MGS Archive Batch Unpacker
echo ================================================
echo.
echo Input File:      "%INPUT_FILE%"
echo Output Folder:   "%OUTPUT_FOLDER_FULL_PATH%"
echo Codec:           %CODEC%
echo Seed:            "%SEED%"
echo Key Length:      %KEY_LENGTH%
echo.

REM Create the output directory if it doesn't exist
if not exist "%OUTPUT_FOLDER_FULL_PATH%" (
    echo Creating output folder: "%OUTPUT_FOLDER_FULL_PATH%"
    mkdir "%OUTPUT_FOLDER_FULL_PATH%"
    if errorlevel 1 (
        echo ERROR: Could not create output folder. Check permissions.
        goto :end
    )
) else (
    echo Output folder already exists: "%OUTPUT_FOLDER_FULL_PATH%"
)
echo.

REM Execute the MArchiveBatchTool command
echo Executing extraction command...
"%TOOL_PATH%" archive extract "%INPUT_FILE%" "%OUTPUT_FOLDER_FULL_PATH%" --codec %CODEC% --seed "%SEED%" --keyLength %KEY_LENGTH%

echo.
echo ================================================
if %errorlevel% equ 0 (
    echo Extraction process completed successfully.
) else (
    echo Extraction process finished with errors (Errorlevel: %errorlevel%).
)
echo ================================================

:end
echo.
pause
endlocal