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

function LibCube:Test:factsDimensionSorterCaseTimeDimension()
 local {
    LibCube:FactsSorter sorter
    LibCube:Fact bottomFact
    LibCube:Fact topFact
    LibCube:TimeMember time2k18
    LibCube:TimeMember time2k17
    LibCube:TimeMember time2k16
    LibCube:TimeMember time2k15
    LibCube:TimeMember time2k14
    LibCube:TimeMember time2k13
    LibCube:TimeMember time1986
    
    LibCube:Fact fact2k18
    LibCube:Fact fact2k17
    LibCube:Fact fact2k16
    LibCube:Fact fact2k15
    LibCube:Fact fact2k14
    LibCube:Fact fact2k13
    LibCube:Fact fact1986

    List facts
}
--> action {
    logInfo("Testing factsDimensionSorterCaseTimeDimension");

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

    time2k15 = new(LibCube:TimeMember);
    time2k15.dimension = DIMENSION_TIME;
    time2k15.label = "2015";
    time2k15.date = Date..stringToDate("2015-01-01");

    time2k14 = new(LibCube:TimeMember);
    time2k14.dimension = DIMENSION_TIME;
    time2k14.label = "2014";
    time2k14.date = Date..stringToDate("2014-01-01");

    time2k13 = new(LibCube:TimeMember);
    time2k13.dimension = DIMENSION_TIME;
    time2k13.label = "2013";
    time2k13.date = Date..stringToDate("2013-01-01");

    time1986 = new(LibCube:TimeMember);
    time1986.dimension = DIMENSION_TIME;
    time1986.label = "1986";
    time1986.date = Date..stringToDate("1986-01-01");
    //-----------------------------------------------------------------------------------------

    //init of every fact that will be inside the factSorter class
    fact2k18 = new(LibCube:Fact);
    fact2k18.timeMember = time2k18;//setting the fact shape 
    fact2k18.members.add(time2k18);//setting the fact shape

    fact2k17 = new(LibCube:Fact);
    fact2k17.timeMember = time2k17;//setting the fact shape 
    fact2k17.members.add(time2k17);//setting the fact shape

    fact2k16 = new(LibCube:Fact);
    fact2k16.timeMember = time2k16;//setting the fact shape 
    fact2k16.members.add(time2k16);//setting the fact shape
    
    fact2k15 = new(LibCube:Fact);
    fact2k15.timeMember = time2k15;//setting the fact shape 
    fact2k15.members.add(time2k15);//setting the fact shape

    fact2k14 = new(LibCube:Fact);
    fact2k14.timeMember = time2k14;//setting the fact shape 
    fact2k14.members.add(time2k14);//setting the fact shape

    fact2k13 = new(LibCube:Fact);
    fact2k13.timeMember = time2k13;//setting the fact shape 
    fact2k13.members.add(time2k13);//setting the fact shape

    fact1986 = new(LibCube:Fact);
    fact1986.timeMember = time1986;//setting the fact shape 
    fact1986.members.add(time1986);//setting the fact shape
    //---------------------------------------------------------------------------------------

    //Adding the every fact to facts list
    facts = new(List); 
    facts.add(fact2k16);
    facts.add(fact2k13);
    facts.add(fact2k18);
    facts.add(fact1986);
    facts.add(fact2k14);
    facts.add(fact2k17);
    facts.add(fact2k15);
    //----------------------------------------------------------------------------------------

    //init and setting of factSorter class 
    sorter = new(LibCube:FactsSorter);
    sorter.facts = facts;
    sorter.sortType = SORT_TYPE_DIMENSION;
    sorter.dimension = time2k16.dimension;
    sorter.sortFacts();
    //Calling test case function
    bottomFact = sorter.getBottomFact();
    topFact = sorter.getTopFact();
    //sorter.sortFacts(); sort facts from low to high when sortType is SORT_TYPE_DIMENSION example {2,1,3} --> {1,2,3}
    assert(bottomFact == fact2k18);
    assert(topFact == fact1986);
    assert(sorter.sortedFacts.get(2) == fact2k13);
    assert(sorter.sortedFacts.get(4) == fact2k15);
    assert(sorter.sortedFacts.get(6) == fact2k17);


    logInfo("LibCube:Test:factsDimensionSorterCaseTimeDimension() passed");
}
;

