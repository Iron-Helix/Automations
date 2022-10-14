*** Settings ***
Resource    ../resources.robot

*** Keywords ***
Begin Session

    Set Selenium Timeout    ${timeout}
    
    Open Browser
        ...    url=http://recruitment.warpdevelopment.co.za
        ...    browser=chrome
    Maximize Browser Window

Close Browser Window
    Close Browser
