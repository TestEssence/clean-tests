Feature:  Product CRUD No Read 
#CRUD operations are split, Read is not extracted

    Background: 
        I am logged in as "Store Administrator"
    
    Scenario: Products - Product Creation
        When I add a product and save
            | Parameter | Value |
            | Name | GenericProduct |
            | Price | 1.99 |
        Then I verify that the "GenericProduct" is present 
    
    Scenario: Products - Product Update
        Given the "GenericProduct" is present
        When I change the "GenericProduct" product and save
            | Parameter | Value |
            | Name | GenericProductPlus |
            | Price | 2.99 |
        Then I verify that the "GenericProductPlus" is present

    Scenario: Products - Product Delete
        Given the "GenericProductPlus" is present  
        When I delete the "GenericProductPlus" and save
        Then I verify that the "GenericProductPlus" has been deleted
