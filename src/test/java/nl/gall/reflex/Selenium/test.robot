*** Settings ***
Library             SeleniumLibrary
Library             XML
Library             Process
Resource            auth.robot
Resource            keywords.robot
Resource            variables.robot

Test Setup          Open Browser    https://reflex-tst.gall.nl/reflex/env/recette    edge
Test Teardown       Close Browser

*** Variables ***
${DATE}             22-09-23    # Input current date in the format of dd-mm-yy


*** Test Cases ***
Set Docks and Confirm Order
    Pause
    Login
    Search Receipts
    Filter Receipt Date
    Wait Until Element Is Not Visible   ${RECEIPTEND}
    Assign Dock
    Confirm Order
    Refresh Page
    Close Receipt Window
    Close Reflex
