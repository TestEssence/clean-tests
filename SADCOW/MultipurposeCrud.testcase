Feature:  Products CRUD 
Scenario: Products CRUD Multipurpose Flow
Given I am logged as "adminitstrator"
When I add a product and save
    | Parameter | Value |
    | Name | GenericProduct |
    | Price | 1.99 |
And I verify that the "GenericProduct" name is present
When I change the "GenericProduct"  and save
    | Parameter | Value |
    | Name | GenericProductPlus |
    | Price | 2.99 |
And I verify that the "GenericProductPlus" has been updated
When I delete the "GenericProductPlus" and save
Then I verify that the "GenericProductPlus" has been deleted
