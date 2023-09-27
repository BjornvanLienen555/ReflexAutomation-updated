This file doesnt contain any variables as of yet, 
just the known xpaths, what they represent and a potential unique identifier.
If needed, this file can be used for the xpathvariables.robot file or to be placed in keywords.robot if used once/twice
Consider this a library for xpaths, and try to keep this up to date when new xpaths are used.

MAIN SCREEN
    Searchbar: //html/body/div[1]/div/div[1]/div[7]/div[1]/div[2]/input    
    ...    //input[@class="dijitReset dijitInputInner"] works but is not unique

    Click Searchbar Result: /html/body/div[16]
    ...    //*[@class="dijitPopup dijitComboBoxMenuPopup"] is not unique, but works
    ...    div[2] is the first option that pops up. 
    ...    Personally, I have been going for very specific inputs to turn it into the first option
    ...    Like HFRE00 for Receipts
    
    Disconnect: //html/body/div[1]/div/div[1]/button[6]
    ...    //*[class="menubar-maindiv menubar-maindiv-flex-start"]/button[6] 
    ...    not confirmed to be unique, but works, altho, it is longer and therefor messier

    Profile: /html/body/div[1]/div/div[1]/div[13] (works only as hover over)
    ...    //*[class="menubar-maindiv menubar-maindiv-flex-start"]/div[13]
    ...    Same logic as above, longer, thus messier

    Profile dropdown: //html/body/div[26]/table/tbody/tr[X] 
    ...    X represents the items in the dropdown menu, from 1-7. 1 being user sheets, 7 being job manager
    ...    No unique xpath found

MANAGE RECEIPTS
    Date input: //html/body/div[2]/div[1]/div[1]/div[9]/div[4]/div[7]/div/input
    ...    //*[@maxlength="8"] is seemingly unique and therefor used, but could create issues later on
    ...    
    Refresh Page: //html/body/div[2]/div[1]/div[1]/div[9]/div[4]/div[13]/div[1]/div[3]/div[1]

    Table selection:     //html/body/div[2]/div[1]/div[1]/div[9]/div[4]/div[9]/div[2]/div/div[X]/table/tr/td[Y]/div/div
    ...    Has no unique xpath, X represents the row starting from 2 where data is first present, 
    ...    y represents the column starting from 2, which represents the day

    Date selection through calendar: this one has multiple confirmed unique xpaths, so no singular xpath
    However, this leads to the table itself: //html/body/div[2]/div[1]/div[1]/div[10]/div[4]/div/div[1]/table
    ...    //*[class="dijitCalendarMonthMenu dijitMenu"]/div[W]
    ...    //*[class="dijitCalendarMonthMenu dijitMenu a-calendarYearMenu"]/div[X]
    ...    //*[class="dijitReset dijitCalendarBodyContainer"]/tbody/tr[Y]/td[Z]/span
    ...    W represents the month, X represents the year, 
    ...    Y represents the table row (which week), and X represents the table column(which weekday)

    Window interactions:
    ...   Minimize:     //html/body/div[2]/div[1]/div[1]/div[9]/div[1]/table/tbody/tr/td[3]/div/span[1]
    ...   Restore size: //html/body/div[2]/div[1]/div[1]/div[9]/div[1]/table/tbody/tr/td[3]/div/span[3]
    ...   Maximize:     //html/body/div[2]/div[1]/div[1]/div[9]/div[1]/table/tbody/tr/td[3]/div/span[2]
    ...   Help button:  //html/body/div[2]/div[1]/div[1]/div[9]/div[1]/table/tbody/tr/td[3]/div/span[4] #UNUSED?
    ...   Close:        //html/body/div[2]/div[1]/div[1]/div[9]/div[1]/table/tbody/tr/td[3]/div/span[5]

    Right Click Menu: (Modify...; Manage receipt... -=- ... Export to Excel... Custom options...). The first, last and most used options:
    ...    Modify             //*[@adeldonotchangestack="true"]/table/tbody/tr[1]
    ...    Dock               //*[@adeldonotchangestack="true"]/table/tbody/tr[7]
    ...    Confirm...         //*[@adeldonotchangestack="true"]/table/tbody/tr[13]
    ...    Custom options     //*[@adeldonotchangestack="true"]/table/tbody/tr[28]
    ...    Seperators dont have any value, but they are in the way of correctly selecting: 
    ...    //*[@adeldonotchangestack="true"]/table/tbody/tr[4]     between Manage lines... and Documents
    ...    //*[@adeldonotchangestack="true"]/table/tbody/tr[8]     between Select dock... and Set awaiting confirmation...
    ...    //*[@adeldonotchangestack="true"]/table/tbody/tr[12]    between Generate with direct input... and Confirm...
    ...    //*[@adeldonotchangestack="true"]/table/tbody/tr[21]    between Modify depot... and Disputes
    ...    //*[@adeldonotchangestack="true"]/table/tbody/tr[23]    between Disputes and Manage alcohol receipts...
    ...    //*[@adeldonotchangestack="true"]/table/tbody/tr[25]    between Manage alcohol receipts... and Export to Excel...
    ...    //*[@adeldonotchangestack="true"]/table/tbody/tr[27]    between Export to Excel... and Custom options...
    ...    Anything else is inbetween, there are 4 additional options called Previous View(29), Next View(30), Refresh(31) and Create Receipt(32) that do not show on right click
    In addition to above, if it is not unique enough, @role="menu" and/or @cellspacing="0" might need to be added

    Modify Receipts: 
    ...    
    ...    
    ...    
    Assign Dock: needs a double click
    ...    First in list     //html/body/div[2]/div[1]/div[1]/div[10]/div[4]/div[1]/div[3]/div[1]/div/div[2]/div[2]/div/div[2]/table/tr/td[4]/div/div
    ...    Second in list    //html/body/div[2]/div[1]/div[1]/div[10]/div[4]/div[1]/div[3]/div[1]/div/div[2]/div[2]/div/div[3]/table/tr/td[4]/div/div
    ...    (etc)             //html/body/div[2]/div[1]/div[1]/div[10]/div[4]/div[1]/div[3]/div[1]/div/div[2]/div[2]/div/div[VARIABLE]/table/tr/td[4]/div/div
    
    Confirm ...:
    ...    
    ...    Input /html/body/div[2]/div[1]/div[1]/div[12]/div[4]/div[1]/div[3]/div[1]/div/div[10]/div/input