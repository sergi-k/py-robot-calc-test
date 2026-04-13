*** Settings ***
Documentation    Test suite for GNOME Calculator App
Resource    ../resources/keywords.robot
Suite Setup    Suite Setup Steps
Suite Teardown   Stop Remote Server
Test Teardown    Close Calculator

*** Test Cases ***

Calculator Can't Divide By 0
    ${rand_int}=    Choose Random Int Number
    Click    division_btn.png
    Enter Number    0
    Click    calculate_result_btn.png
    Take Screenshot
    Screen Should Contain    division_by_zero_error.png
