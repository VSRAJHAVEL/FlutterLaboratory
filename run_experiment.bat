@echo off
setlocal
echo ==========================================================
echo          Flutter Laboratory - Experiment Runner          
echo ==========================================================
echo [1]  Exp 01: Working with Widgets and Layouts (Fresh Fruits)
echo [2]  Exp 02: Adaptive and Responsive UI Design (ShopEase)
echo [3]  Exp 03: Add Interactivity to App - Input and Forms
echo [4]  Exp 04: Form Validation using Stateful Widgets (Mileage)
echo [5]  Exp 05: Implementation of Navigation and Routing
echo [6]  Exp 06: Data Persistence Using SQLite (StudentHub)
echo [7]  Exp 07: Data Persistence Using Google Cloud Firestore
echo [8]  Exp 08: Searching Information in Google Firestore
echo [9]  Exp 09: Update Information in Google Firestore
echo [10] Exp 10: Manual User Login Authentication (Firestore)
echo ==========================================================

if "%~1"=="" (
    set /p EXP_NUM="Enter experiment number to run (1-10): "
) else (
    set EXP_NUM=%~1
)

if "%EXP_NUM%"=="1" set EXP_DIR=exp_01
if "%EXP_NUM%"=="2" set EXP_DIR=exp_02
if "%EXP_NUM%"=="3" set EXP_DIR=exp_03
if "%EXP_NUM%"=="4" set EXP_DIR=exp_04
if "%EXP_NUM%"=="5" set EXP_DIR=exp_05
if "%EXP_NUM%"=="6" set EXP_DIR=exp_06
if "%EXP_NUM%"=="7" set EXP_DIR=exp_07
if "%EXP_NUM%"=="8" set EXP_DIR=exp_08
if "%EXP_NUM%"=="9" set EXP_DIR=exp_09
if "%EXP_NUM%"=="10" set EXP_DIR=exp_10

if not defined EXP_DIR (
    echo Invalid experiment number: %EXP_NUM%
    pause
    exit /b 1
)

echo.
echo Launching %EXP_DIR% in Google Chrome...
cd %EXP_DIR%
call "C:\Users\vsraj\Downloads\flutter_windows_3.44.8-stable\flutter\bin\flutter.bat" run -d chrome
cd ..
pause
