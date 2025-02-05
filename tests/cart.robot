*** Settings ***
Documentation    This test suite verifies the Cart page of the "Sauce Demo" application.

Resource         ../helpers/secrets.robot
Resource         ../resources/common.resource

Test Setup       Start Session
Test Teardown    Close Session

*** Test Cases ***
Scenario: User should add an inventory to the cart through the inventory screen
    [Documentation]    Validates that an inventory item has been added to the cart 
    ...    and displays the quantity badge.
    [Tags]                        add_to_cart_via_inventory

    ${cart}                       Get fixture  cart       btnAddToCart
    
    Go To                         url=${BASE_URL}
    Submit login form             ${USERNAME}    ${PASSWORD}
    Add to cart                   ${cart}[0][name]
    Cart badge should be equal    1

    Capture Page Screenshot      

Scenario: User should remove an inventory from the cart through the inventory screen
    [Documentation]    Validates that an inventory item has been removed from the cart 
    ...    and not displays the quantity badge.
    [Tags]                        remove_from_cart_via_inventory
    
    ${cart}                       Get fixture  cart       btnAddToCart

    Go To                         url=${BASE_URL}
    Submit login form             ${USERNAME}    ${PASSWORD}
    Add to cart                   ${cart}[0][name]
    Cart badge should be equal    1
    Remove from cart              ${cart}[0][name]
    Cart badge should be equal    0

    Capture Page Screenshot    

Scenario: User should add an inventory to the cart through the inventory item screen
    [Documentation]    Validates that an inventory item has been added to the cart 
    ...    through the inventory item screen and displays the quantity badge.
    [Tags]                        add_inventory_to_cart
    
    ${inventory}                  Get fixture  inventory  inventorys
    ${cart}                       Get fixture  cart       btnAddToCart
    
    Go To                         url=${BASE_URL}
    Submit login form             ${USERNAME}    ${PASSWORD}
    Click on inventory item       ${inventory}[0][name]
    Add to cart                   ${cart}[0][name]
    Cart badge should be equal    1    

    Capture Page Screenshot

Scenario: User should remove an inventory from the cart through the inventory item screen
    [Documentation]    Validates that an inventory item has been removed from the cart 
    ...     through the inventory item screen and not displays the quantity badge.
    [Tags]                        remove_inventory_from_cart
    
    ${inventory}                  Get fixture  inventory  inventorys
    ${cart}                       Get fixture  cart       btnAddToCart

    Go To                         url=${BASE_URL}
    Submit login form             ${USERNAME}    ${PASSWORD}
    Click on inventory item       ${inventory}[0][name]
    Add to cart                   ${cart}[0][name]
    Cart badge should be equal    1
    Remove from cart              ${cart}[0][name]
    Cart badge should be equal    0

    Capture Page Screenshot

Scenario: User should add more than one inventory to the cart
    [Documentation]    Validates that more than one inventory has been added to the cart
    ...    and displays the quantity badge.
    [Tags]                        add_multiple_inventory_to_cart
    
    ${inventory}                  Get fixture  inventory  inventorys
    ${cart}                       Get fixture  cart       btnAddToCart

    Go To                         url=${BASE_URL}
    Submit login form             ${USERNAME}    ${PASSWORD}
    Add to cart                   ${cart}[0][name]
    Add to cart                   ${cart}[1][name]
    Cart badge should be equal    2

    Capture Page Screenshot  

Scenario: User should remove more than one inventory from the cart
    [Documentation]    Validates that more than one inventory has been removed from the cart
    ...    and not displays the quantity badge.
    [Tags]                        remove_multiple_inventory_from_cart
    
    ${inventory}                  Get fixture  inventory  inventorys
    ${cart}                       Get fixture  cart       btnAddToCart

    Go To                         url=${BASE_URL}
    Submit login form             ${USERNAME}    ${PASSWORD}
    Add to cart                   ${cart}[0][name]
    Add to cart                   ${cart}[1][name]
    Cart badge should be equal    2
    Remove from cart              ${cart}[0][name]
    Remove from cart              ${cart}[1][name]
    Cart badge should be equal    0
    
    Capture Page Screenshot  

Scenario: Should add an inventory to the cart and validate the details
    [Documentation]    Validates that an inventory has been added to the cart 
    ...     and validate the inventory details: name, description and price. 
    [Tags]              cart_details
    
    ${inventory}        Get fixture  inventory  inventorys
    ${cart}             Get fixture  cart       btnAddToCart

    Go To               url=${BASE_URL}
    Submit login form   ${USERNAME}    ${PASSWORD}
    Add to cart         ${cart}[0][name]
    Go to the cart
    Cart details        ${inventory}[0][name]    ${inventory}[0][description]    ${inventory}[0][price]

    Capture Page Screenshot  