*** Settings ***
Documentation     A resource file with reusable keywords and variables.

Library           SeleniumLibrary

*** Variables ***
${HOST}         https://portal.jerseyfsc.org
${BROWSER}      Chrome
${DELAY}        0
${HOME_PAGE}     /Pages/Home.aspx
${REGISTER_PAGE}     /Pages/UserProfile.aspx?mode=new


*** Keywords ***
Open Browser To Home Page
    Open Browser    ${HOST}  ${BROWSER} 
    Set Selenium Speed    ${DELAY}
    Homepage Should Be Open

Homepage Should Be Open
    Location Should Be    ${HOST}${HOME_PAGE}
    Title Should Be    JFSC Platform Home

Homepage Links Should Be Valid
    Element Should Be Visible  xpath://a[text()='Contact Us'] 
    Element Attribute Value Should Be  xpath://a[text()='Contact Us']  href  ${HOST}Pages/ContactUs.aspx

Click Register Link on Homepage
    Click Link  /Pages/UserProfile.aspx?mode=new

Register Page Should Be Open
    Location Should Be    ${HOST}${REGISTER_PAGE}
    Title Should Be    Profile

Go To Registration Page
    Go To    ${REGISTER_PAGE}
    Register Page Should Be Open

Fill In Register Form
    [Arguments]    ${email}  ${password}  ${title}  ${firstname}  ${surname}  ${day_of_birth}  ${month_of_birth}  ${year_of_birth}  ${home_address_line_1}  ${country}  ${postcode}
    Input Text     name:ctl00$PlaceHolderMain$registrationControl$emailBox  ${email}
    Input Text     name:ctl00$PlaceHolderMain$registrationControl$emailBoxConfirm  ${email}
    Input Text     name:ctl00$PlaceHolderMain$registrationControl$passwordBox  ${password}
    Input Text     name:ctl00$PlaceHolderMain$registrationControl$confirmPasswordBox  ${password}
    Select From List By Value  name:ctl00$PlaceHolderMain$registrationControl$Title  ${title}
    Input Text     name:ctl00$PlaceHolderMain$registrationControl$FirstName  ${firstname}
    Input Text     name:ctl00$PlaceHolderMain$registrationControl$Surname  ${surname}
    Select From List By Value  name:ctl00$PlaceHolderMain$registrationControl$Birthday$Day  ${day_of_birth}
    Select From List By Value  name:ctl00$PlaceHolderMain$registrationControl$Birthday$Month  ${month_of_birth}
    Select From List By Value  name:ctl00$PlaceHolderMain$registrationControl$Birthday$Year  ${year_of_birth}
    Input Text     name:ctl00$PlaceHolderMain$registrationControl$HomeAddress1  ${home_address_line_1}
    Select From List By Value  name:ctl00$PlaceHolderMain$registrationControl$HomeAddressCountry  ${country}
    Input Text     name:ctl00$PlaceHolderMain$registrationControl$HomeAddressPostcode  ${postcode}

Fill In Register Form with Happy Path Details
    Fill In Register Form   justignore@example.com  JustIgnore  Mr  Bob  Jones  8  7  1960  1 High Street  United Kingdom  AB1 1EX

Check Registration Complete
    Title Should Be  Registration Complete