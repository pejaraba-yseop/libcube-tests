function runProcessingTasks()
--> domains Void
--> action
{
    if(theGeneralData.runUnitTests == false){
        MEASURE_VALUE.includeInJointureConditions = false;
        getGeneralData().cube.init();
        setSelectedFacts();
        setGeneralSalesVariation();
        setTotalSoldUnitsVariation();
        setTopSalesRevenueCityFact();
        setTopSoldUnitseCityFact();
        setTopSalesRevenueProductTypeFact();
        setTopProductTypeSalesRevenueDriver();
        setTopSoldUnitsProductTypeFact();
        setTopProductTypeSoldUnitsDriver();
        printCitySaleFactsByProduct();
    }else{
        LibCube:Test:main();
    }
    //_businessRules:Behaviors();
}
;