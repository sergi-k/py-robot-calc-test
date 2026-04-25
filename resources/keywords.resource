*** Settings ***
Library    SikuliLibrary    mode=NEW
Library    Process
Library    Screenshot
Library    ${CURDIR}/helper_lib.py

*** Variables ***
${IMAGES_DIR}    ${CURDIR}/../reference_images
${CALCULATOR}    gnome-calculator

*** Keywords ***

Setup Steps
    Start Sikuli Process
    Add Image Path    ${IMAGES_DIR}
    Set Min Similarity    0.9
    Launch Calculator

Teardown Steps
    Stop Remote Server
    Close Calculator

Screen Should Contain Any Image
    [Arguments]    @{images}
    FOR    ${image}    IN    @{images}
        ${status}=    Run Keyword And Return Status    Screen Should Contain    ${image}
        Return From Keyword If    ${status}    ${image}
    END
    Fail    None of the expected images were found on screen
    

Launch Calculator
    Start Process    ${CALCULATOR}    alias=calculator
    Sleep    5s
    ${found_image}=    Screen Should Contain Any Image    calc_opened.png    calc_maximized.png    calc_opened_2.png
    IF    '${found_image}' != 'calc_maximized.png'
        Click    maximize_btn.png
    END
    

Close Calculator
    Terminate Process    calculator

Enter Number
    [Arguments]    @{digits}
    FOR    ${digit}    IN    @{digits}
        IF    '${digit}' == 'negative'
            Click    minus_btn.png
        ELSE IF    '${digit}' == '.'
            Click    dot_btn.png
        ELSE
            Click    ${digit}_btn.png
        END
    END
    
Choose Random Number
    ${num}=    Pick Random Number
    ${digits}=    Split Number    ${num}
    Enter Number    @{digits}
    RETURN    ${num}

Clear Calculator
    Click    c_clear_btn.png

Result Should Be
    [Arguments]    ${expected}
    Sleep    2s
    ${screenshot}=    Take Screenshot    temp_screen
    Sleep    2s
    ${text}=    Read Result    ${screenshot}    648    844    620    25
    Log To Console    \nExpected result: ${expected}
    Log To Console    \nDisplay shows: ${text}
    Should Contain    ${text}    ${expected}
