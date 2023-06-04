@echo off
setlocal ENABLEDELAYEDEXPANSION
:: big5
chcp 950
cls

:: ¼Ë¦¡³]©w
set ENABLE=[42m ±Ò¥Î [0m
set DISABLE=[41m °±¥Î [0m

:: ÀË¬d¬O§_¦³¥HºÞ²z­û¨­¥÷¹B¦æµ{¦¡
NET FILE >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo µ{¦¡»Ý­n¥HºÞ²z­û¨­¥÷¹B¦æ¡A½Ð­«·s±Ò°Êµ{¦¡
    :: PowerShell -Command "Start-Process cmd -Verb RunAs -ArgumentList '/c %~f0'"
	PowerShell -Command "Start-Process cmd -Verb RunAs -ArgumentList ('/c """' + '%~f0' + '"""')"
    EXIT /B
)

call :launch_programs
call :main

goto :eof

:: functions def
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
