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
${DELAY}          0.4
${LOGIN URL}      http://${SERVER}/users/sign_in
${REGISTRATION URL}      http://${SERVER}/users/sign_up
${NEW PASSWORD URL}      http://${SERVER}/users/password/new
${WELCOME URL}    http://${SERVER}/
${ERROR URL}      http://${SERVER}/error.html

*** Keywords ***
Open Browser To Welcome Page
    Open Browser    ${WELCOME URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    I see the login page

Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

Open Browser To Registration Page
    Open Browser    ${REGISTRATION URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Registration Page Should Be Open

Open Browser To New Password Page
    Open Browser    ${NEW PASSWORD URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Location Should Be    ${NEW PASSWORD URL}


Go To Login Page
    Go To    ${LOGIN URL}
    I see the login page

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


I see the login page
    Location Should Be    ${WELCOME URL}
    Page Should Contain    Welcome to the Teamtool

Registration Page Should Be Open
    Location Should Be    ${REGISTRATION URL}

Login Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page

