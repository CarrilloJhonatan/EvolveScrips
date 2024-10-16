@echo off
set taskName=CopyLogsDriveTask
set scriptPath=C:\EvolveScrips\CopyLogsDrive.bat

echo Creando tarea programada "%taskName%" para ejecutar el script "%scriptPath%" a las 2:00 AM todos los días...

:: Crea la tarea programada con privilegios más altos
schtasks /create /tn "%taskName%" /tr "%scriptPath%" /sc daily /st 12:56 /rl highest /f

if %errorlevel% equ 0 (
    echo La tarea programada se creó correctamente.
) else (
    echo Hubo un error al crear la tarea programada.
)
