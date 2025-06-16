@echo off

for /f "tokens=4" %%a in (' route print ^| findstr 0.0.0.0.*0.0.0.0 ^| findstr /v "默认" ') do (set IP=%%a)

echo 你的局域网IP是： %IP%

echo %IP% | clip

timeout /t 3pause