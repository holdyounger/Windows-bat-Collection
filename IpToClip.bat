@echo off

for /f "tokens=4" %%a in (' route print ^| findstr 0.0.0.0.*0.0.0.0 ^| findstr /v "Ĭ��" ') do (set IP=%%a)

echo ��ľ�����IP�ǣ� %IP%

echo %IP% | clip

timeout /t 3