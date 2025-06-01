*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id=login-username

Login With Valid Credentials
    Input Text    id=login-username    ${USERNAME}
    Input Text    id=login-password    ${PASSWORD}
    Click Button    id=login-button
    Wait Until Page Contains Element    id=search-box

Search For Product
    [Arguments]    ${PRODUCT}
    Input Text    id=search-box    ${PRODUCT}
    Click Button    id=search-submit
    Wait Until Page Contains    ${PRODUCT}

Product Should Be Listed
    [Arguments]    ${PRODUCT}
    Page Should Contain    ${PRODUCT}