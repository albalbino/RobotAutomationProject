* Settings *
Library    SeleniumLibrary

* Variables *
${URL}    https://sampleapp.tricentis.com/101/app.php
${BROWSER}    chrome
${UPLOAD_FIELD}        xpath=//input[contains(@class,'ideal-file-filename')]
${IMAGE_PATH}        ${CURDIR}/RobotAutomationProject/imagens/lara.png
${COURTESY_CAR}        id=courtesycar
${nextselectpriceoption}    id=nextselectpriceoption


* Test Cases *
Abrir Google Chrome na página da Tricentis
    Open Browser    ${URL}    ${BROWSER}       
    Delete All Cookies
    Maximize Browser Window
  Clear Element Text    locator
Preencher a seção Enter Vehicle Data
    Wait Until Element Is Visible    id=make
    Select From List By Label    id=make    Toyota
    Select From List By Label    id=model    Scooter
    Input Text    id=cylindercapacity    500
    Input Text    id=engineperformance    150
    Input Text    id=dateofmanufacture    10/10/2010
    Select From List By Label    id=numberofseats    4
    Click Element    xpath=//label[@class='ideal-radiocheck-label'][contains(.,'Yes')]
    Select From List By Label    id=fuel    Petrol
    Input Text    id=payload    150
    Input Text    id=totalweight    200
    Input Text    id=listprice    1500
    Input Text    id=licenseplatenumber    ABC123
    Input Text    id=annualmileage    100000
    Click Element	  xpath=//button[@name='Next (Enter Insurant Data)'][contains(.,'Next »')]
    

Preencher a seção Enter Insurant Data
    Wait Until Element Is Visible    id=firstname
    Input Text    id=firstname    Alexandre
    Input Text    id=lastname    Lopes
    Input Text    id=birthdate   10/10/2000
    
    Click Element    xpath=//label[@class='ideal-radiocheck-label'][contains(.,'Male')]
    Input Text    id=streetaddress    123 Elm Street
    Select From List By Label    id=country    United States
    Input Text    id=zipcode    12345
    Input Text    id=city    Anytown
    Select From List By Label    id=occupation    Employee
    Click Element    xpath=//label[@class='ideal-radiocheck-label'][contains(.,'Speeding')]
    Input Text       id=website    instagram.com/helpdj_cdjs
    
    Click Element    xpath=//button[@type='button'][contains(.,'Open')]
    Choose File     ${UPLOAD_FIELD}    ${IMAGE_PATH}
    Click Button    xpath=//button[@type='submit']
    Click Button    id=nextenterproductdata
    
Preencher a seção Enter Product Data
    Delete All Cookies
    Wait Until Element Is Visible    id=startdate
    Input Text    id=startdate    01/01/2025
    Select From List By Label    id=insurancesum    3.000.000,00
    Select From List By Label    id=meritrating    Bonus 3
    Select From List By Label    id=damageinsurance    Full Coverage
    Click Element    xpath=//label[@class='ideal-radiocheck-label'][contains(.,'Euro Protection')]
    Select From List By Label    id=courtesycar    Yes
    Click Button    id=nextselectpriceoption
    
Preencher a seção Select Price Option
    Maximize Browser Window
    Wait Until Element Is Visible    id=selectsilver  10s
    Focus    id=selectsilver
    Click Element    id=selectsilver
    Element Should Be Selected    id=selectsilver
    Click Button    id=nextsendquote
    
Preencher a seção Send Quote
    Click Element    xpath=(//label[@class='choosePrice ideal-radiocheck-label'])[1]
    Wait Until Element Is Visible    id=Email
    Click Button    ${nextselectpriceoption}
   
Preencher a seção Price Option 
    Wait Until Element Is Visible    xpath=//input[contains(@name,'E-Mail')]    10s
    Input Text    xpath=//input[contains(@email,'email')]    alexandre.lbti@gmail.com
    Wait Until Element Is Visible    xpath=//(//i[contains(@class,'icon')])[25]
    Input Text    xpath=//input[contains(@name,'Phone')]    83996600520
    Wait Until Element Is Visible    xpath=//(//i[contains(@class,'icon')])[26]
    Input Text    xpath=//input[contains(@name,'Username')]    alexxandre.lopes
    Wait Until Element Is Visible    xpath=//(//i[contains(@class,'icon')])[27]
    Input Text    xpath=//input[contains(@name,'Password ')]    Ale123
    Wait Until Element Is Visible    xpath=//(//i[contains(@class,'icon')])[28]
    Input Text    xpath=//input[contains(@name,'Confirm Password')]    Ale123
    Wait Until Element Is Visible    xpath=//(//i[contains(@class,'icon')])[29]
    Input Text    xpath=//input[contains(@name,'Comments')]    Test completed successfully! by: Alexandre Lopes - QA Engineer
    Click Element    xpath=//input[contains(@id,'email')]
    Wait Until Element Is Visible    xpath=//h2[contains(.,'Sending e-mail success!')]
    Click Button    xpath=//button[@class='confirm'][contains(.,'OK')]
    

    Close Browser