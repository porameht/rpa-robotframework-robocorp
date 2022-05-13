*** Settings ***
Documentation     Insert the sales data for the week and export it as a PDF.

Library    RPA.Browser.Selenium    auto_close=${FALSE}
Library    RPA.HTTP
Library    RPA.Excel.Files
Library    RPA.Desktop

*** Tasks ***
Insert the sales data for the week and ecport it as a PDF
    Open the intranet website
    Log in
    Download the Excel file
    Fill the form using the data from the Excel file

*** Keywords ***
Open the intranet website
    Open Available Browser    https://robotsparebinindustries.com/

Log in
    Input Text    username    maria
    Input Password    password    thoushallnotpass
    Submit Form
    Wait Until Page Contains Element    id:sales-form

Download the Excel file 
    Download    https://robotsparebinindustries.com/SalesData.xlsx    overwrite=True 

Fill and submit the form
    Input Text    firstname    John
    Input Text    lastname    Smith
    Input Text    salesresult    123
    Select From List By Value    salestarget    10000
    Click Button    Submit

Fill the form using the data from the Excel file
    Open Workbook    SalesData.xlsx
    ${sales_reps}=    Read Worksheet As Table    header=True
    Close Workbook
