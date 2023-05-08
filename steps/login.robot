*** Settings ***
Library           SeleniumLibrary
Variables         ../resourches/loginLocators.yaml
Suite Setup       Open Browser    ${url}    ${browser}
Suite Teardown    Close Browser


*** Keywords ***
Login Web Sauce Demo
    Input Text    ${Txt_Username}    ${username}
    Input Text    ${Txt_Password}    ${password}
    Click Button  ${Btn_Login}
    Sleep    2s

Login Web Sauce Demo Invalid
    Input Text    ${Txt_Username}    ${username_invalid}
    Input Text    ${Txt_Password}    ${password}
    Click Button  ${Btn_Login}
    Sleep    2s

Logout Web Sauce Demo
    Click Button  ${Btn_Menu}
    Sleep    2s
    Click Link    ${Lnk_Logout}

Verify Login Success
    Page Should Contain    ${Lbl_Products}

Verify Login Fail
    Page Should Contain    ${Lbl_Error}


*** Test Cases ***
User Login with valid username and password
    Login Web Sauce Demo
    Verify Login Success
    Logout Web Sauce Demo

User Login with invalid username and password
    Login Web Sauce Demo Invalid
    Verify Login Fail