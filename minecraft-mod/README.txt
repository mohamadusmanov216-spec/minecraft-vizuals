AXMED555 VISUALS MOD - BUILD INSTRUCTIONS
=========================================

STEP 1: Fix Gradle Wrapper
---------------------------
Run: FIX-GRADLE-WRAPPER.bat
This downloads the missing gradle-wrapper.jar file.

Wait until you see "SUCCESS! GRADLE WRAPPER DOWNLOADED!"


STEP 2: Build the Mod
---------------------
Run: BUILD-ULTIMATE.bat
This opens a new window and builds your mod.

Wait 10-15 minutes for first build.


STEP 3: Install the Mod
-----------------------
Copy file: build\libs\axmed555-visuals-1.0.0.jar
To folder: .minecraft\mods\

Done! Launch Minecraft 1.16.5 with Forge!


TROUBLESHOOTING
---------------
If BUILD-ULTIMATE.bat fails:
- Make sure you ran FIX-GRADLE-WRAPPER.bat first
- Check your antivirus isn't blocking Java or Gradle
- Add this folder to Windows Defender exclusions


Your Java 8 path:
C:\Program Files\Eclipse Adoptium\jdk-8.0.472.8-hotspot
