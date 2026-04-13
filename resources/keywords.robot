*** Settings ***
Library    SikuliLibrary    mode=NEW
Library    Process
Library    Screenshot
Library    ${CURDIR}/random_number.py

*** Variables ***
${IMAGES_DIR}    ${CURDIR}/../reference_images
${CALCULATOR}    gnome-calculator

*** Keywords ***

Suite Setup Steps
    Start Sikuli Process
    Add Image Path    ${IMAGES_DIR}
    Log    ${IMAGES_DIR}    console=True
    Set Min Similarity    0.99
    Launch Calculator

Launch Calculator
    Start Process    ${CALCULATOR}    alias=calculator
    Sleep    5s
    Screen Should Contain    calc_opened.png

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
    
Choose Random Int Number
    ${int_num}=    Pick Random Int Number
    ${digits}=    Split Number    ${int_num}
    Enter Number    @{digits}
    RETURN    ${int_num}

Choose Random Float Number
    ${float_num}=    Pick Random Float Number
    ${digits}=    Split Number    ${float_num}
    Enter Number    @{digits}
    RETURN    ${float_num}

Clear Calculator
    Click    c_clear_btn.png
