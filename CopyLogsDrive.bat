@echo off
setlocal enabledelayedexpansion

set sourceRoot=C:\Users\posuser\AppData\Local\Programs\EvolvePOS
set targetDir=\\POSSERVER\LogsEvolve\SantaCruz-POS-3

:: Inicializa la variable para la mayor versión encontrada
set maxVersion=
set selectedFolder=

echo Buscando la carpeta con la última versión...

:: Recorre todas las carpetas que empiecen con "app-"
for /d %%F in ("%sourceRoot%\app-*") do (
    set folderName=%%~nxF
    set version=!folderName:app-=!

    :: Compara la versión actual con la mayor versión encontrada
    if "!maxVersion!"=="" (
        set maxVersion=!version!
        set selectedFolder=%%F
    ) else (
        if !version! gtr !maxVersion! (
            set maxVersion=!version!
            set selectedFolder=%%F
        )
    )
)

:: Si se ha encontrado una versión válida, procedemos a copiar
if defined maxVersion (
    echo La última carpeta seleccionada es: !selectedFolder!
    echo La última versión encontrada es: app-!maxVersion!

    echo Borrando todo el contenido de "%targetDir%"...
    
    :: Borra todo el contenido de la carpeta LogsClient
    if exist "%targetDir%" (
        rd /s /q "%targetDir%" 2>nul
        echo Carpeta LogsClient borrada correctamente.
    )
    
    :: Re-crea la carpeta LogsClient si no existe
    mkdir "%targetDir%"

    echo Copiando carpetas desde la versión app-!maxVersion!...

    :: Verifica si existe cada carpeta antes de copiarla
    if exist "!selectedFolder!\Logs" (
        xcopy "!selectedFolder!\Logs" "%targetDir%\Logs" /E /I /Y
        echo Carpeta Logs copiada y sobrescrita con éxito.
    ) else (
        echo Carpeta Logs no existe, omitiendo...
    )

    if exist "!selectedFolder!\PinpadLogs" (
        xcopy "!selectedFolder!\PinpadLogs" "%targetDir%\PinpadLogs" /E /I /Y
        echo Carpeta PinpadLogs copiada y sobrescrita con éxito.
    ) else (
        echo Carpeta PinpadLogs no existe, omitiendo...
    )

    if exist "!selectedFolder!\StoreAccountLogs" (
        xcopy "!selectedFolder!\StoreAccountLogs" "%targetDir%\StoreAccountLogs" /E /I /Y
        echo Carpeta StoreAccountLogs copiada y sobrescrita con éxito.
    ) else (
        echo Carpeta StoreAccountLogs no existe, omitiendo...
    )

    if exist "!selectedFolder!\TenderLogs" (
        xcopy "!selectedFolder!\TenderLogs" "%targetDir%\TenderLogs" /E /I /Y
        echo Carpeta TenderLogs copiada y sobrescrita con éxito.
    ) else (
        echo Carpeta TenderLogs no existe, omitiendo...
    )

    echo Las carpetas se han copiado correctamente desde la última versión app-!maxVersion! a LogsClient.
) else (
    echo No se encontró ninguna carpeta con el prefijo "app-".
)