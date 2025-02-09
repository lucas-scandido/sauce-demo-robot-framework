*** Settings ***
Documentation    Test suite to verify a valid login and and checks that user 
...              should be redirect to the home page, ensuring the login has 
...              been successfully.

Library           OperatingSystem

Resource         ../../resources/common/common.resource

Test Setup       Start Session
Test Teardown    Close Session

*** Test Cases ***
Valid Login
    [Tags]                 successfull_login 
    Go To Login Page
    Input Username         ${USERNAME}
    Input User Password    ${PASSWORD}
    Submit Login     
    Should Be Redirected To The Home Page