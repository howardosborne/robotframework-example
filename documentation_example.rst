Test cases
==========

Workflow tests
--------------

This is an example of a documented system which is also an executable test

.. code:: robotframework

    *** Settings ***
    Documentation     A test suite with a single test for valid homepage.
    ...
    ...               This test has a workflow that is created using keywords in
    ...               the imported resource file.
    Resource          resources.robot

    *** Test Cases ***
    Valid Homepage
        Open Browser To Home Page
        Homepage Should Be Open
        Element Should Be Visible  xpath://a[text()='Contact Us'] 
        Element Attribute Value Should Be  xpath://a[text()='Contact Us']  href  ${HOST}Pages/ContactUs.aspx
        [Teardown]  Close Browser

You can write whatever you want to document both the tests and the system under test
This will allow a broad audience to read it and gain confidence in the work done