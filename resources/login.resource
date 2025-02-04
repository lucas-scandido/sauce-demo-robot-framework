*** Settings ***
Library     SeleniumLibrary

Variables   ../helpers/locators/locators.py

*** Keywords ***

Submit login form
    [Arguments]         ${username}          ${password}
    
    Input Text          ${INPUT_USERNAME}    ${username}
    Input Password    	${INPUT_PASSWORD}    ${password}
    Click Button        ${LOGIN_BUTTON} 

User should be redirected to the home page
    Wait Until Element Is Visible    ${HOME_PAGE_LOGO}

Alert error should be
    [Arguments]               ${expected_alert}
    
    Element Text Should Be    ${ALERT_ERROR}    ${expected_alert}
    ${alert_color}=           Execute Javascript    
    ...    return window.getComputedStyle(document.querySelector('${ALERT_CONTAINER}')).backgroundColor;
    Should Be Equal           ${alert_color}    rgb(226, 35, 26)