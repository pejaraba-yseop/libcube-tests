
function setSelectedFacts()
--> action {
 getGeneralData().previousYearGeneralSalesFact = PREVIOUS_YEAR_GENERAL_SALES_FACT_SELECTION.selectedFact;
 getGeneralData().currentYearGeneralSalesFact = CURRENT_YEAR_GENERAL_SALES_FACT_SELECTION.selectedFact;
 
}
;

function setGeneralSalesVariation()
--> local LibCube:TwoFactsOneMeasureComparison comparison
--> action {
     comparison = getFactsComparison(getGeneralData().currentYearGeneralSalesFact, 
                                     getGeneralData().previousYearGeneralSalesFact,
                                     MEASURE_SALE_VALUE);
     
     getGeneralData().generalSalesVariation = comparison.relativeChange;
}
;

function setTotalSoldUnitsVariation()
--> local LibCube:TwoFactsOneMeasureComparison comparison
--> action {
     comparison = getFactsComparison(getGeneralData().currentYearGeneralSalesFact, getGeneralData().previousYearGeneralSalesFact, MEASURE_SOLD_UNITS);
     getGeneralData().totalSoldUnitsVariation = comparison.relativeChange;
}
;

function setTopSalesRevenueCityFact()
--> local LibCube:FactsSorter sorter
--> action {
    sorter = getOneMeasureSorter(JOINTURE_CITY_SALES_FACTS_SELECTION>>selectedFacts, MEASURE_SALE_VALUE);
    
    getGeneralData().topSalesRevenueCityFact = sorter.getTopFact();
    //getBottomFact() should exist ..
    getGeneralData().leastSalesRevenueCityFact = sorter.getFact(sorter.facts.size()); 
}
;


function setTopSoldUnitseCityFact()
--> local LibCube:FactsSorter sorter
--> action {
    sorter = new(LibCube:FactsSorter);
    sorter.facts = JOINTURE_CITY_SALES_FACTS_SELECTION>>selectedFacts;
    
    sorter.measure = MEASURE_SOLD_UNITS;
    sorter.useAbsoluteValue = false;
    sorter.sortType = SORT_TYPE_ONE_MEASURE;
    sorter.sortFacts();
    
    getGeneralData().topSoldUnitsCityFact = sorter.getTopFact();
    
}
;


function setTopSalesRevenueProductTypeFact()
--> local LibCube:FactsSorter sorter
--> action {
    sorter = new(LibCube:FactsSorter);
    sorter.facts = PRODUCT_TYPE_SALES_FACTS_SELECTION>>selectedFacts;
    
    sorter.measure = MEASURE_SALE_VALUE;
    sorter.useAbsoluteValue = false;
    sorter.sortType = SORT_TYPE_ONE_MEASURE;
    sorter.sortFacts();
    
    getGeneralData().topSalesRevenueProductTypeFact = sorter.getTopFact();
    
}
;

function setTopProductTypeSalesRevenueDriver()
--> local List topTypeProductsFacts, LibCube:FactsSorter sorter
--> action {
    topTypeProductsFacts = new(List);
    foreach(_productFact, PRODUCT_SALES_FACTS_SELECTION.selectedFacts){
        if(_productFact.getMember(DIMENSION_PRODUCT).parent == getGeneralData().topSalesRevenueProductTypeFact.getMember(DIMENSION_PRODUCT)){
            topTypeProductsFacts.add(_productFact);
        }
    }
    
    sorter = new(LibCube:FactsSorter);
    sorter.facts = topTypeProductsFacts;
    sorter.measure = MEASURE_SALE_VALUE;
    sorter.useAbsoluteValue = false;
    sorter.sortType = SORT_TYPE_ONE_MEASURE;
    sorter.sortFacts();
    
    getGeneralData().topProductTypeSalesRevenueDriver = sorter.getTopFact();
    
}
;

function setTopSoldUnitsProductTypeFact()
--> local LibCube:FactsSorter sorter
--> action {
    sorter = new(LibCube:FactsSorter);
    sorter.facts = PRODUCT_TYPE_SALES_FACTS_SELECTION>>selectedFacts;
    
    sorter.measure = MEASURE_SOLD_UNITS;
    sorter.useAbsoluteValue = false;
    sorter.sortType = SORT_TYPE_ONE_MEASURE;
    sorter.sortFacts();
    
    getGeneralData().topSoldUnitsProductTypeFact = sorter.getTopFact();
    
}
;

function setTopProductTypeSoldUnitsDriver()
--> local List topTypeProductsFacts, LibCube:FactsSorter sorter
--> action {
    topTypeProductsFacts = new(List);
    foreach(_productFact, PRODUCT_SALES_FACTS_SELECTION.selectedFacts){
        if(_productFact.getMember(DIMENSION_PRODUCT).parent == getGeneralData().topSoldUnitsProductTypeFact.getMember(DIMENSION_PRODUCT)){
            topTypeProductsFacts.add(_productFact);
        }
    }
    
    sorter = new(LibCube:FactsSorter);
    sorter.facts = topTypeProductsFacts;
    sorter.measure = MEASURE_SOLD_UNITS;
    sorter.useAbsoluteValue = false;
    sorter.sortType = SORT_TYPE_ONE_MEASURE;
    sorter.sortFacts();
    
    getGeneralData().topProductTypeSoldUnitsDriver = sorter.getTopFact();
    
}
;

function printCitySaleFactsByProduct()
--> local HashMap groupedFacts
--> action{
    logInfo("printCitySaleFactsByProduct");
    groupedFacts = CITIES_SALE_FACTS_BY_PRODUCT_SELECTION.getGroupedFacts();
    foreach(_product, groupedFacts.getKeys()){
        logInfo("citiy facts of ", LibCube:Member(_product).label, " : ", Collection(groupedFacts[_product]).size());
    }

    logInfo("City facts of ", PRODUCT_COSTEÑO.label, CITIES_SALE_FACTS_BY_PRODUCT_SELECTION.getFactsOfMember(PRODUCT_COSTEÑO).size());
}
;