@echo off
setlocal ENABLEDELAYEDEXPANSION
:: big5
chcp 950
cls

:: �˦��]�w
set ENABLE=[42m �ҥ� [0m
set DISABLE=[41m ���� [0m

:: �ˬd�O�_���H�޲z�������B��{��
call :test_admin IS_ADMIN

IF %IS_ADMIN% == 0 (
    :: �H�D�޲z�������}�Ҩ�L�{��
	call :launch_programs
	
	echo �ݭn�޲z���v���ާ@WIFI�]�w
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
	set output=%output:�ҥ�=!ENABLE!%
	set output=%output:����=!DISABLE!%
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
