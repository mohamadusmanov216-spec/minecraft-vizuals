@echo off
cd /d "%~dp0"
color 0A

echo.
echo ========================================================
echo    ULTIMATE BUILD - CANNOT CLOSE!
echo ========================================================
echo.
echo This will open a NEW window that CANNOT close!
echo.
pause

set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-8.0.472.8-hotspot"
set "PATH=%JAVA_HOME%\bin;%PATH%"

start "GRADLE BUILD - KEEP THIS OPEN!" cmd /k "cd /d "%~dp0" && set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-8.0.472.8-hotspot" && set "PATH=%JAVA_HOME%\bin;%PATH%" && echo. && echo Starting Gradle build... && echo. && gradlew.bat clean build --warning-mode all --stacktrace && echo. && echo ======================================== && echo BUILD FINISHED! && echo ======================================== && echo. && if exist build\libs\axmed555-visuals-1.0.0.jar (echo SUCCESS! MOD: build\libs\axmed555-visuals-1.0.0.jar) else (echo FAILED! No JAR file created)"

echo.
echo A new window opened!
echo.
echo That window will NEVER close automatically!
echo.
echo Wait for the build to finish in that window!
echo.
pause
