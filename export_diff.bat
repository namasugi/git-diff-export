@echo off
setlocal enabledelayedexpansion
del ../archive/diff.txt
set PAD=2
set TODAY=%date:~0,4%%date:~5,2%%date:~8,2%

if "%2" EQU "" (
  set PARAM1=HEAD
  set PARAM2=%1
) else (
  set PARAM1=%1
  set PARAM2=%2
)

set RET_DIR=
for /F "usebackq" %%i in (`git diff --name-only %PARAM1% %PARAM2%`) do (
  set RET_DIR=!RET_DIR! "%%i"
  echo %%i >> ../archive/diff.txt
)

for /l %%i in (1, 1, 99) do (
  set num=00000%%i
  set filename=../archive/%TODAY%!num:~-%PAD%!/
  IF NOT EXIST !filename! (
    CALL :git_out
    exit \b
  )
)
exit \b


:git_out
git checkout-index -f --prefix=!filename! %PARAM1% %RET_DIR%
exit \b