@echo off
set "VENV_PATH=C:\Users\mhd_gamer\Desktop\grad"

# Check if the virtual environment exists
if exist "%VENV_PATH%" (
    # Activate the virtual environment
   call "%VENV_PATH%\Scripts\activate"
    
  
) else (
    echo Virtual environment not found at: %VENV_PATH%
)
