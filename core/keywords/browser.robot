*** Settings ***
Resource    ../resources.robot

*** Keywords ***
Begin Session

    Set Selenium Timeout    ${timeout}
    
    Open Browser
        ...    url=https://www.google.com
        ...    browser=chrome
    Maximize Browser Window

Close Browser Window
    Close Browser
