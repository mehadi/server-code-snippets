@echo off
setlocal enabledelayedexpansion

REM Set the source directory path
set "sourceDir=C:\Documents\_BASE_TEMPLATE_DOC"

REM Set the filename of the source file
set "fileName=2023.11.12_COMPANY_POSITION_Job_Details_Application.docx"

REM Set the destination root directory path
set "destinationRoot=D:\Documents\Resumes Files\__Applications\2023.11.12\"

REM Check if the source directory exists
if not exist "%sourceDir%" (
    echo Source directory "%sourceDir%" does not exist.
    pause
    exit /b
)

REM Check if the source file exists in the source directory
if not exist "%sourceDir%\%fileName%" (
    echo Source file "%fileName%" does not exist in "%sourceDir%".
    pause
    exit /b
)

REM Check if the destination root directory exists
if not exist "%destinationRoot%" (
    echo Destination root directory "%destinationRoot%" does not exist.
    pause
    exit /b
)

REM Iterate through all subdirectories under the destination root directory
for /d /r "%destinationRoot%" %%A in (*) do (
    set "subDir=%%~nxA"  REM Extract the name of the current subdirectory

    REM Split the filename at the 'COMPANY' keyword
    for /f "tokens=1,* delims=COMPANY" %%a in ("!fileName!") do (
        set "textBeforeCompany=%%a"
        set "textAfterCompany=%%b"
    )

    REM Combine the parts of the filename with the current subdirectory name
    set "combinedText=!textBeforeCompany!!subDir!!textAfterCompany!"

    REM Copy the source file to the current subdirectory with the modified filename
    copy "%sourceDir%\%fileName%" "%%A\!combinedText!"
)

REM Display a message indicating that the file has been copied to all subdirectories
echo File copied to all subdirectories under "%destinationRoot\" with "_COMPANY_" replaced by subfolder name in the desired position.
pause
