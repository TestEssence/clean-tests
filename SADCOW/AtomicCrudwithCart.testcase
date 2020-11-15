Feature:  Products CRUD 
    Background: 
        I am logged as "Store Administrator"
    #UnitOfWork_StateUnderTest_ExpectedBehavior

    Scenario: Products - Product Creation
        When I add a product and save
            | Parameter | Value |
            | Name | GenericProduct |
            | Price | 1.99 |
        Then I verify that the "GenericProduct" is present 
    
    Scenario: Products - Product Update
        Given the "GenericProduct" is present
        When I change the "GenericProduct" and save
            | Parameter | Value |
            | Name | GenericProductPlus |
            | Price | 2.99 |
        Then I verify that the "GenericProductPlus" is present

    Scenario: Products - Product View
        Given the "GenericProductPlus" is present
        When I add "GenericProductPlus" to my "Shopping Cart"
        Then I verify that the "GenericProductPlus" product name is listed in "Products List"
        And I verify that the "GenericProductPlus" product details are displayed on "Product Details View"
        And I verify that the "GenericProductPlus" product picture is listed on "Products Advertising Dashboard"
        And I verify that the "GenericProductPlus" product details are displayed in my "Shopping Cart"


    Scenario: Products - Product Delete
        Given the "GenericProductPlus" is present  
        When I delete the "GenericProductPlus" and save
        Then I verify that the "GenericProductPlus" has been deleted

