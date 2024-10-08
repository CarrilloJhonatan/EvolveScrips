@echo off
set taskName=CopyLogsDriveTask
set scriptPath=C:\EvolveScripts\CopyLogsDrive.bat

echo Creando tarea programada "%taskName%" para ejecutar el script "%scriptPath%" a las 2:00 AM todos los días...

:: Crea la tarea programada
schtasks /create /tn "%taskName%" /tr "%scriptPath%" /sc daily /st 02:00 /f

if %errorlevel% equ 0 (
    echo La tarea programada se creó correctamente.
) else (
    echo Hubo un error al crear la tarea programada.
)
