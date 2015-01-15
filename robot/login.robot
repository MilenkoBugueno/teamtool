*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               valid_login.txt file.
Resource          resource.robot
Test Teardown     Close Browser

*** Test Cases ***
Welcome Page
    When I open the Browser to Teamtool page
    Then I see the login page

Registration Page
    Given I open the Browser to Teamtool page
    When I click the Register Button
    Then registration page should be open

Valid Registration
    Given browser is opened to registration page
    When I register with first name "Mike", surname "Mueller", user name "Mike", email "mike@example.com", password "changeme" and confirmation "changeme"
    Then welcome page should be open
    And I see the message: "A message with a confirmation link has been sent to your email address"

Not Valid Registration
    Given browser is opened to registration page
    When I register without inputs
    Then I see the message: "5 errors prohibited this user from being saved"
    And I see the message: "Name can't be blank"
    And I see the message: "Surname can't be blank"
    And I see the message: "User name can't be blank"
    And I see the message: "Email can't be blank"
    And I see the message: "Password can't be blank"

Registration Without Surname and UserName
    Given browser is opened to registration page
    When I register with first name "Lee", surname "", user name "", email "lee@example.com", password "changeme" and confirmation "changeme"
    Then I see the message: "2 errors prohibited this user from being saved"
    And I see the message: "Surname can't be blank"
    And I see the message: "User name can't be blank"

Mismatched Password Confirmation
    Given browser is opened to registration page
    When I register with first name "Tomy", surname "Moreno", user name "Toma", email "tomy@example.com", password "changeme" and confirmation "different"
    Then I see the message: "1 error prohibited this user from being saved"
    And I see the message: "Password confirmation doesn't match Password"


Too Short Password
    Given browser is opened to registration page
    When I register with first name "Rose", surname "Klein", user name "Klein", email "klein@example.com", password "short" and confirmation "short"
    Then I see the message: "Password is too short (minimum is 8 characters)"

Registration with Wrong Email
    Given browser is opened to registration page
    When I register with first name "Rose", surname "Klein", user name "Klein", email "klein", password "changeme" and confirmation "changeme"
    Then I see the message: "Please include an '@' in the email address"


Valid Login
    I open the Browser to Teamtool page
    When I log in as "${VALID USER}" with password "${VALID PASSWORD}"
    Then welcome page should be open
    And I see the message: "Signed in successfully"

Not Valid User and Password
    I open the Browser to Teamtool page
    When I log in as "not_valid@example.com" with password "not valid psw"
    Then I see the message: "Invalid email or password"


*** Keywords ***
I open the Browser to Teamtool page
    Open browser to welcome page

Browser is opened to registration page
    Open browser to registration page

I log in as "${username}" with password "${password}"
    Input user name    ${username}
    Input password    ${password}
    Submit credentials

I register with first name "${firstname}", surname "${surname}", user name "${username}", email "${email}", password "${psw}" and confirmation "${con}"
    Input Text    user_name    ${firstname}
    Input Text    user_surname    ${surname}
    Input Text    user_user_name    ${username}
    Input Text    user_email    ${email}
    Input Text    user_password    ${psw}
    Input Text    user_password_confirmation    ${con}
    Submit credentials


I register without inputs
    Submit credentials

I click the Register Button
    Click Link    link=Register

Registration page should be open
    Location Should Be    ${REGISTRATION URL}
    Page Should Contain    Register

I see the message: "${msg}"
    Page Should Contain    ${msg}