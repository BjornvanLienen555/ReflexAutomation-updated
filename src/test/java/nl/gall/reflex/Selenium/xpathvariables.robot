*** Settings ***
Library     SeleniumLibrary
Library     XML


*** Variables ***
# Calendar table
${MAAND}        8    # 0 = january, 11 = december
${MONTH}        //*[class="dijitCalendarMonthMenu dijitMenu"]/div[${MAAND}]
${2000}         248
${JAAR}         23+${2000}
${YEAR}         //*[class="dijitCalendarMonthMenu dijitMenu a-calendarYearMenu"]/div[${JAAR}]
${DAYCOLUMN}    2    # 2-8 Monday=2 Sunday=8
${DAYROW}       2    # 1-6 Top to bottom
${DAY}          //*[class="dijitReset dijitCalendarBodyContainer"]/tbody/tr[${DAYROW}]/td[${DAYCOLUMN}]/span

# Manage Receipt table
${RECEIPTCOLUMN}     5    # 2-17 2 is the day column, 17 is the progress column
${RECEIPTROW}        2    # 2-depends on how many results are shown. 2 is just the first row with data
${RECEIPTDATA}       xpath=//html/body/div[2]/div[1]/div[1]/div[9]/div[4]/div[9]/div[2]/div/div[${RECEIPTROW}]/table/tr/td[${RECEIPTCOLUMN}]/div/div
${RECEIPTEND}        xpath=//html/body/div[2]/div[1]/div[1]/div[9]/div[4]/div[9]/div[2]/div/div[20]/table/tr/td[${RECEIPTCOLUMN}]/div/div

# Misc Receipt
${SELECTDOCK}        //*[@adeldonotchangestack="true"]/table/tbody/tr[7]
${CONFIRM ORDER}     //*[@adeldonotchangestack="true"]/table/tbody/tr[13]
