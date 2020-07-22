*** Settings ***
Documentation     A test suite with a single test for valid homepage.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resources.robot

*** Test Cases ***
Valid Login
    Open Browser To Home Page
    Homepage Should Be Open
    Element Should Be Visible  xpath://a[text()='Contact Us'] 
    Element Attribute Value Should Be  xpath://a[text()='Contact Us']  href  ${HOST}Pages/ContactUs.aspx
    [Teardown]  Close Browser