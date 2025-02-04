*** Settings ***
Documentation    This test suite verifies the Login of the "Sauce Demo" application.

Resource         ../helpers/secrets.robot
Resource         ../resources/common.resource
Resource         ../resources/login.resource

Test Setup       Start Session
Test Teardown    Close Session

*** Test Cases ***
Scenario: User logs in with valid credentials and is redirected to the home page
    [Documentation]    Validates that a user can successfully log in using valid 
    ...    credentials and is redirected to the home page.
    [Tags]                                         successful_login
    
    Go To                                          url=${BASE_URL}
    Submit login form                              ${USERNAME}    ${PASSWORD}     
    User should be redirected to the home page

    Capture Page Screenshot

Scenario: User attempts to log in without entering credentials and sees an error message
    [Documentation]    Validates that the system displays an appropriate error message 
    ...    when the login is attempted without entering username and password.
    [Tags]                      invalid_login                  
    
    ${alerts}                   Get fixture    alerts     messages
    
    Go To                       url=${BASE_URL}
    Submit login form           ${EMPTY}    ${EMPTY}     
    Alert error should be       ${alerts}[login][username]  

    Capture Page Screenshot

Scenario: User attempts to log in with an invalid username and sees an error message
    [Documentation]    Validates that the system displays an appropriate error message 
    ...    when the login is attempted with an invalid username.
    [Tags]                      invalid_username
    
    ${alerts}                   Get fixture    alerts          messages
    ${credentials}              Get fixture    credentials     invalidCredentials
    
    Go To                       url=${BASE_URL}
    Submit login form           ${credentials}[username]       ${PASSWORD} 
    Alert error should be       ${alerts}[login][general] 
    
    Capture Page Screenshot

Scenario: User attempts to log in with an invalid password and sees an error message
    [Documentation]    Validates that the system displays an appropriate error message 
    ...    when the login is attempted with an invalid password.
    [Tags]                      invalid_password
    
    ${alerts}                   Get fixture    alerts          messages
    ${credentials}              Get fixture    credentials     invalidCredentials

    Go To                       url=${BASE_URL}
    Submit login form           ${USERNAME}    ${credentials}[password]
    Alert error should be       ${alerts}[login][general]  

    Capture Page Screenshot

Scenario: User attempts to log in without entering a username and sees an error message
    [Documentation]    Validates that the system displays an appropriate error message 
    ...    when the login is attempted without entering a username.
    [Tags]                   empty_username
    
    ${alerts}                Get fixture    alerts     messages
    
    Go To                    url=${BASE_URL}
    Submit login form        ${EMPTY}     ${PASSWORD}     
    Alert error should be    ${alerts}[login][username] 

    Capture Page Screenshot

Scenario: User attempts to log in without entering a password and sees an error message
    [Documentation]    Validates that the system displays an appropriate error message 
    ...    when the login is attempted without entering a password.
    [Tags]                   empty_password
    
    ${alerts}                Get fixture    alerts     messages
    
    Go To                    url=${BASE_URL}
    Submit login form        ${USERNAME}    ${EMPTY}      
    Alert error should be    ${alerts}[login][password] 

    Capture Page Screenshot