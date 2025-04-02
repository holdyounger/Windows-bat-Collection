@echo off

@echo off
for /f "tokens=3" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\360Safe\360EntSecurity" /t REG_SZ /v "m2" ^| findstr "m2    REG_SZ"') do ( set result=%%a )

echo ÄãµÄm2ÊÇ£º %result%

echo %result% | clip

pause