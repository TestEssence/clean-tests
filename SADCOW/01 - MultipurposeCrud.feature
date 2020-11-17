Feature:  Products CRUD 
@bad_example

Scenario: Products - Create, Update and Delete Product
    @bad_example
    #Problem #1 multipurpose (3 verification checks) is not as sustainable approach
    #Problem #2 multiple when is not an acceptable style
    Given I am logged as "administrator"
    When I add a product and save
        | Name  | GenericProduct |
        | Price | 1.99 |
    And I verify that the "GenericProduct" name is present
    When I change the "GenericProduct"  and save 
        | Name  | GenericProductPlus |
        | Price | 2.99 |
    And I verify that the "GenericProductPlus" has been updated
    When I delete the "GenericProductPlus" and save
    Then I verify that the "GenericProductPlus" has been deleted
