@echo off
echo ========================================================
echo   STARTING SIHASTHA UJJAIN 3D BOOKING PLATFORM
echo ========================================================
echo.
echo Launching Backend Server on port 5000...
start "Sihastha Backend API" cmd /k "cd /d %~dp0backend && npm.cmd start"

echo Launching Frontend Dev Server on port 3000...
start "Sihastha 3D Frontend" cmd /k "cd /d %~dp0frontend && npm.cmd run dev"

echo.
echo Both servers are launching!
echo Backend:  http://localhost:5000
echo Frontend: http://localhost:3000
echo.
echo Om Namah Shivaya!
pause
