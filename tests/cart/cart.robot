*** Settings ***
Documentation    Test suite verify the actions of add and remove inventory 
...              From Cart and also validates the cart details, like
...              quantity bagde, name, description, price and buttons state.

Resource         ../../resources/common/common.resource

Test Setup       Start Session
Test Teardown    Close Session

*** Test Cases ***
Add Inventory To Cart Through The Inventory Screen
    [Tags]    add_to_cart_via_inventory
    ${add_to_cart_selectors}    Get Fixture      cart         selectors         btnAddToCart
    Go To Login Page
    Application Login             ${USERNAME}    ${PASSWORD}
    Add To Cart                   ${add_to_cart_selectors}[0][name]
    Cart Badge Count Should Be    1

Remove Inventory From Cart Through The Inventory Screen  
    [Tags]    remove_from_cart_via_inventory
    ${add_to_cart_selectors}    Get Fixture      cart         selectors         btnAddToCart
    Go To Login Page
    Application Login             ${USERNAME}    ${PASSWORD}
    Add To Cart                   ${add_to_cart_selectors}[0][name]
    Cart Badge Count Should Be    1
    Remove From Cart              ${add_to_cart_selectors}[0][name]
    Cart Badge Count Should Be    0

Add Inventory To Cart Through The Inventory Item Screen  
    [Tags]    add_inventory_to_cart
    ${inventory}                Get Fixture    inventory    inventory_list    products
    ${add_to_cart_selectors}    Get Fixture      cart         selectors         btnAddToCart
    Go To Login Page
    Application Login             ${USERNAME}    ${PASSWORD}
    Choose Inventory              ${inventory}[0][name]
    Add To Cart                   ${add_to_cart_selectors}[0][name]
    Cart Badge Count Should Be    1    

Remove Inventory From Cart Through The Inventory Item Screen 
    [Tags]    remove_inventory_from_cart
    ${inventory}                Get Fixture    inventory    inventory_list    products
    ${add_to_cart_selectors}    Get Fixture      cart         selectors         btnAddToCart
    Go To Login Page
    Application Login             ${USERNAME}    ${PASSWORD}
    Choose Inventory              ${inventory}[0][name]
    Add To Cart                   ${add_to_cart_selectors}[0][name]
    Cart Badge Count Should Be    1
    Remove From Cart              ${add_to_cart_selectors}[0][name]
    Cart Badge Count Should Be    0

Add Multiples Inventorys To Cart
    [Tags]    add_multiples_inventory_to_cart
    ${inventory}                Get Fixture    inventory    inventory_list    products
    ${add_to_cart_selectors}    Get Fixture      cart         selectors         btnAddToCart
    Go To Login Page
    Application Login                   ${USERNAME}    ${PASSWORD}
    Add Multiples Inventorys To Cart    ${add_to_cart_selectors}[0][name]    ${add_to_cart_selectors}[1][name]
    Cart Badge Count Should Be          2

Remove Multiples Inventorys From Cart
    [Tags]    remove_multiples_inventory_from_cart
    ${inventory}                Get Fixture    inventory    inventory_list    products
    ${add_to_cart_selectors}    Get Fixture      cart         selectors         btnAddToCart
    Go To Login Page
    Application Login                        ${USERNAME}    ${PASSWORD}
    Add To Cart                              ${add_to_cart_selectors}[0][name]
    Add To Cart                              ${add_to_cart_selectors}[1][name]
    Cart Badge Count Should Be               2
    Remove Multiples Inventorys From Cart    ${add_to_cart_selectors}[0][name]    ${add_to_cart_selectors}[1][name]
    Cart Badge Count Should Be               0

Validate Cart Details
    [Tags]    cart_details
    ${inventory}                Get Fixture    inventory    inventory_list    products
    ${add_to_cart_selectors}    Get Fixture      cart         selectors         btnAddToCart
    Go To Login Page
    Application Login    ${USERNAME}    ${PASSWORD}
    Add To Cart          ${add_to_cart_selectors}[0][name]
    Go To Cart
    Cart details         ${inventory}[0][name]    ${inventory}[0][description]    ${inventory}[0][price]