*** Settings ***
Library      SeleniumLibrary

Resource     ../../resources/common/common.resource

Variables    ../../helpers/locators/locators.py

*** Keywords ***
Input Username
    [Arguments]    ${username}
    Input Text     ${INPUT_USERNAME}    ${username}

Input User Password
    [Arguments]    ${password}
    Input Password    ${INPUT_PASSWORD}     ${password}

Submit Login
    Button Action    ${LOGIN_BUTTON}    

Should Be Redirected To The Home Page
    Wait Until Element Is Visible    ${HOME_PAGE_LOGO}

Alert Error Should Be
    [Arguments]    ${expected_alert}
    
    Check Element Details    ${ALERT_ERROR}    ${expected_alert}
    ${alert_color} =         Execute Javascript    
    ...    return window.getComputedStyle(document.querySelector('${ALERT_CONTAINER}')).backgroundColor;
    Should Be Equal          ${alert_color}    rgb(226, 35, 26)

Application Login
    [Arguments]    ${username}    ${password}
    Input Username         ${username}
    Input User Password    ${password}
    Submit Login            