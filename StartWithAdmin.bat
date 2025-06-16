@echo off

::获取管理员权限
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

set curpath=%~dp0
set file=ModifyIfm.ps1
set execPath=%curpath%%file%

echo %execPath%
powershell.exe -ExecutionPolicy ByPass -File %execPath%

pause
