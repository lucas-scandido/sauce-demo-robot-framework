*** Settings ***
Documentation    This test suite verifies the Cart page of the "Sauce Demo" application.

Resource         ../helpers/secrets.robot
Resource         ../resources/common.resource
Resource         ../resources/login.resource
Resource         ../resources/inventory.resource
Resource         ../resources/cart.resource

Test Setup       Start Session
Test Teardown    Close Session

*** Test Cases ***
Scenario: User should add an inventory to the cart through the inventory screen
    [Documentation]    Validates that an inventory item has been added to the cart 
    ...    and displays the quantity badge.
    [Tags]                        add_inventory_to_cart
    
    Go To                         url=${BASE_URL}
    Submit login form             ${USERNAME}    ${PASSWORD}
    Add to cart
    Cart badge should be equal    1     

Scenario: User should remove an inventory to the cart through the inventory screen
    [Documentation]    Validates that an inventory item has been removed to the cart 
    ...    and not displays the quantity badge.
    [Tags]    remove_inventory_to_cart
    
    Go To                         url=${BASE_URL}
    Submit login form             ${USERNAME}    ${PASSWORD}
    Add to cart
    Cart badge should be equal    1
    Remove from cart
    Cart badge should be equal    0

    Capture Page Screenshot    

Scenario: User should add an inventory to the cart through the inventory item screen
    [Documentation]    Validates that an inventory item has been added to the cart 
    ...    through the inventory item screen and not displays the quantity badge.
    [Tags]                        add_inventory_to_cart
    
    ${inventory}                  Get fixture  inventory  inventorys
    
    Go To                         url=${BASE_URL}
    Submit login form             ${USERNAME}    ${PASSWORD}
    Click on inventory item       ${inventory}[0][name]
    Add To Cart
    Cart badge should be equal    1    

Scenario: User should remove an inventory to the cart through the inventory item screen
    [Documentation]    Validates that an inventory item has been removed to the cart 
    ...     through the inventory item screen and not displays the quantity badge.
    [Tags]                        add_inventory_to_cart
    
    ${inventory}                  Get fixture  inventory  inventorys

    Go To                         url=${BASE_URL}
    Submit login form             ${USERNAME}    ${PASSWORD}
    Click on inventory item       ${inventory}[0][name]
    Add To Cart
    Cart badge should be equal    1
    Remove from cart
    Cart badge should be equal    0 