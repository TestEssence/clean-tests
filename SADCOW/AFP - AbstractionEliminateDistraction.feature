Feature: Abstraction Workshop: Eliminate Distraction

Scenario: Products - Add to Cart (Too much details is a distraction that kills your efficiency)
    @bad_example
    #The problem: too detailed instructions significantly slows down the executors and maintainers
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


Scenario: Products - Add to Cart (Less details is still a distraction)
    @bad_example
    #problem: Test objective is "Shopping Cart" so user credetials are not needed here
    Given the user is logged in as 
    | User Name | "User" |
    | Password  | "useR" |
    When the user  adds  "GenericProduct" to their "Shopping Cart"
    Then the "GenericProduct" product is present in their "Shopping Cart"

Scenario: Products - Add to Cart (Level of abstraction is not normalized)
    @ok_example
    #problem: Test objective is "Shopping Cart" so user type is not essential here
    Given the user is logged in as a "GenericUser"
    When the user adds  "GenericProduct" to their "Shopping Cart"
    Then the "GenericProduct" product is present in their "Shopping Cart"

Scenario: Products - Add to Cart (Normalized Abstraction)
    @ok_example,
    @GenericUser, 
    @AdminUser, 
    @SellerUser,
    @FacebookUser
    # Solution: Test objective is "Shopping Cart" so user type can be 
    # injected as a context parameter via @tag rather then be a part of scenario
    Given the user is logged in 
    When the user adds  "GenericProduct" to their "Shopping Cart"
    Then the "GenericProduct" product is present in their "Shopping Cart"


# link to check:  https://automationpanda.com/2017/01/30/bdd-101-writing-good-gherkin/