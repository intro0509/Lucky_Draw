@echo off
title Lucky Draw Upload

set GIT="C:\Program Files\Git\cmd\git.exe"
set REPO_PATH=%USERPROFILE%\Lucky_Draw

if not exist "%REPO_PATH%" (
    echo ERROR: Lucky_Draw folder not found.
    pause
    exit /b
)

cd /d "%REPO_PATH%"

echo Step 1: Adding files...
%GIT% add .

echo Step 2: Committing...
%GIT% commit -m "update"

echo Step 3: Syncing with GitHub...
%GIT% fetch origin
%GIT% pull origin main --rebase
if errorlevel 1 (
    echo WARNING: Rebase conflict detected. Aborting rebase and force pushing...
    %GIT% rebase --abort
)

echo Step 4: Pushing to GitHub...
%GIT% push --force origin main

echo.
echo Done!
echo [Lucky Draw]   https://intro0509.github.io/Lucky_Draw/index.html
echo.
pause
