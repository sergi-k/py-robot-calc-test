*** Settings ***
Documentation    Test suite for GNOME Calculator App
Resource    ../resources/keywords.resource
Test Setup    Setup Steps
Test Teardown   Teardown Steps

*** Test Cases ***

Calculator Can't Divide By 0
    ${rand_num}=    Choose Random Number
    Set Min Similarity    0.95
    Click    division_btn.png
    Enter Number    0
    Click    calculate_result_btn.png
    Set Min Similarity    0.85
    Wait Until Screen Contain    image=division_by_zero_error.png    timeout=5

Calculator Drops Malformed Expression Error
    ${rand_num_1}=    Choose Random Number
    Set Min Similarity    0.95
    Click    division_btn.png
    Click    division_btn.png
    ${rand_num_2}=    Choose Random Number
    Click    calculate_result_btn.png
    Set Min Similarity    0.85
    Wait Until Screen Contain    image=malformed_expression_error.png    timeout=5

Pi Equals 3.141592654
    Click    pi_btn.png
    Click    calculate_result_btn.png
    Result Should Be    3.141592654

Addition Works Correctly
    ${rand_num_1}=    Choose Random Number
    Set Min Similarity    0.95
    Click    plus_btn.png
    ${rand_num_2}=    Choose Random Number
    ${expected_result}=    Add Inside Python    ${rand_num_1}    ${rand_num_2}
    Click    calculate_result_btn.png
    Result Should Be    ${expected_result}

Subtraction Works Correctly
    ${rand_num_1}=    Choose Random Number
    Set Min Similarity    0.95
    Click    minus_btn.png
    ${rand_num_2}=    Choose Random Number
    ${expected_result}=    Subtract Inside Python    ${rand_num_1}    ${rand_num_2}
    Click    calculate_result_btn.png
    Result Should Be    ${expected_result}

Multiplication Works Correctly
    ${rand_num_1}=    Choose Random Number
    Set Min Similarity    0.95
    Click    multiply_btn.png
    ${rand_num_2}=    Choose Random Number
    ${expected_result}=    Multiply Inside Python    ${rand_num_1}    ${rand_num_2}
    Click    calculate_result_btn.png
    Result Should Be    ${expected_result}

Division Works Correctly
    ${rand_num_1}=    Choose Random Number
    Set Min Similarity    0.95
    Click    division_btn.png
    ${rand_num_2}=    Choose Random Number
    ${expected_result}=    Divide Inside Python    ${rand_num_1}    ${rand_num_2}
    Click    calculate_result_btn.png
    Result Should Be    ${expected_result}

Square Works Correctly
    ${rand_num}=    Choose Random Number
    Set Min Similarity    0.95
    Click    square_btn.png
    ${expected_result}=    Square Inside Python    ${rand_num}
    Click    calculate_result_btn.png
    Result Should Be    ${expected_result}

Root Works Correctly
    Click    root_btn.png
    ${rand_num}=    Choose Random Number
    ${expected_result}=    Root Inside Python    ${rand_num}
    Click    calculate_result_btn.png
    Result Should Be    ${expected_result}
