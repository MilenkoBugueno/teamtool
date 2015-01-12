*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               valid_login.txt file.
Resource          resource.robot
Test Teardown     Close Browser

*** Test Cases ***
Welcome Page
    When browser is opened to teamtool page
    Then login page should be open

Registration Page
    Given browser is opened to teamtool page
    When I click the Register Button
    Then registration page should be open

Valid Registration
    Given browser is opened to registration page
    When I register with first name "Mike", surname "Mueller", user name "Mike", email "mike@example.com" and password "changeme"
    Then welcome page should be open
    And following message should be displayed: "A message with a confirmation link has been sent to your email address"

Valid Login
    Given browser is opened to teamtool page
    When user "${VALID USER}" logs in with password "${VALID PASSWORD}"
    Then welcome page should be open
    And following message should be displayed: "Signed in successfully"

*** Keywords ***
Browser is opened to Teamtool page
    Open browser to welcome page

Browser is opened to registration page
    Open browser to registration page

User "${username}" logs in with password "${password}"
    Input user name    ${username}
    Input password    ${password}
    Submit credentials

I register with first name "${firstname}", surname "${surname}", user name "${username}", email "${email}" and password "${psw}"
    Input Text    user_name    ${firstname}
    Input Text    user_surname    ${surname}
    Input Text    user_user_name    ${username}
    Input Text    user_email    ${email}
    Input Text    user_password    ${psw}
    Input Text    user_password_confirmation    ${psw}
    Submit credentials

I click the Register Button
    Click Link    link=Register

Registration page should be open
    Location Should Be    ${REGISTRATION URL}
    Page Should Contain    Register

Following message should be displayed: "${msg}"
    Page Should Contain    ${msg}