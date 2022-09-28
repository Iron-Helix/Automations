*** Settings ***
Resource    ../resources.robot

*** Keywords ***
Begin Session

    Set Selenium Timeout    ${timeout}
    
    Open Browser
        ...    url=https://www.investec.com
        ...    browser=chrome
    Maximize Browser Window

Close Browser Window
    Close Browser
