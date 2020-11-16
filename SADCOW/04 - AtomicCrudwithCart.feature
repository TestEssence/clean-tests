Feature:  Products CRUD with Cart
    Background: 
        The user logged in as "Store Administrator"
    #UnitOfWork_StateOrFunctionUnderTest_ExpectedBehaviorIfNotSuccess

    Scenario: Products - Create Product
        Given the "GenericProduct"  product does not exist 
        When the following  product is added
            | Name  | GenericProduct |
            | Price | 1.99           |
        Then VERIFY that the "GenericProduct" is present in the "Products List"
    
    Scenario: Products - Update Product
        Given the "GenericProduct" is present in the "Products List"
        When I change the "GenericProduct" and save
            | Name  | GenericProductPlus |
            | Price | 2.99               |
        Then VERIFY that the "GenericProductPlus" is present in the "Products List"

    Scenario: Products - View Product
        Given the "GenericProductPlus" is present in the "Products List"
        ### Test Design Aarm: View scenario complexity is increased
        When "GenericProductPlus" is added to a "Shopping Cart" of a "GenericUuser"
        Then VERIFY that the "GenericProductPlus" product name is listed in "Products List"
            And VERIFY that the "GenericProductPlus" product details are displayed on "Product Details View"
            And VERIFY that the "GenericProductPlus" product picture is listed on "Products Advertising Dashboard"
            And VERIFY that the "GenericProductPlus" product details are displayed in my "Shopping Cart"


    Scenario: Products - Delete Product
        Given the "GenericProductPlus" is present in the "Products List" 
        When  the "GenericProductPlus" is deleted
        Then VERIFY that the "GenericProductPlus" is NOT present in the "Products List" 

