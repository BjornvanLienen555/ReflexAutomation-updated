*** Settings ***
Library     SeleniumLibrary
Library     XML
Library    DateTime

*** Variables ***
${RECEIPTCODE}      HFRE00
${CLEARTEXT}        BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE
${SEARCHBAR}        //input[@class="dijitReset dijitInputInner"]
${DATEINPUT}        //*[@maxlength="8"]
