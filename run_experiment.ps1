param(
    [Parameter(Position=0)]
    [string]$ExperimentNumber = "",
    [Parameter(Position=1)]
    [string]$Device = "chrome"
)

$flutterBin = "C:\Users\vsraj\Downloads\flutter_windows_3.44.8-stable\flutter\bin\flutter.bat"
if (-not (Test-Path $flutterBin)) {
    $flutterBin = "flutter"
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "         Flutter Laboratory - Experiment Runner           " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan

$expTitles = @{
    "1" = "Working with Widgets and Layouts (Fresh Fruits)"
    "2" = "Adaptive and Responsive UI Design (ShopEase)"
    "3" = "Add Interactivity to App - Input and Forms"
    "4" = "Form Validation using Stateful Widgets (Car Mileage)"
    "5" = "Implementation of Navigation and Routing"
    "6" = "Data Persistence Using SQLite (StudentHub)"
    "7" = "Data Persistence Using Google Cloud Firestore"
    "8" = "Searching Information in Google Firestore Database"
    "9" = "Update Information in Google Firestore Database"
    "10" = "Manual User Login Authentication Using Firestore"
}

if ([string]::IsNullOrWhiteSpace($ExperimentNumber)) {
    Write-Host "Select an experiment to run on your laptop:" -ForegroundColor Green
    foreach ($key in 1..10) {
        $k = [string]$key
        Write-Host "  [$k] $($expTitles[$k])"
    }
    Write-Host ""
    $ExperimentNumber = Read-Host "Enter experiment number (1-10)"
}

$num = [int]$ExperimentNumber
$folder = "exp_$([string]::Format('{0:D2}', $num))"

if (-not (Test-Path $folder)) {
    Write-Host "Folder $folder not found!" -ForegroundColor Red
    exit 1
}

Write-Host "`nLaunching Experiment $num: $($expTitles[[string]$num]) on $Device..." -ForegroundColor Green
Push-Location $folder
& $flutterBin run -d $Device
Pop-Location
