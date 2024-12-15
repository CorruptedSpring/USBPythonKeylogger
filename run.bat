@echo off
cd "%~dp0"

:: Check if Python is in PATH
python --version >nul 2>&1
if %errorlevel%==0 (
    set "PYTHON_EXEC=python"
) else (
    echo Python is not in the PATH. Attempting to use a default installation...
    set "PYTHON_EXEC=%LOCALAPPDATA%\Programs\Python\Python38\python.exe"
    "%PYTHON_EXEC%" --version >nul 2>&1
    if %errorlevel%==9009 (
        echo Python not found. Attempting to install Python...

        :: Download Python installer
        echo Downloading Python installer...
        powershell -Command "Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.8.10/python-3.8.10-amd64.exe -OutFile python-installer.exe"
        if not exist "python-installer.exe" (
            echo Failed to download Python installer. Please check your internet connection.
            pause
            exit /b
        )

        :: Install Python silently
        echo Installing Python...
        python-installer.exe /quiet InstallAllUsers=1 PrependPath=1
        if %errorlevel% neq 0 (
            echo Python installation failed. Please install Python manually.
            pause
            exit /b
        )
        
        :: Check if Python is now available
        "%PYTHON_EXEC%" --version >nul 2>&1
        if %errorlevel% neq 0 (
            echo Python installation failed. Please install Python manually.
            pause
            exit /b
        )
    )
)

echo Checking if required Python packages are installed...
"%PYTHON_EXEC%" -m pip show keyboard >nul 2>&1
if %errorlevel% neq 0 goto INSTALL_REQUIREMENTS

goto RUN_MAIN

:INSTALL_REQUIREMENTS
echo Required packages are missing. Installing keyboard...
"%PYTHON_EXEC%" -m pip install keyboard
if %errorlevel% neq 0 (
    echo Failed to install required packages. Please check your Python and pip setup.
    pause
    exit /b
)

:RUN_MAIN
echo Running the main script...
"%PYTHON_EXEC%" main.py
