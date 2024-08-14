*** settings ***
Documentation   Open Google Web Browser
Library         SeleniumLibrary  
Test Setup    Open Selenium web form
Test Teardown    Close Browser  
Resource     Variables.robot


*** Test Cases ***
Log Message
    Log    Hello World
Open Google
    #Close All Browsers
    #Open Selenium web form
    TextInput   Hello World
    EnterPassword    I Know You
    MyTextArea    We are going to explore the selenium web form
    CheckElement
    CheckElemntText    Readonly input
    Select From the List    2
    Verify the Selection from the list    2
    Checkbox status
    swap the checkbox selection
    Select RButton
    change the colour red
    [Teardown]     Close Browser

*** Keywords ***
Open Selenium web form
    Open Browser    ${Selenium_URL}    ${Browser}
TextInput
    [Arguments]   ${text1}
        Input Text    id=my-text-id    ${text1}

EnterPassword
    [Arguments]   ${password}
        Input Text    name=my-password    ${password}
MyTextArea
    [Arguments]   ${text2}
        
        Input Text    name=my-textarea    ${text2}
CheckElement
    Element Should Be Disabled    name=my-disabled

CheckElemntText
    [Arguments]    ${Message}
    ${variable} =    Get Value   name=my-readonly   
    IF    $variable == $Message
        Log   Variable is as expected ${variable}
    ELSE
        Fatal Error   The value is working Expected = ${Message} ,Acutal = ${variable}
    END

Select From the List
    [Arguments]   ${ListIteamName}
    Select From List By Value   name=my-select    ${ListIteamName}

Verify the Selection from the list
    [Arguments]   ${ListIteamName1}
    List Selection Should Be   name=my-select    ${ListIteamName1}
    
Select value from Dropdown Datalist
    [Arguments]   ${ListIteamName2} 
    Click Element     //label[normalize-space()='Dropdown (datalist)']
    Select From List By Value   //datalist[@id='my-options']     ${ListIteamName2}

Verify the Selection from Datalist
    [Arguments]   ${ListIteamName3}
    List Selection Should Be   //label[normalize-space()='Dropdown (datalist)']    ${ListIteamName3}

Checkbox status
    Checkbox Should Be Selected    id=my-check-1
    Checkbox Should Not Be Selected    id=my-check-2

swap the checkbox selection
    Select Checkbox    id=my-check-2
    Unselect Checkbox    id=my-check-1

Select RButton
    Select Radio Button    my-radio    my-radio-2

change the colour red
    Click Element   //input[@name='my-colors']

    @{handles1} =   Get Window Handles 
    #${color} =  Get Value    xpath=//input[@name='my-colors']
    #Log    The color of the element is: ${color}

    @{handles} =    Get Window Handles
    @{winTIT} =   Get Window Titles