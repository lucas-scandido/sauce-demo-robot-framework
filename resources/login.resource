*** Settings ***
Library     SeleniumLibrary
Library     JSONLibrary

Variables   ../helpers/locators/locators.py

*** Keywords ***

Submit login form
    [Arguments]       ${username}          ${password}
    Input Text        ${INPUT_USERNAME}    ${username}
    Input Password    ${INPUT_PASSWORD}    ${password}
    Click Button      ${LOGIN_BUTTON} 

User should be redirected to the home page
    Wait Until Element Is Visible    ${HOME_PAGE_LOGO}

Get fixture
    [Arguments]    ${fixture_name}  ${field}
    ${data}        Load Json From File    
    ...            ${EXECDIR}/helpers/fixtures/${fixture_name}.json
    RETURN         ${data}[${field}]

Alert error should be
    [Arguments]               ${expected_alert}
    Element Text Should Be    ${ALERT_ERROR}    ${expected_alert}
    ${alert_color}=           Execute Javascript    
    ...    return window.getComputedStyle(document.querySelector('${ALERT_CONTAINER}')).backgroundColor;
    Should Be Equal           ${alert_color}    rgb(226, 35, 26)
