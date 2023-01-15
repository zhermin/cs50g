@echo off
cd %1
del "*.dll"
del "license.txt"
del "*.love"
del "*.exe"
wsl zip -9 -r "%~n1.love" .
copy /b "C:\Program Files\LOVE\love.exe"+%1 "%~n1.exe"
cat "C:\Program Files\LOVE\love.exe" "%~n1.love" > "%~n1.exe"
copy "C:\Program Files\LOVE\*.dll"
copy "C:\Program Files\LOVE\license.txt"
cd %~dp0
pause