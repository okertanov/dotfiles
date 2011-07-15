@echo off  2>&1 > NUL
@color 08  2>&1 > NUL
@chcp 1251 2>&1 > NUL
setlocal enabledelayedexpansion


rem ***************************************************************************
rem *                                                                         *
rem *  Copyright (c) 2011 A&H Software House, Inc. All Rights Reserved.       *
rem *                                                                         *
rem *  The batch-file to obtain issue's summary using JIRA commandline client *
rem *                                                                         *
rem *  Usage:                                                                 *
rem *          j-b.cmd issue_id                                               *
rem *                                                                         *
rem *  Example:                                                               *
rem *          j-b.cmd BUG-2211                                               *
rem *                                                                         *
rem *  Notes:                                                                 *
rem *          1. "jira-cli-2.0.0\jira.bat" should be somewhere in %PATH%     *
rem *          2. "jira-token" and "jira-user" files are used for caching     *
rem *                                                                         *
rem ***************************************************************************


@set JSERVER="http://jira"
@set JUSER=undefined
@set JPASS=undefined
@set JTOKEN=
@set BNAME=%~dp0
@set JTOKENFILE=%BNAME%\jira-token
@set JUSERFILE=%BNAME%\jira-user

@set ISSUE_ID=%1

rem ***************************************************************************
rem ******************************* main **************************************
rem ***************************************************************************
:main
if [%ISSUE_ID%]==[] (
    call :LOG Error: Issue ID is not defined. & call :done 1
)

call :user
call :token

call :LOG %ISSUE_ID% using auth: %JUSER%/%JTOKEN% and %JCONNECTION%
call jira %JCONNECTION% --action getServerInfo
call jira %JCONNECTION% --action getIssue --issue %ISSUE_ID%
call jira %JCONNECTION% --action getFieldValue --issue %ISSUE_ID% --field "Summary"

call :done 0
rem :main

rem ***************************************************************************
rem ******************************* done **************************************
rem ***************************************************************************
:done
    set RC=%1
    if [%RC%]==[] set RC=0
    exit %RC%
rem :done

rem ***************************************************************************
rem ******************************* user **************************************
rem ***************************************************************************
:user
    if exist %JUSERFILE% (
        for /F "tokens=* delims=" %%u in (%JUSERFILE%) do (
            if "%%u" EQU "" (
                call :LOG Info: jira user string not found. & call :login
                exit /b 1
            ) else (
                call :LOG Info: jira user string found.
                set JUSER=%%u
                exit /b 0
            )
        )
    ) else (
        call :LOG Info: jira user file not found. & call :login
        exit /b 1
    )
    exit /b 1
rem :user

rem ***************************************************************************
rem ******************************* token *************************************
rem ***************************************************************************
:token
    if exist %JTOKENFILE% (
        for /F "tokens=* delims=" %%t in (%JTOKENFILE%) do (
            if "%%t" EQU "" (
                call :LOG Info: jira token string not found. & call :login
                exit /b 1
            ) else (
                call :LOG Info: jira token string found.
                set JTOKEN=%%t
                set JCONNECTION=--server %JSERVER% --user %JUSER% --password "" --login !JTOKEN!
                exit /b 0
            )
        )
    ) else (
        call :LOG Info: jira token file not found. & call :login
        exit /b 1
    )
    exit /b 1
rem :token


rem ***************************************************************************
rem ******************************* login *************************************
rem ***************************************************************************
:login
    @set /p JUSER="jira user> "

    if "%JUSER%" EQU "" (
        call :LOG Error: Username can't be empty. & call :done 1
    ) else (
        echo %JUSER% > %JUSERFILE%
    )

    @set /p JPASS="jira password> "

    if "%JPASS%" EQU "" (
        call :LOG Error: Password can't be empty. & call :done 1
    )

    set JTOKEN=password
    set JCONNECTION=--server %JSERVER% --user %JUSER% --password %JPASS%
    call :LOG %ISSUE_ID% using auth: %JUSER%/%JTOKEN% and %JCONNECTION%
    call jira %JCONNECTION% --action login > %JTOKENFILE%
    if %errorlevel% NEQ 0 (
        del %JTOKENFILE%
    )
    exit /b 0
rem :login

rem ***************************************************************************
rem ******************************* LOG ***************************************
rem ***************************************************************************
:LOG
    echo %*
    exit /b 0
rem :LOG

rem ***************************************************************************
rem ******************************* EOF ***************************************
rem ***************************************************************************

