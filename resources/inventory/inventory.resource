*** Settings ***
Library      SeleniumLibrary
Library      ../../helpers/libs/inventory/inventory.py

Resource     ../../resources/common/common.resource

Variables    ../../helpers/locators/locators.py

*** Keywords ***
Get Inventory Count
    ${count}    Get Element Count    ${INVENTORY_DIV}
    RETURN      ${count}

Inventory Count Should Be
    [Arguments]    ${expected_count}
    Wait Until Element Is Visible    ${INVENTORY_DIV}
    ${count}    Get Inventory Count
    Should Be Equal As Numbers       ${count}    ${expected_count}

Get Inventory Items Details
    [Arguments]    ${inventory_name}    ${inventory_description}    ${inventory_price}
    ${name_locator} =   Set Variable           ${INVENTORY_ITEM_NAME.replace('{}', "${inventory_name}")}
    ${description_locator} =   Set Variable    ${INVENTORY_ITEM_DESC.replace('{}', "${inventory_description}")}
    ${price_locator} =   Set Variable          ${INVENTORY_ITEM_PRICE.replace('{}', "${inventory_price}")}
    Check Element Details                      ${name_locator}           ${inventory_name}
    Check Element Details                      ${description_locator}    ${inventory_description}
    Check Element Details                      ${price_locator}          ${inventory_price}

Check Inventory Details
    [Arguments]    ${selector_name}    ${inventory}    ${expected_count}
    Validate Invetory Details        ${inventory}
    Validate Buttons Details         ${selector_name}
    Inventory Count Should Be        ${expected_count}

Check Inventory Item Details 
    [Arguments]    ${inventory_name}    ${inventory_description}    ${inventory_price}
    Get Inventory Items Details    ${inventory_name}    ${inventory_description}    ${inventory_price}
    Check Element State            ${BTN_ADD_ITEM_TO_CART}

Choose Inventory
    [Arguments]    ${inventory_name}
    ${locator} =    Set Variable    ${INVENTORY_ITEM.replace('{}', "${inventory_name}")}
    Check Element State       ${locator}
    Element Text Should Be    ${locator}    ${inventory_name}
    Click Element             ${locator}