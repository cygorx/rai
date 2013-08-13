@echo off
rem Designed and programmed by cygorx. This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 Unported License. 
rem To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/3.0/.
rem C:\Users\b\Desktop\!projects\work-in-progress\RobloxAssetInstallation\RBXAssetInstallation.bat C:\Users\b\Desktop\!projects\work-in-progress\RobloxAssetInstallation\rbx

title RBXAssetInstallation
mode con: cols=90 lines=20
color 0f


if "%~1" EQU "" goto fileNull
echo RBXAssetInstallation: Pure, open-source asset installation.
echo RAI is not reponsible nor liable for any malicious software transmitted within assets.
echo It is wise to confirm that the assets you are installing are legitimate before proceeding.
echo Press enter to proceed.
echo By pressing enter, you confirm you wish to install the assets from the following directory:
echo %~1
pause>nul

set "path=C:%HOMEPATH%\AppData\Local\Roblox\Versions"
if exist %path% goto findVersions
if not exist %path% echo Roblox is not installed. && goto end 
if not exist %path% set "path=C:%HOMEPATH%\Local Settings\Application Data\RobloxVersions"

:findVersions
echo ---COPYING---
for /d %%i in (%path%\*) do (
	if exist %%i\ if exist %%i\content (
		if exist "%~1\sounds\" copy "%~1\sounds" %%i\content\sounds /Y > nul
		if exist "%~1\fonts\" copy "%~1\fonts" %%i\content\fonts /Y > nul 
		if exist "%~1\music\" copy "%~1\music" %%i\content\music /Y > nul
		if exist "%~1\particles\" copy "%~1\particles" %%i\content\particles /Y > nul
		if exist "%~1\sky\" copy "%~1\sky" %%i\content\sky /Y > nul
		if exist "%~1\textures\" copy "%~1\textures" %%i\content\textures /Y > nul
	)
)
echo Finished.
goto end

:fileNull
echo Click and drag the provided folder onto RBXAssetInstallation.bat.
echo If the file is zipped, please extract it.
goto end

:end
echo Thank you for using RBXAssetInstallation.
pause>nul
exit