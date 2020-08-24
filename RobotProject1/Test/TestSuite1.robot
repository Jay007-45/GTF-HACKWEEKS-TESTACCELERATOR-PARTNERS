*** Settings ***
Library    SeleniumLibrary
Suite Setup    Log    I'm inside the Suite Set Up
Suite Teardown    Log    I'm inside the Suite Tear Down
Test Setup    Log    I'm inside the Test Set Up
Test Teardown    Log    I'm inside the Test Tear Down

Default Tags    Sanity                

*** Test Cases ***
    
OrangeLoginTest
    [Documentation]    Orange login test
    Open Browser        ${URL}    chrome
    Set Browser Implicit Wait    5
    Login
    Click Element       id=welcome
    Click Element       link=Logout
    Close Browser
    Log                 Test Completed
    Log    This test was executed by %{username} on %{os}
    
*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
Login
    Input Text          id=txtUsername    ${LOGINDATA}[username]
    Input Password      id=txtPassword    ${LOGINDATA}[password]
    Click Button        id=btnLogin
    