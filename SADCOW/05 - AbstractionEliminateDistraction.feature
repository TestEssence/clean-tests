Feature: Abstraction Workshop

Scenario: Too much details is distraction that kill your efficiency
    @bad_example
    #problem: too detailed instructions slow down the exector or analyser
    Given the user scrolls the mouse to the "User Name" text box
        And the user clicks on the "User Name" text box
        And the user types the letter "U"
        And the user types the letter "s"
        And the user types the letter "e"
        And the user types the letter "r"
        And the user scrolls the mouse to the "Password" text box
        And the user clicks on the "Password" text box
        And the user types the letter "u"
        And the user types the letter "s"
        And the user types the letter "e"
        And the user types the letter "R"
        And the user presses the "ENTER" key
        And the "Welcome" screen is displayed
    When the user search for the "GenericProduct" product in the "Products list"
    And  the user clicks "Add to Cart"
    Then the "GenericProduct" product is present in their "Shopping Cart"


Scenario: Less details is still a distraction
    @bad_example
    #problem: Test objective is "Shopping Cart" so user credetials are not needed here
    Given the user is logged in as 
    | User Name | "User" |
    | Password  | "useR" |
    When the user  adds  "GenericProduct" to their "Shopping Cart"
    Then the "GenericProduct" product is present in their "Shopping Cart"

Scenario: Less details is still a distraction
    @ok_example
    #problem: Test objective is "Shopping Cart" so user type is not essential here
    Given the user is logged in as a "GenericUser"
    When the user adds  "GenericProduct" to their "Shopping Cart"
    Then the "GenericProduct" product is present in their "Shopping Cart"

Scenario: Normalized abstraction
    @ok_example,
    @GenericUser, 
    @AdminUser, 
    @SellerUser
    #solution: Test objective is "Shopping Cart" so user type can be 
    # injected as a context parameter via @tag rather then be a part od scenario
    Given the user is logged in 
    When the user adds  "GenericProduct" to their "Shopping Cart"
    Then the "GenericProduct" product is present in their "Shopping Cart"


# link to check:  https://automationpanda.com/2017/01/30/bdd-101-writing-good-gherkin/