*** Settings ***
Library      SeleniumLibrary

Resource     ../../resources/common/common.resource

Variables    ../../helpers/locators/locators.py

*** Keywords ***
Cart Action
    [Arguments]    ${inventory_name}    ${btn_inventory}    ${btn_item}
    ${btn_type} =    Set Variable    ${btn_inventory.replace('{}', "${inventory_name}")}
    ${btn_inventory_visibility} =    Run Keyword And Return Status    Element Should Be Visible    ${btn_type}
    ${btn_inventory_is_enabled} =    Run Keyword And Return Status    Element Should Be Enabled    ${btn_type}
    ${btn_item_visibility} =         Run Keyword And Return Status    Element Should Be Visible    ${btn_item}
    ${btn_item_is_enabled} =         Run Keyword And Return Status    Element Should Be Enabled    ${btn_item}
    Run Keyword If    ${btn_inventory_visibility} and ${btn_inventory_is_enabled}    Click Button    ${btn_type}
    ...    ELSE IF    ${btn_item_visibility} and ${btn_item_is_enabled}    Click Button    ${btn_item}

Add To Cart
    [Arguments]    ${inventory_name}
    Cart Action    ${inventory_name}    ${BTN_ADD_INVENTORY_TO_CART}    ${BTN_ADD_ITEM_TO_CART}

Remove From Cart
    [Arguments]    ${inventory_name}
    Cart Action    ${inventory_name}    ${BTN_REMOVE_INVENTORY_FROM_CART}    ${BTN_REMOVE_ITEM_FROM_CART}

Add Multiples Inventorys To Cart
    [Arguments]    @{selectors}
    FOR    ${inventory}    IN    @{selectors}
        Add To Cart              ${inventory}
    END

Remove Multiples Inventorys From Cart
    [Arguments]    @{selectors}
    FOR    ${inventory}    IN    @{selectors}
        Remove From Cart         ${inventory}
    END

Cart Badge Count Should Be
    [Arguments]    ${expected_count}
    Run Keyword If    ${expected_count} > 0    Element Text Should Be    ${CART_BADGE}    ${expected_count}
    ...    ELSE    Element Should Not Be Visible    ${CART_BADGE}

Go To Cart
    Check Element State    ${CART_BADGE}
    Click Element          ${CART_BADGE}

Cart details
    [Arguments]    ${inventory_name}    ${inventory_description}    ${inventory_price}
    Get Inventory Items Details    ${inventory_name}    ${inventory_description}    ${inventory_price}
    Check Element State            ${BTN_REMOVE_ITEM_FROM_CART}
    Check Element State            ${BTN_CONTINUE_SHOPPING}
    Check Element State            ${BTN_CHECKOUT}