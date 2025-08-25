@echo off
echo Git Auto Script
echo.

:: Sync images from _posts to assets/img
echo Syncing images from _posts to assets/img...
if exist "_posts\assets\img\image" (
    if not exist "assets\img\image" mkdir "assets\img\image"
    
    :: Copy images from _posts to assets/img
    for %%f in ("_posts\assets\img\image\*.*") do (
        if exist "assets\img\image\%%~nxf" (
            echo Copying: %%~nxf
        ) else (
            echo New image: %%~nxf
        )
        copy "%%f" "assets\img\image\" >nul
    )
    
    :: Remove images from assets/img that don't exist in _posts
    for %%f in ("assets\img\image\*.*") do (
        if not exist "_posts\assets\img\image\%%~nxf" (
            echo Removing: %%~nxf
            del "%%f"
        )
    )
    
    echo Images synced successfully!
) else (
    echo No _posts\assets\img\image folder found.
)
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
