*** Settings ***
Library     SeleniumLibrary
Library     XML
Library     Dialogs
Resource    keywords_common.robot
Resource    test.robot

*** Keywords ***
Search Receipts
    Select/Clear Searchbar
    Press Keys    ${SEARCHBAR}    ${RECEIPTCODE}
    Wait Until Page Contains Element    //*[@class="dijitReset dijitMenuItem a-font-1"]
    Click Element    //*[@class="dijitPopup dijitComboBoxMenuPopup"]
    Pause

Refresh Page
    Click Element    xpath=//html/body/div[2]/div[1]/div[1]/div[9]/div[4]/div[13]/div[1]/div[3]/div[1]

Filter Receipt Date
    Pause
    Click Element    ${DATEINPUT}
    Clear Element Text    ${DATEINPUT}
    Press Keys    ${DATEINPUT}    ${DATE}
    Press Keys    ${DATEINPUT}    RETURN
    Pause

Close Receipt Window
    Pause
    Click Element    xpath=//html/body/div[2]/div[1]/div[1]/div[9]/div[1]/table/tbody/tr/td[3]/div/span[5]
    Delete All Cookies

Assign Dock
    Open Context Menu   ${RECEIPTDATA}
    Pause
    Wait Until Element Is Visible    ${SELECTDOCK}
    Mouse Over    ${SELECTDOCK}
    Pause
    Double Click Element    ${SELECTDOCK}
    Double Click Element    xpath=//html/body/div[2]/div[1]/div[1]/div[10]/div[4]/div[1]/div[3]/div[1]/div/div[2]/div[2]/div/div[2]/table/tr/td[4]/div/div

 Modify Confirm
    Wait Until Element Is Visible    xpath=//html/body/div[36]/table/tbody/tr[1]/td[2]    ### xpath not unique
    Mouse Over                       xpath=//html/body/div[36]/table/tbody/tr[1]/td[2]
    Click Element                    xpath=//html/body/div[36]/table/tbody/tr[1]/td[2]
    Pause
    Click Element    xpath=//html/body/div[2]/div[1]/div[1]/div[11]/div[4]/div[1]/div[1]/div[4]/div/div[2]
    Pause
    Input Text    xpath=//html/body/div[2]/div[1]/div[1]/div[11]/div[4]/div[1]/div[3]/div[2]/div/div[13]/div/input    ${DATE}
    Click Button    //*[@adelianame="IDC_ENTREE"]
    Wait Until Element Is Visible    //*[@role="gridcell"]
    Click Button    //*[@adelianame="IDC_ENTREE"]
    Pause
Confirm Order
    Open Context Menu    ${RECEIPTDATA}
    Pause
    Wait until Element Is Visible    ${CONFIRM ORDER}
    Mouse Over    ${CONFIRM ORDER}
    Pause
    Double Click Element    ${CONFIRM ORDER}
    Pause
    Click Button    //*[@adelianame="IDC_F20"]
    Wait Until Element Is Visible    xpath=//html/body/div[2]/div[1]/div[1]/div[10]/div[4]/div[9]/div[2]/div/div[2]/table/tr/td[3]
    Open Context Menu                xpath=//html/body/div[2]/div[1]/div[1]/div[10]/div[4]/div[9]/div[2]/div/div[2]/table/tr/td[3]
    Modify Confirm
    Wait Until Element Is Visible    xpath=//html/body/div[2]/div[1]/div[1]/div[10]/div[4]/div[9]/div[2]/div/div[3]/table/tr/td[3]
    Open Context Menu                xpath=//html/body/div[2]/div[1]/div[1]/div[10]/div[4]/div[9]/div[2]/div/div[3]/table/tr/td[3]
    Modify Confirm
    Wait Until Element Is Visible    xpath=//html/body/div[2]/div[1]/div[1]/div[10]/div[4]/div[9]/div[2]/div/div[4]/table/tr/td[3]
    Open Context Menu                xpath=//html/body/div[2]/div[1]/div[1]/div[10]/div[4]/div[9]/div[2]/div/div[4]/table/tr/td[3]
    Modify Confirm
    Wait Until Element Is Visible    xpath=//html/body/div[2]/div[1]/div[1]/div[10]/div[4]/div[9]/div[2]/div/div[5]/table/tr/td[3]
    Open Context Menu                xpath=//html/body/div[2]/div[1]/div[1]/div[10]/div[4]/div[9]/div[2]/div/div[5]/table/tr/td[3]
    Modify Confirm
    Finish Confirm

Finish Confirm
    Wait Until Element Is Visible    //*[@adelianame="BTN_VALIDER"]
    Click Element    //*[@adelianame="BTN_VALIDER"]
    Pause
    Wait Until Element Is Visible    //*[@maxlength="6"]
    Input Text    //*[@maxlength="6"]    ${USERNAME}
    Click Button    //*[@adelianame="IDC_F20"]

    

# THE CODE BELOW IS UNUSED, BUT POTENTIALLY USEFUL FOR LATER
# Filter Receipt Date is heavily dependend on how ${DAY} is defined in variables.robot and if the element is interactable
# Filter Receipt Date Calendar
#    Wait Until Element Is Visible    //div[@style="background-image: url(&quot;/reflex/WagonServlet?action=GET_UNLIMITED_CACHE&hash=30008ABC03B977E01EFBD03E2F0E672F&WagonNodeId=GAGLIMJVA01RLV&WagonJEECookieName=JSESSIONID&WagonJEESessionId=]
#    Click Element    //div[@style="background-image: url(&quot;/reflex/WagonServlet?action=GET_UNLIMITED_CACHE&hash=30008ABC03B977E01EFBD03E2F0E672F&WagonNodeId=GAGLIMJVA01RLV&WagonJEECookieName=JSESSIONID&WagonJEESessionId=]
#    Click Element    /html/body/div[2]/div[1]/div[1]/div[11]/div[4]/div/div[1]/table/thead/tr[1]/th[2]/span[1]/span/span/span[3]
#    Click Element    ${MONTH}
#    Click Element    /html/body/div[2]/div[1]/div[1]/div[11]/div[4]/div/div[1]/table/thead/tr[1]/th[2]/span[2]/span/span/span[3]
#    Click Element    ${YEAR}
#    Double Click Element    ${DAY}
