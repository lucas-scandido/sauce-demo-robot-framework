*** Settings ***
Documentation    This file contains common variables and keywords that are used across all test cases.

Library     SeleniumLibrary

*** Variables ***
${BASE_URL}                https://www.saucedemo.com/

*** Keywords ***
Start Session
    Open Browser    browser=chrome

Close Session
    Close Browser