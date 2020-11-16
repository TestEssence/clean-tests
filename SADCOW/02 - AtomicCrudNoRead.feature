Feature:  Product CRUD No Read 
#CRUD operations are split, Read is not extracted

    Background: 
        The user logged in as "Store Administrator"
    
    Scenario: Products - Create Product
        Given the "GenericProduct"  product does not exist 
        When the following  product is added as "GenericProduct"
            | Name  | GenericProduct |
            | Price | 1.99           |
        Then VERIFY that the "GenericProduct" is present in the "Products List"
    
    Scenario: Products - Update Product
        Given the "GenericProduct" is present in the "Products List"
        When  the "GenericProduct" is changed as follows
            | Name  | GenericProductPlus |
            | Price | 2.99               |
        Then VERIFY that the "GenericProductPlus" is present in the "Products List"

    Scenario: Products - Delete Product
        Given the "GenericProductPlus" is present in the "Products List" 
        When the "GenericProductPlus" is deleted
        Then VERIFY that the "GenericProductPlus" is NOT present in the "Products List" 
