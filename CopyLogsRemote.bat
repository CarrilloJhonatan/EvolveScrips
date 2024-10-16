@echo off
REM Limpiar la carpeta de destino (incluye archivos y subcarpetas)
echo Limpiando C:\DEMO25INLOGS...
rd /S /Q "C:\DEMO25INLOGS"
mkdir "C:\DEMO25INLOGS"

REM Copiar los archivos de la carpeta de origen
echo Copiando archivos de C:\LogsEvolve a C:\DEMO25INLOGS...
xcopy "C:\LogsEvolve\*" "C:\DEMO25INLOGS\" /E /H /C /I /Y

echo Operación completada.
pause