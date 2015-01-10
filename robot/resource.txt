*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         localhost:3000
${BROWSER}        Firefox
${DELAY}          0
${VALID USER}     teamplay.tool@gmail.com
${VALID PASSWORD}    admin432
${LOGIN URL}      http://${SERVER}/users/sign_in
${WELCOME URL}    http://${SERVER}/
${ERROR URL}      http://${SERVER}/error.html

*** Keywords ***
Open Browser To Welcome Page
    Open Browser    ${WELCOME URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    user_email    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    user_password    ${password}

Submit Credentials
    Click Button    name=commit

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Page Should Contain    Signed in successfully

Login Page Should Be Open
    Location Should Be    ${LOGIN URL}
    Page Should Contain    You need to sign in or sign up before continuing


Login Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page

