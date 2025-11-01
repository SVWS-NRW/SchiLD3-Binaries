@ECHO OFF
ECHO Wichtig: Die Batch-Datei muss explizit mit Administrator-Rechten gestartet werden!
setlocal
cd /d %~dp0
@ECHO ON
RwEasyMAPI64.exe /regserver
@ECHO OFF
pause