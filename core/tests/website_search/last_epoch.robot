*** Settings ***
Documentation
...    We want to search for a website named Last Epoch

Resource    ../../../core/resources.robot

Suite Setup
...    Begin Session

Suite Teardown
...    Close Browser

Force Tags
...    last 

*** Test Cases ***
Search for Last Epoch website
    [Documentation]
    ...    We need to search for the website

    Wait Until Page Contains    Google    ${timeout}
    Wait Until Element Is Enabled    xpath: //*[contains(text(),'Search')]   ${timeout}
    
    Input Text    xpath: //*[contains(text(),'Search')]    last epoach
    
    Sleep    3 seconds