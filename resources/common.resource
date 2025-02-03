*** Settings ***
Documentation    This file contains common variables and keywords that are used across all test cases.

Library     SeleniumLibrary
Library     JSONLibrary

*** Variables ***
${BASE_URL}                https://www.saucedemo.com/

*** Keywords ***
Start Session
    Open Browser    browser=chrome

Close Session
    Close Browser

Get fixture
    [Arguments]    ${fixture_name}  ${field}
    ${data}        Load Json From File    
    ...            ${EXECDIR}/helpers/fixtures/${fixture_name}.json
    RETURN         ${data}[${field}]