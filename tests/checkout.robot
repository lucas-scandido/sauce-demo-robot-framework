*** Settings ***
Documentation    This test suite verifies the Checkout page of the "Sauce Demo" application.

Resource         ../helpers/secrets.robot
Resource         ../resources/common.resource

Test Setup       Start Session
Test Teardown    Close Session

*** Test Cases ***

Scenario: Should be validate the checkout details
    [Documentation]    Validates all checkout details: invetory name, description and price.
    ...    Also validates the payment and shipping information and price total of checkout step two. 
    [Tags]                        checkout_details

    ${inventory}                  Get fixture    inventory      inventorys
    ${cart}                       Get fixture    cart           btnAddToCart
    ${checkout}                   Get fixture    checkout       steps
    
    Go To                         url=${BASE_URL}
    Submit login form             ${USERNAME}    ${PASSWORD}
    Add to cart                   ${cart}[0][name]
    Go to the cart
    Initiate checkout
    Fill checkout information    ${checkout}[stepOne][firstName]              ${checkout}[stepOne][lastName]        ${checkout}[stepOne][zipCode] 
    Continue checkout
    Checkout details             ${inventory}[0][name]                  ${inventory}[0][description]    ${inventory}[0][price]   
    ...                          ${checkout}[stepTwo][paymentMethod]    ${checkout}[stepTwo][shipping]    
    ...                          ${checkout}[stepTwo][itemTotal]        ${checkout}[stepTwo][tax]       ${checkout}[stepTwo][total]

Scenario: User should buy an inventory with success
    [Documentation]    Validates that an inventory has buyed with success
    [Tags]                        buy_inventory

    ${cart}                       Get fixture    cart           btnAddToCart
    ${checkout}                   Get fixture    checkout       steps
    
    Go To                         url=${BASE_URL}
    Submit login form             ${USERNAME}    ${PASSWORD}
    Add to cart                   ${cart}[0][name]
    Go to the cart
    Initiate checkout
    Fill checkout information    ${checkout}[stepOne][firstName]    ${checkout}[stepOne][lastName]    ${checkout}[stepOne][zipCode] 
    Continue checkout
    Finish checkout
    Validate order               ${checkout}[complete][title]    ${checkout}[complete][description]                         

    Capture Page Screenshot   