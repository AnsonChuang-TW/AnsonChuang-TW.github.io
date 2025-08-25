@echo off
echo Git Auto Script
echo.

:: Add all changes
git add .

:: Commit with timestamp
set timestamp=%date% %time%
git commit -m "Auto commit: %timestamp%"

:: Push to remote
git push

echo Done!
pause
