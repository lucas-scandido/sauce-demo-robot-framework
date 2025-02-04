*** Settings ***
Library      SeleniumLibrary

Variables    ../helpers/locators/locators.py

*** Keywords ***

Add To Cart
    ${btn_inventory_visibility}=         Run Keyword And Return Status    Element Should Be Visible    ${BTN_ADD_INVENTORY_TO_CART}
    ${btn_inventory_is_enabled}=         Run Keyword And Return Status    Element Should Be Enabled    ${BTN_ADD_INVENTORY_TO_CART}
    ${btn_inventory_item_visibility}=    Run Keyword And Return Status    Element Should Be Visible    ${BTN_ADD_ITEM_TO_CART}
    ${btn_inventory_item_is_enabled}=    Run Keyword And Return Status    Element Should Be Enabled    ${BTN_ADD_ITEM_TO_CART}
    
    Run Keyword If    ${btn_inventory_visibility} and ${btn_inventory_is_enabled}   Click Element    ${BTN_ADD_INVENTORY_TO_CART}
    ...    ELSE IF    ${btn_inventory_item_visibility} and ${btn_inventory_item_is_enabled}    Click Element    ${BTN_ADD_ITEM_TO_CART}

Cart badge should be equal
    [Arguments]    ${expected_count}

    Run Keyword If    ${expected_count} > 0
    ...    Element Text Should Be           ${CART_BADGE}    ${expected_count}
    ...    ELSE
    ...    Element Should Not Be Visible    ${CART_BADGE}

Remove from cart
    Element Should Be Visible    ${BTN_REMOVE_ITEM_FROM_CART}
    Element Should Be Enabled    ${BTN_REMOVE_ITEM_FROM_CART}
    Click Button                 ${BTN_REMOVE_ITEM_FROM_CART}