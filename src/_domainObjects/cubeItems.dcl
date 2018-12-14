LibCube:Jointure JOINTURE_PREVIOUS_YEAR_GENERAL_SALES_FACT
    --> dimensionConditions
        -> List 
            --> values
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_CITY
                    --> members CITY_ALL
                    ;,
                    
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_STORE
                    --> members STORE_ALL
                    ;,
                    
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_PRODUCT
                    --> members PRODUCT_ALL
                    ;,
                    
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_TIME
                    --> members getGeneralData().previousPeriod
                    ;
            ;
    ;

LibCube:JointureOneFactSelection PREVIOUS_YEAR_GENERAL_SALES_FACT_SELECTION
   --> jointure JOINTURE_PREVIOUS_YEAR_GENERAL_SALES_FACT
; 


LibCube:Jointure JOINTURE_CURRENT_YEAR_GENERAL_SALES_FACT    
    --> dimensionConditions
        -> List 
            --> values
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_CITY
                    --> members CITY_ALL
                    ;,
                    
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_STORE
                    --> members STORE_ALL
                    ;,
                    
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_PRODUCT
                    --> members PRODUCT_ALL
                    ;,
                    
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_TIME
                    --> members getGeneralData().currentPeriod
                    ;
            ;
    ;

LibCube:JointureOneFactSelection CURRENT_YEAR_GENERAL_SALES_FACT_SELECTION
   --> jointure JOINTURE_CURRENT_YEAR_GENERAL_SALES_FACT
;

LibCube:Jointure JOINTURE_CITY_SALES_FACTS
    --> dimensionConditions
        -> List 
            --> values
               
                -> LibCube:JointureChildParentDimensionCondition
                    --> dimension DIMENSION_CITY
                    --> parentElem CITY_ALL
                    --> relationship CHILDREN_RELATIONSHIP
                    ;,

                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_STORE
                    --> members STORE_ALL
                    ;,
                    
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_PRODUCT
                    --> members PRODUCT_ALL
                    ;,
                    
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_TIME
                    --> members getGeneralData().currentPeriod
                    ;
            ;
    ;

LibCube:JointureFactsSelection JOINTURE_CITY_SALES_FACTS_SELECTION
   --> jointure JOINTURE_CITY_SALES_FACTS
;

LibCube:Jointure JOINTURE_PRODUCT_TYPE_SALES_FACTS
    --> dimensionConditions
        -> List 
            --> values
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_CITY
                    --> members CITY_ALL
                    ;,
                    
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_STORE
                    --> members STORE_ALL
                    ;,
                    
                -> LibCube:JointureLevelDimensionCondition
                    --> dimension DIMENSION_PRODUCT
                    --> level 2
                    ;,
                    
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_TIME
                    --> members getGeneralData().currentPeriod
                    ;
            ;
    ;

LibCube:JointureFactsSelection PRODUCT_TYPE_SALES_FACTS_SELECTION
   --> jointure JOINTURE_PRODUCT_TYPE_SALES_FACTS
;

LibCube:Jointure JOINTURE_PRODUCT_SALES_FACTS
    --> dimensionConditions
        -> List 
            --> values
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_CITY
                    --> members CITY_ALL
                    ;,
                    
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_STORE
                    --> members STORE_ALL
                    ;,
                    
                -> LibCube:JointureLevelDimensionCondition
                    --> dimension DIMENSION_PRODUCT
                    --> areLeaves true
                    ;,
                    
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_TIME
                    --> members getGeneralData().currentPeriod
                    ;
            ;
    ;

LibCube:JointureFactsSelection PRODUCT_SALES_FACTS_SELECTION
   --> jointure JOINTURE_PRODUCT_SALES_FACTS
;

LibCube:Jointure JOINTURE_CITY_ALL_CHILDREN
    --> dimensionConditions
        -> List 
            --> values
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_CITY
                    --> members CITY_ALL
                    ;,
                    
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_STORE
                    --> members STORE_ALL
                    ;,
                    
                -> LibCube:JointureLevelDimensionCondition
                    --> dimension DIMENSION_PRODUCT
                    --> areLeaves true
                    ;,
                    
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_TIME
                    --> members getGeneralData().currentPeriod
                    ;
            ;
    ;

LibCube:JointureFactsSelection JOINTURE_CITY_ALL_CHILDREN_FACTS_SELECTION
   --> jointure JOINTURE_CITY_ALL_CHILDREN
;

LibCube:Jointure JOINTURE_CITIES_AND_PRODUCTS
    --> dimensionConditions
        -> List 
            --> values
               
                -> LibCube:JointureChildParentDimensionCondition
                    --> dimension DIMENSION_CITY
                    --> parentElem CITY_ALL
                    --> relationship CHILDREN_RELATIONSHIP
                    --> includeParent true
                    ;,

                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_STORE
                    --> acceptsAnyMembers true
                    ;,
                    
                -> LibCube:JointureLevelDimensionCondition
                    --> dimension DIMENSION_PRODUCT
                    --> areLeaves true
                    ;,
                    
                -> LibCube:JointureDimensionCondition
                    --> dimension DIMENSION_TIME
                    --> members getGeneralData().currentPeriod
                    ;
            ;
    ;

LibCube:JointureGroupedFactsSelection CITIES_SALE_FACTS_BY_PRODUCT_SELECTION
   --> jointure JOINTURE_CITIES_AND_PRODUCTS
   --> groupingDimension DIMENSION_PRODUCT
;