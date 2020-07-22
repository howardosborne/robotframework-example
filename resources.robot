*** Settings ***
Documentation     A resource file with reusable keywords and variables.

Library           SeleniumLibrary

*** Variables ***
${HOST}         https://portal.jerseyfsc.org/
${BROWSER}      Chrome
${DELAY}        0
${HOMEPAGE}     Pages/Home.aspx

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${HOST}  ${BROWSER} 
    Set Selenium Speed    ${DELAY}
    Homepage Should Be Open

Homepage Should Be Open
    Location Should Be    ${HOST}${HOMEPAGE}
    Title Should Be    JFSC Platform Home

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button


