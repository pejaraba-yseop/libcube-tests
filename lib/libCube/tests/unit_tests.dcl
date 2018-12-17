function LibCube:Test:twoFactsOneMeasureComp()
--> action {
    logInfo("Testing TwoFactsOneMeasureComparison");
    
}
;

function LibCube:Test:factsSorter()
 local {
    LibCube:FactsSorter sorter
    LibCube:Fact bottomFact
    LibCube:TimeMember time2k18
    LibCube:TimeMember time2k17
    LibCube:TimeMember time2k16
    LibCube:Measure valueMeasure
    LibCube:Fact fact2k16
    LibCube:Fact fact2k17
    LibCube:Fact fact2k18
    LibCube:FactMeasure factMeasure2k16
    LibCube:FactMeasure factMeasure2k17
    LibCube:FactMeasure factMeasure2k18
    
    LibCube:Measure measure2k16
    LibCube:Measure measure2k17
    LibCube:Measure measure2k18

    List facts
}
--> action {
    logInfo("Testing factsSorter");

    //fact value and label to give them shape-------------------------------------------------
    time2k18 = new(LibCube:TimeMember);
    time2k18.dimension = DIMENSION_TIME;
    time2k18.label = "2018";
    time2k18.date = Date..stringToDate("2018-01-01");

    time2k17 = new(LibCube:TimeMember);
    time2k17.dimension = DIMENSION_TIME;
    time2k17.label = "2017";
    time2k17.date = Date..stringToDate("2017-01-01");

    time2k16 = new(LibCube:TimeMember);
    time2k16.dimension = DIMENSION_TIME;
    time2k16.label = "2016";
    time2k16.date = Date..stringToDate("2016-01-01");
    //-----------------------------------------------------------------------------------------
    
    //label for the measure for any fact
    valueMeasure = new(LibCube:Measure);
    valueMeasure.label = "value";
    //-----------------------------------------------------------------------------------

    //setting fact measure values
    factMeasure2k16 = new(LibCube:FactMeasure);
    factMeasure2k16.measure = valueMeasure;
    factMeasure2k16.value = 800000;

    factMeasure2k17 = new(LibCube:FactMeasure);
    factMeasure2k17.measure = valueMeasure;
    factMeasure2k17.value = 500000;

    factMeasure2k18 = new(LibCube:FactMeasure);
    factMeasure2k18.measure = valueMeasure;
    factMeasure2k18.value = 1000000;
    //-----------------------------------------------------------------------------------

    //init of every fact that will be inside the factSorter class
    fact2k16 = new(LibCube:Fact);
    fact2k16.timeMember = time2k16;//setting the fact shape 
    fact2k16.members.add(time2k16);//setting the fact shape
    fact2k16.factMeasures = factMeasure2k16;
    
    fact2k17 = new(LibCube:Fact);
    fact2k17.timeMember = time2k17;//setting the fact shape 
    fact2k17.members.add(time2k17);//setting the fact shape
    fact2k17.factMeasures = factMeasure2k17;

    fact2k18 = new(LibCube:Fact);
    fact2k18.timeMember = time2k18;//setting the fact shape 
    fact2k18.members.add(time2k18);//setting the fact shape
    fact2k18.factMeasures = factMeasure2k18;
    //---------------------------------------------------------------------------------------

    //Adding the every fact to facts list
    facts = new(List); 
    facts.add(fact2k16);
    facts.add(fact2k17);
    facts.add(fact2k18);
    //----------------------------------------------------------------------------------------

    //init and setting of factSorter class 
    sorter = new(LibCube:FactsSorter);
    sorter.facts = facts;
    sorter.sortType = SORT_TYPE_ONE_MEASURE;
    sorter.measure = valueMeasure;
    sorter.sortFacts();
    //Calling test case function
    bottomFact = sorter.getBottomFact();
    //sorter.sortFacts(); sort facts from high to low example {2,1,3} --> {3,2,1}
    assert(bottomFact == fact2k17);

    logInfo("LibCube:Test:factsSorter() passed");
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
    //LibCube:Test:twoFactsOneMeasureComp();
    LibCube:Test:factsSorter();
    //LibCube:Test:groupedFactsSelection();
}
;

