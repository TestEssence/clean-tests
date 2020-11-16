Feature:  Atomic DDT CRUD With Data Aliasing
    Background: 
        The user is logged as "Store Administrator"
    #UnitOfWork_StateUnderTest_ExpectedBehavior

    Scenario Outline: Products - Create Products
        Given the <Product Alias>  product does not exist 
        When the <Product Alias>  product is added
        Then VERIFY that the <Product Alias> is present in the "Products List" 
        Examples:        
        | <Product Alias>          | <Price> |
        | GenericProduct           |  1.99   |
        | DiscountProduct          |  0.99   |
        | FreeProduct              |  0.01   |
        | AffiliateProduct         |  4.99   |
        | PreviouslyDeletedProduct |  4.99   |
    
    Scenario Outline: Products - Update Products
        Given the <Product Alias> is present in the "Products List" 
        When  the <Product Alias> is updated with <New Product Name>  and <New Product Price>
        Then VERIFY that the <New Product Name> is present in the "Products List" 
        Examples:        
        |<Product Alias>           |<New Product Name>               | <New Product Price>  |
        | GenericProduct           | UpdatedGenericProduct           |  1.98                |
        | ThreeYearsOldProduct     | UpdatedThreeYearsOldProduct     |  2.98                |
        | DiscountProduct          | UpdatedDiscountProduct          |  0.98                |
        | FreeProduct              | UpdatedFreeProduct              |  0.01                |
        | AffiliateProduct         | UpdatedAffiliateProduct         |  4.98                |
        | ProductInCart            | UpdatedProductInCart            |  3.99                |
        | ProductInWishList        | UpdatedProductInWishList        |  3.98                |
        | ProductInCartAndWishList | UpdatedProductInCartAndWishList |  3.97                |
        | ProductInOrderPaid       | UpdatedProductInOrderPaid       |  3.97                |
        | ProductInOrderShipped    | UpdatedProductInOrderShipped    |  3.97                |

    Scenario Outline: Products - View Products
        Given the <Product Alias> is present in the System with the 'properties' as listed in '<Product Alias>.json'
        Then VERIFY that the <Product Alias> product 'name' is present in the "Products List" 
        And VERIFY that the <Product Alias> product 'properties' are displayed on "Product Details View"
        And VERIFY that the <Product Alias> product 'picture' is listed on "Products Advertising Dashboard"
      Examples:        
        |  <Product Alias>         |
        | GenericProduct           |
        | NewProduct               |
        | DiscountProduct          |
        | FreeProduct              |
        | AffiliateProduct         |
        | ThreeYearsOldProduct     |

    Scenario Outline: Products - Delete Products
        Given the <Product Alias> is present in the "Products List" 
        When the <Product Alias> is deleted
        Then VERIFY that the <Product Alias> is NOT present in the "Products List" 
      Examples:        
        |  <Product Alias>         |
        | GenericProduct           |
        | NewProduct               |
        | DiscountProduct          |
        | FreeProduct              |
        | AffiliateProduct         |
        | ThreeYearsOldProduct     |
        | ProductInCart            |
        | ProductInWishList        |
        | ProductInCartAndWishList |
        | ProductInOrderPaid       | 
        | ProductInOrderShipped    |
