@echo off
setlocal enabledelayedexpansion

echo ��ʼ��������ǰĿ¼Ϊ: %cd%

REM ����һ����ʱ�ļ��У����ڲ���Ȩ��
set "testFolder=C:\Windows\System32\AdminTest1"

REM ���Դ���һ���ļ���
mkdir "%testFolder%" 2>nul

REM ����Ƿ�ɹ�����
if exist "%testFolder%" (
    rmdir "%testFolder%"
) else (
    echo ��ǰ����û�й���ԱȨ��,��������
	pause
	goto:eof
)

for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

:start

:: ��ʾ�û�ѡ��
call :ColorText 02 "��ѡ��һ��ѡ�"
echo.
echo 1: �������
echo 2: ���ڵ���
echo 3: �˳�

:: ʹ�� choice �����ȡ�û�����
choice /C 123 /M "���������ѡ��:"

set USER_CHOICE=%ERRORLEVEL%

:: �����û�ѡ��ִ�в�ͬ�Ĵ����߼�
if "%USER_CHOICE%"=="1" (
    echo ��ѡ����ѡ��1
    rem ���������ѡ��1�Ĵ����߼�
	bcdedit.exe -set TESTSIGNING ON
	bcdedit.exe -set loadoptions DDISABLE_INTEGRITY_CHECKS
	bcdedit /set nointegritychecks on
	bcdedit /debug on
	bcdedit /bootdebug on
	rem ����ip
	set /p InputIp="�������������IP��ַ:"
	echo ����IPΪ:!InputIp!
	rem ������Զ˿�
	set /P InputPort="�������ʽ�˿ڵ�ַ:"
	echo ����˿�Ϊ:!InputPort!
	bcdedit /dbgsettings net hostip:!InputIp! port:!InputPort!
	echo ���ֶ��������߱�š��豸��ź͹��ܱ��
	bcdedit
	pause
	goto:eof
)

if "%USER_CHOICE%"=="2" (
	echo test1
    call :ColorText 0b "��ʼ���ô��ڵ��ԣ�"
	bcdedit.exe -set TESTSIGNING ON
	bcdedit.exe -set loadoptions DDISABLE_INTEGRITY_CHECKS
	bcdedit /set nointegritychecks on
	bcdedit /debug on
	bcdedit /bootdebug on
)

if "%USER_CHOICE%"=="3" (
    echo ��ѡ�����˳�
    exit
)

:: ����1Ϊ������´�ӡ��ʾ
if "%~1"=="" (
	call :ColorText 0C "[Error]û���ṩ����1"
	echo.
	
	call :UsagePrint
	echo.
	
	goto:eof
)

goto:eof

:UsagePrint
	call :ColorText 02 "[Usage]:"
	echo.

	call :ColorText 02 "    %~nx0 [OutputDir] [ui version]"
	echo.
goto:eof

:: call :ColorText 0C "red"
:: call :ColorText 0b "blue"
:: call :ColorText 02 "green"
:: call :ColorText 19 "yellow"
:: call :ColorText 2F "black"
:: call :ColorText 4e "white"
:ColorText
@echo off
:: �Ƴ�ð��
set "input=%~2"
set "input=!input::=��!"
<nul set /p ".=%DEL%" > "!input!"
findstr /v /a:%1 /R "^$" "!input!" nul
del "!input!" > nul 2>&1
goto :eof

pause