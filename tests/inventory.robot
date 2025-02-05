*** Settings ***
Documentation    This test suite verifies the Invetory page and invetory page details.

Resource         ../helpers/secrets.robot
Resource         ../resources/common.resource

Test Setup       Start Session
Test Teardown    Close Session

*** Test Cases ***

Scenario: Should be displayed a list of six inventorys on the inventory screen
    [Documentation]    Validates the display of inventory items on the screen. 
    ...    It verifies that exactly six products are visible.
    [Tags]                            inventory_list
    
    Go To                             url=${BASE_URL}
    Submit login form                 ${USERNAME}    ${PASSWORD}
    Display inventory items           6

    Capture Page Screenshot

Scenario: Should be validate the inventory details of each item on the screen
    [Documentation]    Validates the name, description, price and add to cart button
    ...    of each item displayed of inventory on the screen. 
    [Tags]                            inventory_details
    
    ${inventory}                      Get fixture  inventory  inventorys

    Go To                             url=${BASE_URL}
    Submit login form                 ${USERNAME}    ${PASSWORD}
    
    FOR    ${item}    IN    @{inventory}
        ${name} =         Set Variable    ${item["name"]}
        ${description} =  Set Variable    ${item["description"]}
        ${price} =        Set Variable    ${item["price"]}
        
        Display inventory details   ${name}    ${description}    ${price}    6
    END

    Capture Page Screenshot

Scenario: User should click on the product and be redirected to the inventory item details screen
    [Documentation]    Validates a inventory details such as name, description, price and add to cart button.
    [Tags]                            inventory_item_details
    
    ${inventory}                      Get fixture  inventory  inventorys

    Go To                             url=${BASE_URL}
    Submit login form                 ${USERNAME}    ${PASSWORD}
    Click on inventory item           ${inventory}[0][name]
    Inventory item details            ${inventory}[0][name]    ${inventory}[0][description]    ${inventory}[0][price]

    Capture Page Screenshot