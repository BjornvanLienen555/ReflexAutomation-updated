*** Settings ***
Library     SeleniumLibrary
Library     XML
Resource    variables.robot
Resource    xpathvariables.robot


*** Keywords ***
Pause
    Get Selenium Implicit Wait

Select/Clear Searchbar
    Pause
    Click Element    ${SEARCHBAR}
    Press Keys    ${SEARCHBAR}    ${CLEARTEXT}

Close Reflex
    Click Element    xpath=//html/body/div[1]/div/div[1]/button[6]
    Click Element    xpath=//html/body/div[2]/div[1]/div[1]/div[9]/div[2]/div[2]/div/button[2]
    Wait Until Element Is Visible    xpath=//html/body/div/a
    Delete All Cookies
    Close Browser