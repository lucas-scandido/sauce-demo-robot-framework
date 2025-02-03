*** Settings ***
Library     SeleniumLibrary

Variables   ../helpers/locators/locators.py

*** Keywords ***

Display inventory items
    [Arguments]    ${expected_count}
    
    Wait Until Element Is Visible    ${INVENTORY_DIV}
    ${count}    Get Element Count    ${INVENTORY_DIV}
    Should Be Equal As Numbers       ${count}    ${expected_count}

Checks details of inventory items
    [Arguments]    ${inventory_name}    ${inventory_description}    ${inventory_price}
    
    ${name_locator} =   Set Variable           ${INVENTORY_ITEM_NAME.replace('{}', "${inventory_name}")}
    Element Should Be Visible                  ${name_locator}
    Element Text Should Be                     ${name_locator}           ${inventory_name}

    ${description_locator} =   Set Variable    ${INVENTORY_ITEM_DESC.replace('{}', "${inventory_description}")}
    Element Should Be Visible                  ${description_locator}
    Element Text Should Be                     ${description_locator}    ${inventory_description}

    ${price_locator} =   Set Variable          ${INVENTORY_ITEM_PRICE.replace('{}', "${inventory_price}")}
    Element Should Be Visible                  ${price_locator}
    Element Text Should Be                     ${price_locator}          ${inventory_price}

Display inventory details
    [Arguments]    ${inventory_name}    ${inventory_description}    ${inventory_price}    ${expected_count}
        
    Checks details of inventory items   ${inventory_name}    ${inventory_description}    ${inventory_price}
    
    Wait Until Element Is Visible    ${BTN_BUY_INVENTORY}
    Element Should Be Enabled        ${BTN_BUY_INVENTORY}
    ${count}    Get Element Count    ${BTN_BUY_INVENTORY}
    Should Be Equal As Numbers       ${count}    ${expected_count}

Click on inventory
    [Arguments]                    ${inventory_name}

    ${locator} =   Set Variable    ${INVENTORY_ITEM.replace('{}', "${inventory_name}")}

    Element Should Be Visible      ${locator}
    Element Text Should Be         ${locator}    ${inventory_name}
    Click Element                  ${locator}

Inventory item details 
    [Arguments]                          ${inventory_name}    ${inventory_description}    ${inventory_price}
    
    Checks details of inventory items    ${inventory_name}    ${inventory_description}    ${inventory_price}

    Wait Until Element Is Visible        ${BTN_BUY_INVENTORY_ITEM}
    Element Should Be Enabled            ${BTN_BUY_INVENTORY_ITEM}