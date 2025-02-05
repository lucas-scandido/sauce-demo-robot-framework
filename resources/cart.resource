*** Settings ***
Library      SeleniumLibrary

Resource     ../resources/common.resource

Variables    ../helpers/locators/locators.py

*** Keywords ***

Add To Cart
    [Arguments]    ${inventory_name}

    ${btn_add_to_cart} =   Set Variable           ${BTN_ADD_INVENTORY_TO_CART.replace('{}', "${inventory_name}")}    
    
    ${btn_inventory_visibility}=         Run Keyword And Return Status    Element Should Be Visible    ${btn_add_to_cart}
    ${btn_inventory_is_enabled}=         Run Keyword And Return Status    Element Should Be Enabled    ${btn_add_to_cart}
    ${btn_inventory_item_visibility}=    Run Keyword And Return Status    Element Should Be Visible    ${BTN_ADD_ITEM_TO_CART}
    ${btn_inventory_item_is_enabled}=    Run Keyword And Return Status    Element Should Be Enabled    ${BTN_ADD_ITEM_TO_CART}
    
    Run Keyword If    ${btn_inventory_visibility} and ${btn_inventory_is_enabled}   Click Button    ${btn_add_to_cart}
    ...    ELSE IF    ${btn_inventory_item_visibility} and ${btn_inventory_item_is_enabled}    Click Button    ${BTN_ADD_ITEM_TO_CART}

Cart badge should be equal
    [Arguments]    ${expected_count}

    Run Keyword If    ${expected_count} > 0
    ...    Element Text Should Be           ${CART_BADGE}    ${expected_count}
    ...    ELSE
    ...    Element Should Not Be Visible    ${CART_BADGE}

Remove from cart
    [Arguments]    ${inventory_name}

    ${btn_remove_to_cart} =   Set Variable           ${BTN_REMOVE_INVENTORY_FROM_CART.replace('{}', "${inventory_name}")}    
    
    ${btn_inventory_visibility}=         Run Keyword And Return Status    Element Should Be Visible    ${btn_remove_to_cart}
    ${btn_inventory_is_enabled}=         Run Keyword And Return Status    Element Should Be Enabled    ${btn_remove_to_cart}
    ${btn_inventory_item_visibility}=    Run Keyword And Return Status    Element Should Be Visible    ${BTN_REMOVE_ITEM_FROM_CART}
    ${btn_inventory_item_is_enabled}=    Run Keyword And Return Status    Element Should Be Enabled    ${BTN_REMOVE_ITEM_FROM_CART}

    Run Keyword If    ${btn_inventory_visibility} and ${btn_inventory_is_enabled}   Click Element    ${btn_remove_to_cart}
    ...    ELSE IF    ${btn_inventory_item_visibility} and ${btn_inventory_item_is_enabled}    Click Element    ${BTN_REMOVE_ITEM_FROM_CART}

Go to the cart
    Element Should Be Visible    ${CART_BADGE}
    Element Should Be Enabled    ${CART_BADGE}
    Click Element                ${CART_BADGE}

Cart details
    [Arguments]    ${inventory_name}    ${inventory_description}    ${inventory_price}
        
    Checks details of inventory items   ${inventory_name}    ${inventory_description}    ${inventory_price}
    
    Element Should Be Visible    ${BTN_REMOVE_ITEM_FROM_CART}
    Element Should Be Enabled    ${BTN_REMOVE_ITEM_FROM_CART}

    Element Should Be Visible    ${BTN_CONTINUE_SHOPPING}
    Element Should Be Enabled    ${BTN_CONTINUE_SHOPPING}

    Element Should Be Visible    ${BTN_CHECKOUT}
    Element Should Be Enabled    ${BTN_CHECKOUT}