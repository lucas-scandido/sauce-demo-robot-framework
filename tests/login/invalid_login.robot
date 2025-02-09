*** Settings ***
Documentation    Test suite to verify a invalid login scenarios.
...              Ensuring the system behaves correctly by rejecting invalid and 
...              empty credentials.

Resource         ../../resources/common/common.resource

Test Setup       Start Session
Test Teardown    Close Session
Test Template    Invalid And Empty Login

*** Variables ***
${INVALID_USERNAME}    sauced_user
${INLVAID_PASSWORD}    sauced_password

*** Test Cases ***       USERNAME               PASSWORD               ALERT
Invalid Both Fields      ${INVALID_USERNAME}    ${INLVAID_PASSWORD}    general
Invalid Username         ${INVALID_USERNAME}    ${PASSWORD}            general
Invalid User Password    ${USERNAME}            ${INLVAID_PASSWORD}    general
Empty Username           ${EMPTY}               ${EMPTY}               username
Empty Password           ${USERNAME}            ${EMPTY}               password
Empty Both Fields        ${EMPTY}               ${EMPTY}               username

*** Keywords ***
Invalid And Empty Login
    [Arguments]    ${username}    ${password}    ${error}
    ${alert}    Get fixture     login    alerts    invalidLogin
    Go To Login Page
    Input Username           ${username}    
    Input User Password      ${password}
    Submit Login 
    Alert Error Should Be    ${alert}[${error}]