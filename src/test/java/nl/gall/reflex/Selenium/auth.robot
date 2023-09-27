*** Settings ***
Library             SeleniumLibrary
Library             XML

*** Variables ***
# preferably create a specific testrobot account, so that regular login doesnt interfere with testing
# as an example:
# ${USERNAME}        GGBOT
# ${PASSWORD}        t^f&!MMFh#i^7TTac(wHu4oV2|=KSBD77bw2z7"2zk&lgAG19Y    
# ^This^ type of password so that no login is accidental. 
# It's best to manually gather the data from normal accounts and just let the bot account perform the tests.
# Only manually login on the account when the account settings need to be tweaked that an admin account cannot do.
${USERNAME}        bvl
${PASSWORD}        Welcome123!

*** Keywords ***
Login
    Get Selenium Implicit Wait
    Maximize Browser Window
    Wait Until Page Contains Element    //*[@id="social-gag"]
    Input Text    //*[@id="username"]    ${USERNAME}
    Input Password    //*[@id="password"]    ${PASSWORD}
    Click Button    //*[@id="kc-login"]
    Set Selenium Implicit Wait    60