# Scenario is taken from https://ultimateqa.com/automation-patterns-antipatterns
Scenario Outline: Registration - Successful - eshop products
    Given I navigate to "<url>"
    And I should see page title having partial text as "Login"
    When User clicks on "jointoday"
    Then I should see the "Choose your package" message
    And User selects "<packagecountry>" option
    And I should see page title having partial text as "Package Selection | Registration"
    And I wait for 5 sec
    When User forcefully click on "Continue"
    #registration - medical check
    Then I should see page title having partial text as "Medical Check | Registration"
    And User provided following "first name,last name,dob month,dob day,dob year" input data
    And User forcefully click on "gender male"
    And User selects no information options
    And User forcefully click on "kilograms label"
    And User provided following "current weight,height" input data
    When User forcefully click on "Continue"
    #registration - personal details
    Then I should see page title having partial text as "Personal Details | Registration"
    And User enters "reg email address" into "reg email address" field
    And User enters "reg email address" into "reg confirm email address" field
    And User enters "reg password" into "reg password" field
    And User enters "reg password" into "reg reconfirm password" field
    And I select "<securityquestion>" optionby "text" from dropdown "securityquestion"
    Then User enters "billingaddresscity" into "securityanswer" field
    And User selects all check boxes
    When User forcefully click on "Continue"
    #registration - summary
    Then I should see page title having partial text as "Summary | Registration"
    And User forcefully click on "Enter address manually"
    And User provided following "billing address Line1,billing address city,billing address country" input data
    And User enters "<billingaddresspostcode>" into "billing address postcode" field
    And I select "<state>" optionby "text" from dropdown "billing address state"
    And User enters "<contactnumber>" into "billing address contact number" field
    And I select "<irelandstate>" optionby "text" from dropdown "billingaddressirstate"
    And User selects all check boxes
    When User forcefully click on "continue to payment"
    #registration - payment
    Then I wait for 3 sec
    And I should see the "payment method heading" message
    And I should see page title having partial text as "Choose your Payment Method"
    And User provided following "cc number,cc holder name,cc cvv code" input data
    And I select "cc expiry month" optionby "value" from dropdown "cc expiry month"
    And I select "cc expiry year" optionby "value" from dropdown "cc expiry year"
    When User forcefully click on "Complete Payment"
    #registration - successful
    Then I wait for 5 sec
    And I should see the "payment successful" message
    And I should see page title having partial text as "Finished | Registration"
    #profilesetup - choose account details
    Given User sets headers and navigates to "ukbypassauthentation"
    Then I should see page title having partial text as "Personal Details | Profile Builder"
    And User enters "choose a username" into "username" field
    And I select "skip" optionby "value" from dropdown "time zone"
    When User forcefully click on "Continue"
    #profilesetup - target weight
    Then I should see the "choose your target weight" message
    And I should see page title having partial text as "Target Weight | Profile Builder"
    And User enters "target weight" into "target weight" field
    When User forcefully click on "Continue"
    And I wait for 5 sec
    #profilesetup - your health
    Then I should see the "your health" message
    And I should see page title having partial text as "Medical Check | Profile Builder"
    And User forcefully click on "donthaveanyofthehealthconditions"
    When User forcefully click on "Continue"
    #profilesetup - your dietary preferences
    Then I should see the "your dietary preferences" message
    And I should see page title having partial text as "Dietary Requirements | Profile Builder"
    Then User forcefully click on "donthaveanyofthedietarypreferences"
    And User forcefully click on "Continue"
    Then I should see the "your journey with us starts here" message
    And I should see page title having partial text as "Quick Start"
    And I should see the "Close" message
    And User forcefully click on "Close"
    #shop
    Given User sets headers and navigates to "shopurl"
    Then I wait for 5 sec
    And User clicks on "<shopurl>"
    And I should see page title having partial text as "Shop"
    Then I wait until home page load
    And User adds "<icount>" items of "same" boxes "<boxtoadd>" to basket
    And User forcefully click on "basketcheckout"
    And I wait for 5 sec
    Then I should see the "check out header" message
    And I wait for 5 sec
    Then User completes the payment either by one click payment method or using new card method
    #shop - confirmation
    And I wait for 5 sec
    And I should see the "congratulations" message
    And I should see page title having partial text as "Homepage"

    Examples:
      | url   | state   | billingaddresspostcode   | shopurl | icount | boxtoadd    | contactnumber                  | packagecountry | securityquestion | irelandstate |
      | ukurl | ukstate | ukbillingaddresspostcode | skip    | 5      | biscuit       | irbillingaddresscontactnumber  | UK             | cityborn         | skip         |
      | ukurl | eustate | eubillingaddresspostcode | skip    | 10     | biscuit       | irbillingaddresscontactnumber  | Europe         | cityborn         | irstate      |