function LibCube:Test:factsDimensionSorterCaseAnyDimension()
 local {
    LibCube:FactsSorter sorter
    LibCube:Fact bottomFact
    LibCube:Fact topFact
    LibCube:Member memberDallas
    LibCube:Member memberBogota
    LibCube:Member memberNewYork
    LibCube:Member memberParis
    LibCube:Member memberBuenosAires
    LibCube:Member memberLima
    LibCube:Member memberMexicoDF
    
    LibCube:Fact factDallas
    LibCube:Fact factBogota
    LibCube:Fact factNewYork
    LibCube:Fact factParis
    LibCube:Fact factBuenosAires
    LibCube:Fact factLima
    LibCube:Fact factMexicoDF

    List facts
}
--> action {
    logInfo("Testing factsDimensionSorterCaseAnyDimension");

    //fact value and label to give them shape-------------------------------------------------
    memberDallas = new(LibCube:Member);
    memberDallas.dimension = DIMENSION_CITY;
    memberDallas.label = "DALLAS";

    memberBogota = new(LibCube:Member);
    memberBogota.dimension = DIMENSION_CITY;
    memberBogota.label = "BOGOTA";

    memberNewYork = new(LibCube:Member);
    memberNewYork.dimension = DIMENSION_CITY;
    memberNewYork.label = "NEW YORK";

    memberParis = new(LibCube:Member);
    memberParis.dimension = DIMENSION_CITY;
    memberParis.label = "PARIS";

    memberBuenosAires = new(LibCube:Member);
    memberBuenosAires.dimension = DIMENSION_CITY;
    memberBuenosAires.label = "BUENOS AIRES";

    memberLima = new(LibCube:Member);
    memberLima.dimension = DIMENSION_CITY;
    memberLima.label = "LIMA";

    memberMexicoDF = new(LibCube:Member);
    memberMexicoDF.dimension = DIMENSION_CITY;
    memberMexicoDF.label = "MEXICO DF";
    //-----------------------------------------------------------------------------------------

    //init of every fact that will be inside the factSorter class
    factDallas = new(LibCube:Fact);
    factDallas.members.add(memberDallas);//setting the fact shape

    factBogota = new(LibCube:Fact);
    factBogota.members.add(memberBogota);//setting the fact shape

    factNewYork = new(LibCube:Fact);
    factNewYork.members.add(memberNewYork);//setting the fact shape
    
    factParis = new(LibCube:Fact);
    factParis.members.add(memberParis);//setting the fact shape

    factBuenosAires = new(LibCube:Fact);
    factBuenosAires.members.add(memberBuenosAires);//setting the fact shape

    factLima = new(LibCube:Fact);
    factLima.members.add(memberLima);//setting the fact shape

    factMexicoDF = new(LibCube:Fact);
    factMexicoDF.members.add(memberMexicoDF);//setting the fact shape
    //---------------------------------------------------------------------------------------

    //Adding the every fact to facts list
    facts = new(List); 
    facts.add(factNewYork);
    facts.add(factBuenosAires);
    facts.add(factDallas);
    facts.add(factBogota);
    facts.add(factLima);
    facts.add(factParis);
    facts.add(factMexicoDF);
    //----------------------------------------------------------------------------------------

    //init and setting of factSorter class 
    sorter = new(LibCube:FactsSorter);
    sorter.facts = facts;
    sorter.sortType = SORT_TYPE_DIMENSION;
    sorter.dimension = memberBuenosAires.dimension;
    sorter.sortFacts();//should be Bogota,Buenos Aires,Dallas,Lima,MexicoDF,NewYork, Paris
    //Calling test case function
    bottomFact = sorter.getBottomFact();
    topFact = sorter.getTopFact();
    //sorter.sortFacts(); sort facts in desc order when sortType is SORT_TYPE_DIMENSION example {2,1,3} --> {1,2,3}
    assert(bottomFact == factParis);
    assert(topFact == factBogota);
    assert(sorter.sortedFacts.get(2) == factBuenosAires);
    assert(sorter.sortedFacts.get(4) == factLima);
    assert(sorter.sortedFacts.get(6) == factNewYork);

    logInfo("LibCube:Test:factsDimensionSorterCaseAnyDimension() passed");
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
    LibCube:Test:factsSorter();//issue4
    LibCube:Test:factsDimensionSorterCaseTimeDimension();//issue15
    LibCube:Test:factsDimensionSorterCaseAnyDimension();//issue15
    LibCube:Test:groupedFactsSelection();
}
;

