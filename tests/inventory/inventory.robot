*** Settings ***
Documentation    Test suite verify the invetory page and invetory page details. 
...              It verifies that exactly six products are visible and validates 
...              the name, description, price of each item. 

Resource         ../../resources/common/common.resource

Test Setup       Start Session
Test Teardown    Close Session

*** Test Cases ***
Display Inventory Screen Items
    [Tags]    inventory_list
    Go To Login Page
    Application Login            ${USERNAME}    ${PASSWORD}
    Inventory Count Should Be    6

Validate Inventory Item Details Of Each Item
    [Tags]    inventory_details
    ${inventory}                Get Fixture      inventory    inventory_list    products
    ${add_to_cart_selectors}    Get Fixture      cart         selectors         btnAddToCart
    Go To Login Page
    Application Login          ${USERNAME}                 ${PASSWORD}
    Check Inventory Details    ${add_to_cart_selectors}    ${inventory}    6 

Choose Inventory And Validate Details 
    [Tags]    inventory_item_details
    ${inventory}    Get fixture     inventory    inventory_list    products
    Go To Login Page
    Application Login               ${USERNAME}    ${PASSWORD}
    Choose Inventory                ${inventory}[0][name]
    Check Inventory Item Details    ${inventory}[0][name]    ${inventory}[0][description]    ${inventory}[0][price]