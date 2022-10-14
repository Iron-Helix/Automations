*** Settings ***
Documentation
...    We need to login and search and add upublished products

Resource    ../../../core/resources.robot

Suite Setup
...    Begin Session

Suite Teardown
...    Close Browser

Force Tags
...    warp

*** Test Cases ***
Login 
    [Documentation]
    ...    Login 

    Wait Until Page Contains    Login    ${timeout}

    Input Text    name: Email   test@warpdevelopment.com
    Input Text    name: Password    123

    Click Element    xpath: /html/body/div[2]/form/div/div[3]/div/input


Search product
    [Documentation]
    ...    Search for unregisted products

    Wait Until Page Contains    Products    ${timeout}

    Input Text    name: q    unpublished product
    Click Element    xpath: /html/body/div[2]/form/div/input

    Wait Until Page Contains    Products found : 1    ${timeout}

    Mouse Over    xpath: /html/body/div[2]/div[2]/a
    Click Element    xpath: /html/body/div[2]/div[2]/a
   

Add product
    [Documentation]
    ...    Add products to the order

    Wait Until Page Contains    Unpublished Product    ${timeout}

    Input Text    name: Qty    4
    Click Element    xpath: /html/body/div[2]/div/div[2]/form/div/input

    Wait Until Page Contains    Success


Return list of Products
    ${response}    GET     url=http://recruitment.warpdevelopment.co.za/ProductAPI/Search?q=unpublished%20product
    Status Should Be    200    ${response}

    ${id}    Get Value From Json    ${response.json()}    $.products[0].ID
    ${compare}    Convert Json To String    ${id}

    Should Be Equal As Strings    ${compare}    ["1673"]
    

Order Qty for Products
    ${response}    POST     url=http://recruitment.warpdevelopment.co.za/ProductAPI/Order    json=${json}
    Status Should Be    200    ${response}

    ${id}    Get Value From Json    ${response.json()}    $.message
    ${compare}    Convert Json To String    ${id}

    Should Be Equal As Strings    ${compare}    ["Order placed."]
    

*** Variables ***
&{json}    ProductId=1673    Qty=4