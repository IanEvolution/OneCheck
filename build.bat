@echo off
rem Builds OneCheck.exe with the C# compiler that ships with Windows. No installs needed.
setlocal
set CSC=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\csc.exe
if not exist "%CSC%" set CSC=%WINDIR%\Microsoft.NET\Framework\v4.0.30319\csc.exe
if not exist "%CSC%" (
  echo Could not find csc.exe. Use "dotnet build" with OneCheck.csproj instead.
  exit /b 1
)
"%CSC%" /nologo /target:winexe /optimize+ /win32icon:app.ico /r:System.Windows.Forms.dll /r:System.Drawing.dll /resource:sounds\boot.wav,boot.wav /out:OneCheck.exe OneCheck.cs
if errorlevel 1 (
  echo.
  echo Build failed. Read the errors above.
  exit /b 1
)
echo.
echo Built OneCheck.exe
