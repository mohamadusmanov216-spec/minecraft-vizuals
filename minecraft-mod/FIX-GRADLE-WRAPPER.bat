@echo off
cd /d "%~dp0"
color 0E
title Fix Gradle Wrapper

cls
echo.
echo ========================================================
echo    FIX GRADLE WRAPPER - ALTERNATIVE METHOD
echo ========================================================
echo.
echo This will try MULTIPLE download sources!
echo.
pause

if not exist "gradle\wrapper" mkdir gradle\wrapper

echo.
echo [METHOD 1] Trying GitHub mirror...
echo.
powershell -Command "try { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/gradle/gradle/v6.9.0/gradle/wrapper/gradle-wrapper.jar' -OutFile 'gradle\wrapper\gradle-wrapper.jar' -TimeoutSec 30; Write-Host 'SUCCESS from GitHub' } catch { Write-Host 'FAILED' }" 2>nul

if exist "gradle\wrapper\gradle-wrapper.jar" goto :success

echo.
echo [METHOD 2] Trying services.gradle.org...
echo.
powershell -Command "try { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://services.gradle.org/distributions/gradle-6.9-bin.zip' -OutFile 'gradle-temp.zip' -TimeoutSec 60; Expand-Archive -Path 'gradle-temp.zip' -DestinationPath 'gradle-temp' -Force; Copy-Item 'gradle-temp\gradle-6.9\lib\gradle-wrapper-6.9.jar' 'gradle\wrapper\gradle-wrapper.jar' -Force; Remove-Item 'gradle-temp.zip' -Force; Remove-Item 'gradle-temp' -Recurse -Force; Write-Host 'SUCCESS from Gradle.org' } catch { Write-Host 'FAILED' }" 2>nul

if exist "gradle\wrapper\gradle-wrapper.jar" goto :success

echo.
echo [METHOD 3] Trying Maven Central...
echo.
powershell -Command "try { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://repo1.maven.org/maven2/org/gradle/gradle-wrapper/6.9/gradle-wrapper-6.9.jar' -OutFile 'gradle\wrapper\gradle-wrapper.jar' -TimeoutSec 30; Write-Host 'SUCCESS from Maven Central' } catch { Write-Host 'FAILED' }" 2>nul

if exist "gradle\wrapper\gradle-wrapper.jar" goto :success

echo.
echo [FAILED] All download methods failed!
echo.
echo MANUAL STEPS:
echo 1. Download: https://services.gradle.org/distributions/gradle-6.9-bin.zip
echo 2. Extract the ZIP
echo 3. Copy file: gradle-6.9\lib\gradle-wrapper-6.9.jar
echo 4. Paste to: %CD%\gradle\wrapper\gradle-wrapper.jar
echo.
goto :end

:success
echo.
echo ========================================================
echo    SUCCESS! GRADLE WRAPPER DOWNLOADED!
echo ========================================================
echo.
dir gradle\wrapper\gradle-wrapper.jar
echo.
echo Now you can run BUILD-ULTIMATE.bat or BUILD-WITH-LOG.bat!
echo.

:end
pause
