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

Valid Login
    Given browser is opened to teamtool page
    When user "${VALID USER}" logs in with password "${VALID PASSWORD}"
    Then welcome page should be open

*** Keywords ***
Browser is opened to Teamtool page
    Open browser to welcome page

User "${username}" logs in with password "${password}"
    Input user name    ${username}
    Input password    ${password}
    Submit credentials
