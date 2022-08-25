*** Settings ***
Documentation
...    Test that my setup of Robot Framework was successful

Resource    ./core/resources.robot

Suite Setup
...    Begin Session
   

Suite Teardown
...    Close Browser

Force Tags
...    test 

*** Test Cases ***
Test Robot Framework
    [Documentation]
    ...    Make sure that the instilation was successful

    Sleep    10 Seconds