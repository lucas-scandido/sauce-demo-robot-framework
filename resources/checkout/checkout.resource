*** Settings ***
Library      SeleniumLibrary

Resource     ../../resources/common/common.resource

Variables    ../../helpers/locators/locators.py

*** Keywords ***
Initiate Checkout
    Button Action    ${BTN_CHECKOUT}

Fill Checkout Information
    [Arguments]    ${first_name}    ${last_name}    ${zip_code} 
    Input Text    ${INPUT_NAME}         ${first_name}
    Input Text    ${INPUT_LAST_NAME}    ${last_name}
    Input Text    ${INPUT_ZIP_CODE}     ${zip_code}

Continue Checkout
    Button Action    ${BTN_CONTINUE_CHECKOUT}

Checkout Details
    [Arguments]    ${inventory_name}         ${inventory_description}    ${inventory_price}    
    ...            ${payment_information}    ${shipping_information}     ${item_value}        ${tax_value}    ${price_total}
    Get Inventory Items Details    ${inventory_name}                  ${inventory_description}    ${inventory_price}
    Element Should Be Visible      ${CHECKOUT_PAYMENT_TITLE}
    Check Element Details          ${CHECKOUT_PAYMENT_DESCRIPTION}    ${payment_information}
    Element Should Be Visible      ${CHECKOUT_SHIPPING_TITLE}
    Check Element Details          ${CHECKOUT_SHIPPING_DESCRIPTION}   ${shipping_information}
    Element Should Be Visible      ${CHECKOUT_PRICE_TOTAL_TITLE}
    Check Element Details          ${CHECKOUT_ITEM_VALUE}             ${item_value}
    Check Element Details          ${CHECKOUT_ITEM_TAX}               ${tax_value}
    Check Element Details          ${CHECKOUT_PRICE_TOTAL_VALUE}      ${price_total}
    Check Element State            ${BTN_CANCEL_CHECKOUT}
    Check Element State            ${BTN_FINISH_CHECKOUT}

Finish Checkout
    Button Action    ${BTN_FINISH_CHECKOUT}

Validate Order
    [Arguments]    ${complete_title}    ${complete_description}
    Page Should Contain Image    ${CHECKOUT_SUCCESS_IMG}
    Check Element Details        ${CHECKOUT_COMPLETE_TITLE}          ${complete_title}
    Check Element Details        ${CHECKOUT_COMPLETE_DESCRIPTION}    ${complete_description}
    Check Element State          ${BTN_CHECKOUT_BACK_HOME}