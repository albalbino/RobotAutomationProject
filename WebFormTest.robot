*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://sampleapp.tricentis.com/101/app.php
${UPLOAD_FIELD}    xpath=//input[@type='file']
${FILE_PATH}       https://conteudo.imguol.com.br/c/entretenimento/38/2023/02/07/boca-de-09-1675802536403_v2_900x506.png


*** Test Cases ***
Preencher Todos os Campos dos Formularios
    Open Browser    ${URL}    chrome
    Delete All Cookies
    Maximize Browser Window
    

    # Preencher a seção "Enter Vehicle Data"
    Wait Until Element Is Visible    id=make
    Select From List By Label    id=make    Toyota
    Select From List By Label    id=model    Scooter
    Input Text    id=cylindercapacity    500
    Input Text    id=engineperformance    150
    Input Text    id=dateofmanufacture    10/10/2010
    Select From List By Label    id=numberofseats    4
    Click Element  xpath=//label[@class='ideal-radiocheck-label'][contains(.,'Yes')]
    Select From List By Label    id=fuel    Petrol
    Input Text    id=payload    150
    Input Text    id=totalweight    200
    Input Text    id=listprice    1500
    Input Text    id=licenseplatenumber    ABC123
    Input Text    id=annualmileage    100000
    Click Element	  //button[@name='Next (Enter Insurant Data)'][contains(.,'Next »')]


    # Preencher a seção "Enter Insurant Data"
    Wait Until Element Is Visible    id=firstname
    Input Text    id=firstname    Alexandre
    Input Text    id=lastname    Lopes
    Input Text    id=birthdate   10/10/2000
    
    Select Radio Button    xpath=//input[@name='Gender' and @value='Male']
    Input Text    id=streetaddress    123 Elm Street
    Select From List By Label    id=country    United States
    Input Text    id=zipcode    12345
    Input Text    id=city    Anytown
    Select From List By Label    id=occupation    Employee
    Click Element xpath=//span[contains(@class,'ideal-check checked')]
    Input Text    id=website    soundcloud.com/aledavibe
    
    Click Element xpath=//button[@type='button'][contains(.,'Open')]
    Choose File     ${UPLOAD_FIELD}    ${FILE_PATH}
    Click Button    xpath=//button[@type='submit']
    Click Button    id=nextenterproductdata

    # Preencher a seção "Enter Product Data"
    Wait Until Element Is Visible    id=startdate
    Input Text    id=startdate    01/01/2023
    Select From List By Label    id=insurancesum    3.000.000,00
    Select From List By Label    id=meritrating    Bonus 3
    Select From List By Label    id=damageinsurance    Full Coverage
    Click Element    xpath=//input[@name='Optional Products' and @value='Euro Protection']
    Select From List By Label    id=courtesycar    Yes
    Click Button    id=nextselectpriceoption

    # Preencher a seção "Select Price Option"
    Wait Until Element Is Visible    xpath=//input[@name='Select Option' and @value='Silver']
    Click Element    xpath=//input[@name='Select Option' and @value='Silver']
    Click Button    id=nextsendquote

    # Preencher a seção "Send Quote"
    Wait Until Element Is Visible    id=email
    Input Text    id=email    alexandre.lbti@gmail.com
    Input Text    id=phone    83999178913
    Input Text    id=username    johndoe
    Input Text    id=password    Password123
    Input Text    id=confirmpassword    Password123
    Input Text    id=Comments    This is a test quote.
    Click Button    id=sendemail

    Close Browser