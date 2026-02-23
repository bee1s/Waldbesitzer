@echo off
setlocal ENABLEDELAYEDEXPANSION

rem ==========================================
rem  Einstellungen
rem ==========================================

set DB_USER=wg
set DB_PASS=lido
set DB_CONN=jdbc:oracle:thin:@//localhost:1521/XEPDB1

set APEX_EXPORT_DIR=C:\Git\WALDBESITZER\apex\app_101\export
rem set SCHEMA_EXPORT_SCRIPT=C:\Git\HAUSHALTSBUCH\db\scripts\schema_export.sql

set TMP_APEX=%TEMP%\apex_export.sql


rem ==========================================
rem  1) APEX Export
rem ==========================================
echo ==========================================
echo   1) APEX-Export
echo ==========================================

(
  echo apex export -applicationid 101 -split -dir "%APEX_EXPORT_DIR%"
  echo exit;
) > "%TMP_APEX%"

sql %DB_USER%/%DB_PASS%@%DB_CONN% @"%TMP_APEX%"
echo.


rem ==========================================
rem  2) Schema-Objekte exportieren
rem ==========================================
rem echo ==========================================
rem echo   2) Schema-Objekte exportieren
rem echo ==========================================

rem sql %DB_USER%/%DB_PASS%@%DB_CONN% @"%SCHEMA_EXPORT_SCRIPT%"
rem echo.


rem ==========================================
rem  Hinweis zu Git
rem ==========================================
rem echo ==========================================
rem echo   Export abgeschlossen.
rem echo   Jetzt bitte Git-Änderungen in VS Code
rem echo   manuell prüfen (Source Control).
rem echo ==========================================
rem echo.
pause
