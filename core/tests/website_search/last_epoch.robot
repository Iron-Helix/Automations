*** Settings ***
Documentation
...    We want to search for a website named Last Epoch

Resource    ../../../core/resources.robot

Suite Setup
...    Begin Session

Suite Teardown
...    Close Browser

Force Tags    last


*** Test Cases ***
Search for Last Epoch website
    [Documentation]
    ...    We need to search for the website

    Wait Until Page Contains    Google    ${timeout}
    Wait Until Element Is Enabled    name: q    ${timeout}

    Input Text    name: q    last epoch
    Sleep    0.5
    Click Element    class: wM6W7d

    Click Element    xpath: //*[contains(text(),'Last Epoch - Official Game Site | Time Travel Action RPG')]

    Wait Until Page Contains    Last Epoch    ${timeout}
