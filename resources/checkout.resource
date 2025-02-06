*** Settings ***
Library      SeleniumLibrary

Resource     ../resources/common.resource

Variables    ../helpers/locators/locators.py

*** Keywords ***

Initiate checkout
    Element Should Be Visible    ${BTN_CHECKOUT}
    Element Should Be Enabled    ${BTN_CHECKOUT}

    Click Button                 ${BTN_CHECKOUT}

Fill checkout information
    [Arguments]         ${first_name}         ${last_name}    ${zip_code} 

    Input Text          ${INPUT_NAME}         ${first_name}
    Input Text    	    ${INPUT_LAST_NAME}    ${last_name}
    Input Text          ${INPUT_ZIP_CODE}     ${zip_code}

Continue checkout
    Element Should Be Visible    ${BTN_CONTINUE_CHECKOUT}
    Element Should Be Enabled    ${BTN_CONTINUE_CHECKOUT}

    Click Button                 ${BTN_CONTINUE_CHECKOUT}

Checkout details
    [Arguments]    ${inventory_name}         ${inventory_description}    ${inventory_price}    
    ...            ${payment_information}    ${shipping_information}     ${item_value}        ${tax_value}    ${price_total}
    
    Checks details of inventory items        ${inventory_name}    ${inventory_description}    ${inventory_price}

    Element Should Be Visible                ${CHECKOUT_PAYMENT_TITLE}
    Element Should Be Visible                ${CHECKOUT_PAYMENT_DESCRIPTION}
    Element Text Should Be                   ${CHECKOUT_PAYMENT_DESCRIPTION}            ${payment_information}

    Element Should Be Visible                ${CHECKOUT_SHIPPING_TITLE}
    Element Should Be Visible                ${CHECKOUT_SHIPPING_DESCRIPTION}
    Element Text Should Be                   ${CHECKOUT_SHIPPING_DESCRIPTION}           ${shipping_information}

    Element Should Be Visible                ${CHECKOUT_PRICE_TOTAL_TITLE}
    
    Element Should Be Visible                ${CHECKOUT_ITEM_VALUE}
    Element Text Should Be                   ${CHECKOUT_ITEM_VALUE}                     ${item_value}
    
    Element Should Be Visible                ${CHECKOUT_ITEM_TAX}
    Element Text Should Be                   ${CHECKOUT_ITEM_TAX}                       ${tax_value}

    Element Should Be Visible                ${CHECKOUT_PRICE_TOTAL_VALUE}
    Element Text Should Be                   ${CHECKOUT_PRICE_TOTAL_VALUE}              ${price_total}

    Element Should Be Visible                ${BTN_FINISH_CHECKOUT}
    Element Should Be Enabled                ${BTN_FINISH_CHECKOUT}

    Element Should Be Visible                ${BTN_FINISH_CHECKOUT}
    Element Should Be Enabled                ${BTN_FINISH_CHECKOUT}


Finish checkout
    Element Should Be Visible    ${BTN_FINISH_CHECKOUT}
    Element Should Be Enabled    ${BTN_FINISH_CHECKOUT}

    Click Button                 ${BTN_FINISH_CHECKOUT}

Validate order
    [Arguments]    ${complete_title}    ${complete_description}

    Page Should Contain Image    ${CHECKOUT_SUCCESS_IMG}

    Element Should Be Visible    ${CHECKOUT_COMPLETE_TITLE}
    Element Text Should Be       ${CHECKOUT_COMPLETE_TITLE}         ${complete_title}

    Element Should Be Visible    ${CHECKOUT_COMPLETE_DESCRIPTION}
    Element Text Should Be       ${CHECKOUT_COMPLETE_DESCRIPTION}    ${complete_description}

    Element Should Be Visible    ${BTN_CHECKOUT_BACK_HOME}
    Element Should Be Enabled    ${BTN_CHECKOUT_BACK_HOME}