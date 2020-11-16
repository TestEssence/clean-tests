Feature:  Products CRUD 
    Background: 
        The user is logged as "Store Administrator"
    #UnitOfWork_StateUnderTest_ExpectedBehavior

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

    Scenario: Products - View Product
        Given the "GenericProductPlus" is present in the "Products List" 
        Then VERIFY that the "GenericProductPlus" product name is present in the "Products List" 
        And VERIFY that the "GenericProductPlus" product details are displayed on "Product Details View"
        And VERIFY that the "GenericProductPlus" product picture is listed on "Products Advertising Dashboard"

    Scenario: Products - Delete Product
        Given the "GenericProductPlus" is present in the "Products List" 
        When the "GenericProductPlus" is deleted
        Then VERIFY that the "GenericProductPlus" is NOT present in the "Products List" 

