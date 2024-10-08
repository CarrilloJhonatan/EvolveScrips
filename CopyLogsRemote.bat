@echo off
REM Limpiar la carpeta de destino
echo Limpiando C:\SantaCruz-Logs...
del /Q "C:\SantaCruz-Logs\*"

REM Copiar los archivos de la carpeta de origen
echo Copiando archivos de C:\LogsEvolve a C:\SantaCruz-Logs...
xcopy "C:\LogsEvolve\*" "C:\SantaCruz-Logs\" /E /H /C /I

echo Operación completada.
pause
