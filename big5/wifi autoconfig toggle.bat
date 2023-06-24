@echo off
setlocal ENABLEDELAYEDEXPANSION
:: big5
chcp 950
cls

:: ¼Ë¦¡³]©w
set ENABLE=[42m ±Ò¥Î [0m
set DISABLE=[41m °±¥Î [0m

:: ÀË¬d¬O§_¦³¥HºÞ²z­û¨­¥÷¹B¦æµ{¦¡
call :test_admin IS_ADMIN

IF %IS_ADMIN% == 0 (
    :: ¥H«DºÞ²z­û¨­¥÷¶}±Ò¨ä¥Lµ{¦¡
	call :launch_programs
	
	echo »Ý­nºÞ²z­ûÅv­­¾Þ§@WIFI³]©w
	echo Start-Process cmd -WindowStyle Minimized -Verb RunAs -ArgumentList "/c", '"%~f0"' | PowerShell -Command -
	goto :eof
)

IF %IS_ADMIN% == 1 (
	call :main
	goto :eof
)

goto :eof

:: functions def
:test_admin
	NET FILE >NUL 2>&1
	IF %ERRORLEVEL% NEQ 0 (
		set %~1=0
	) else (
		set %~1=1
	)
	EXIT /B 0

:color_output
	set output=%~1
	set output=%output:±Ò¥Î=!ENABLE!%
	set output=%output:°±¥Î=!DISABLE!%
	echo %output%
	EXIT /B 0

:main
	:: netsh wlan set autoconfig enabled=yes interface="Wi-Fi"
	for /f "delims=" %%a in ('netsh wlan set autoconfig enabled^=yes interface^="Wi-Fi"') do call :color_output "%%a"
	timeout /t 1 /nobreak
	echo ---
	:: netsh wlan set autoconfig enabled=no interface="Wi-Fi"
	for /f "delims=" %%a in ('netsh wlan set autoconfig enabled^=no interface^="Wi-Fi"') do call :color_output "%%a"
	timeout /t 1 /nobreak
	echo ---
	:: netsh wlan show settings
	for /f "delims=" %%a in ('netsh wlan show settings') do call :color_output "%%a"

	pause
	cls

	:: netsh wlan set autoconfig enabled=yes interface="Wi-Fi"
	for /f "delims=" %%a in ('netsh wlan set autoconfig enabled^=yes interface^="Wi-Fi"') do call :color_output "%%a"
	timeout /t 1 /nobreak
	echo ---
	:: netsh wlan show settings
	for /f "delims=" %%a in ('netsh wlan show settings') do call :color_output "%%a"
	timeout /t 3 /nobreak

	EXIT /B 0
	
:launch_programs
	:: Vive Streaming Hub
	:: start "title" "C:\Program Files\VIVE Hub\VIVE Hub\VHConsole\VHConsole.exe"

	:: Steam VR
	:: start "title" "C:\Program Files (x86)\Steam\steam.exe" steam://rungameid/250820	
