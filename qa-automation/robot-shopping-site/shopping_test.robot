*** Settings ***
Documentation     Shopping Website - Login and Product Search Test Suite
Resource          resources.robot
Resource          variables.robot
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Valid Login And Product Search
    [Tags]    smoke
    Login With Valid Credentials
    Search For Product    Wireless Mouse
    Product Should Be Listed    Wireless Mouse