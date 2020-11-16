Feature:  Idempotence Example
''' An idempotent script is a script that has the same effect i.e.,
 leads to the same post-state of the system regardless of how many 
 times it is executed. In other words, under the assumption that 
 the system is isolated and its state cannot be changed by 
 external effects, an idempotent script that is executed 
 several times in a row may perform state changes only upon
  its first execution, and all Subsequent executions have no effect.
'''
    Background: 
        The user is logged as "Store Administrator"
    
    Scenario: Products - Non-idempotent Create Product
        @Non-Idempotent
        When the following  product is added as "GenericProduct"
            | Name  | GenericProduct |
            | Price | 1.99           |
        Then VERIFY that the "GenericProduct" is present in the "Products List" 

    Scenario: Products - Idempotent Create Product
        @Idempotent
        Given the "GenericProduct"  product does not exist 
        When the following  product is added as "GenericProduct"
            | Name  | GenericProduct |
            | Price | 1.99           |
        Then VERIFY that the "GenericProduct" is present in the "Products List" 