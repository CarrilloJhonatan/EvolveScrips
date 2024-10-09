@echo off
REM Limpiar la carpeta de destino (incluye archivos y subcarpetas)
echo Limpiando C:\SantaCruz-Logs...
rd /S /Q "C:\SantaCruz-Logs"
mkdir "C:\SantaCruz-Logs"

REM Copiar los archivos de la carpeta de origen
echo Copiando archivos de C:\LogsEvolve a C:\SantaCruz-Logs...
xcopy "C:\LogsEvolve\*" "C:\SantaCruz-Logs\" /E /H /C /I /Y

echo Operación completada.
pause