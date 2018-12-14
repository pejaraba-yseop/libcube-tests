function LibCube:Test:twoFactsOneMeasureComp()
--> action {
    logInfo("Testing TwoFactsOneMeasureComparison");
    
}
;

function LibCube:Test:factsSorter()
--> action {
    logInfo("Testing factsSorter");
    
}
;

function LibCube:Test:groupedFactsSelection()
--> action {
    logInfo("Testing groupedFactsSelection");
    
}
;

function LibCube:Test:main()
--> action {
    //LibKPI:Test:ranges();
    logInfo("Running LibCube unit tests");
    LibCube:Test:twoFactsOneMeasureComp();
    LibCube:Test:factsSorter();
    LibCube:Test:groupedFactsSelection();
}
;

