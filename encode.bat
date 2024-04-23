@echo off
setlocal enabledelayedexpansion

rem Set the folder path to encode
set "folderPath=D:\nifi\test-secret"

rem Loop through files in the folder and encode each file to Base64
for %%F in ("%folderPath%\*") do (
    echo Processing %%~nxF...
    certutil -encode "%%F" "%TEMP%\%%~nxF.base64" >nul 2>&1
    type "%TEMP%\%%~nxF.base64"
    echo.
)

rem Clean up temporary Base64 files
del /q "%TEMP%\*.base64"

echo Base64 encoding completed.
