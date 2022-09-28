*** Settings ***
Documentation
...    UI Automation test

Resource    ../../../core/resources.robot

Suite Setup
...    Begin Session

Suite Teardown
...    Close Browser

Force Tags
...    ui 

*** Test Cases ***
UI Automation Test
    [Documentation]
    ...    Automate a basic search function

    Wait Until Page Contains    Investec    ${timeout}

    Mouse Over    xpath: //*[contains(text(),'Focus insights')]
    Click Element    xpath: //*[contains(text(),'Focus insights')]

    Click Element   xpath: //*[@id="content"]/div[4]/div/div/div[2]/div[1]/ul/li[4]
    Sleep    3
    
    Click Element    xpath: //*[contains(text(),'Accept all cookies')]
    Wait Until Element Is Enabled    xpath: //*[contains(text(),'Accept all cookies')]    ${timeout}
    Click Element    class: onetrust-close-btn-handler

    Scroll Element Into View    class: content-hub-search-box__search-box
    Wait Until Element Is Enabled    class: content-hub-search-box__search-box    ${timeout}
    Sleep    3
    Input Text    id: searchBoxInput    Understanding cash investment interest rates
    Click Element    id: searchBoxButton

    Wait Until Element Is Not Visible    class: content-hub-search-results__title ng-binding    ${timeout}

    Mouse Over    xpath: //*[@id="content"]/div[2]/div[1]/div/div[1]/a/h4
    Click Element    xpath: //*[@id="content"]/div[2]/div[1]/div/div[1]/a/h4

    Scroll Element Into View    xpath: //*[contains(text(),'Sign up')]
    Click Element    xpath: //*[contains(text(),'Sign up')]

    Wait Until Element Is Enabled    class: forms__section
    Scroll Element Into View    xpath: //*[contains(text(),'Submit')]

    Input Text    name: name   Justin
    Input Text    name: surname    Milicevic
    Input Text    name: email   test@investec.co.za

    Click Element    xpath: //*[@id="content"]/div[7]/div[2]/div/div/div/div/div[2]/div/div/div/div/div[1]/div/div/div/div/div/form/div[1]/section/fieldset[2]/div[4]/checkbox-input/div/div/div[1]/button
    Click Element    xpath: //*[contains(text(),'Submit')]

    Wait Until Page Contains    We look forward to sharing out of the ordinary insights with you


R2D2 Skin Test
    ${response}    GET    https://swapi.dev/api/people/
    Status Should Be    200    ${response}

    ${r2d2_skin}    Get Value From Json    ${response.json()}     $.results[2].skin_color
    ${compare}    Convert Json To String    ${r2d2_skin}

    Should Be Equal As Strings    ${compare}    ["white, blue"]
