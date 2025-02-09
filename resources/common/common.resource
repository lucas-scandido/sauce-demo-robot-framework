*** Settings ***
Documentation    This file contains common variables and keywords that are used across all test cases.

Library     SeleniumLibrary
Library     JSONLibrary

Resource    ../../resources/login/login.resource
Resource    ../../resources/inventory/inventory.resource
Resource    ../../resources/cart/cart.resource
Resource    ../../resources/checkout/checkout.resource

*** Variables ***
${BASE_URL}       https://www.saucedemo.com/
${USERNAME}       ThisIsNotUserName    
${PASSWORD}       ThisIsNotPassword

*** Keywords ***
Start Session
    Open Browser    browser=chrome

Close Session
    Close Browser

Go To Login Page
    Go To              ${BASE_URL}
    Title Should Be    Swag Labs

Get Fixture
    [Arguments]    ${path}    ${fixture_name}    ${field}
    ${data}        Load JSON From File    
    ...            ${EXECDIR}/helpers/fixtures/${path}/${fixture_name}.json
    RETURN         ${data}[${field}]

Check Element State
    [Arguments]    ${locator}
    Element Should Be Visible    ${locator}
    Element Should Be Enabled    ${locator}

Check Element Details
    [Arguments]    ${locator}    ${expected_text}
    Element Should Be Visible    ${locator}
    Element Text Should Be       ${locator}    ${expected_text}

Button Action
    [Arguments]    ${locator}
    Check Element State    ${locator}
    Click Button           ${locator}
