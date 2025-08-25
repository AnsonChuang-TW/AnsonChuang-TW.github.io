@echo off
echo Git Auto Script
echo.


:: Add all changes
echo Adding all changes...
git add .

:: Commit with timestamp
set timestamp=%date% %time%
echo Committing changes...
git commit -m "Auto commit: %timestamp%"

:: Push to remote
echo Pushing to remote...
git push

echo Done!
pause
