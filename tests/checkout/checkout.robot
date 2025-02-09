*** Settings ***
Documentation    Test suite verify the checkout page. If verifies all checkout 
...              details, like invetory name, description and price. Also validates 
...              the payment and shipping information and price total of checkout step stepTwo. 
...              Finally, validates that an inventory has buyed with success.

Resource         ../../resources/common/common.resource

Test Setup       Start Session
Test Teardown    Close Session

*** Test Cases ***
Validate Checkout Details 
    [Tags]    checkout_details
    ${inventory}    Get Fixture    inventory      inventory_list    products
    ${cart}         Get Fixture    cart           selectors         btnAddToCart
    ${checkout}     Get Fixture    checkout       steps             checkoutStep
    Go To Login Page
    Application Login             ${USERNAME}    ${PASSWORD}
    Add To Cart                   ${cart}[0][name]
    Go To Cart
    Initiate Checkout
    Fill Checkout Information    ${checkout}[stepOne][firstName]        ${checkout}[stepOne][lastName]      ${checkout}[stepOne][zipCode] 
    Continue Checkout
    Checkout Details             ${inventory}[0][name]                  ${inventory}[0][description]        ${inventory}[0][price]   
    ...                          ${checkout}[stepTwo][paymentMethod]    ${checkout}[stepTwo][shipping]    
    ...                          ${checkout}[stepTwo][itemTotal]        ${checkout}[stepTwo][tax]           ${checkout}[stepTwo][total]

Buy Inventory With Success   
    [Tags]    buy_inventory
    ${cart}        Get Fixture    cart           selectors         btnAddToCart
    ${checkout}    Get Fixture    checkout       steps             checkoutStep
    Go To Login Page
    Application Login            ${USERNAME}    ${PASSWORD}
    Add To Cart                  ${cart}[0][name]
    Go To Cart
    Initiate Checkout
    Fill Checkout Information    ${checkout}[stepOne][firstName]    ${checkout}[stepOne][lastName]    ${checkout}[stepOne][zipCode] 
    Continue Checkout
    Finish Checkout
    Validate Order               ${checkout}[stepComplete][title]    ${checkout}[stepComplete][description]                         