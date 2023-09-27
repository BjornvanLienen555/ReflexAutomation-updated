*** Settings ***
Library     SeleniumLibrary
Library     XML
Library     Dialogs
Resource    keywords_manage_receipts.robot


*** Keywords ***
Assign Dock and Confirm Order
    Search Receipts
    Pause Execution
    Filter Receipt Date
    Wait Until Element Is Not Visible   ${RECEIPTEND}
    Assign Dock
    Confirm Order
    Refresh Page
    Close Receipt Window