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

function LibCube:Test:factsDimensionSorterHelper()
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
    logInfo("Testing factsDimensionSorterHelper");

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

    //calling helper function
    sorter = getOneDimensionSorter(facts,memberBuenosAires.dimension);

    //Calling test case function
    bottomFact = sorter.getBottomFact();
    topFact = sorter.getTopFact();
    //sorter.sortFacts(); sort facts in desc order when sortType is SORT_TYPE_DIMENSION example {2,1,3} --> {1,2,3}
    assert(bottomFact == factParis);
    assert(topFact == factBogota);
    assert(sorter.sortedFacts.get(2) == factBuenosAires);
    assert(sorter.sortedFacts.get(4) == factLima);
    assert(sorter.sortedFacts.get(6) == factNewYork);

    logInfo("LibCube:Test:factsDimensionSorterHelper() passed");
}
;

function LibCube:Test:timeMember()
local {
    LibCube:TimeMember timeMember
    Date dateFoundForLastDayOfPeriod
    Date dateFoundForFirstDayOfPeriod
    Date dateComparatorForLastDayOfPeriod
    Date dateComparatorForFirstDayOfPeriod
    Integer dayCountFound
    Integer dayCountComparator
    libCube:_constLists:quarter quarterFound
    libCube:_constLists:quarter quarterComparator
}
--> action {
    logInfo("Testing timeMember");
    timeMember = new(LibCube:TimeMember);
    //CASE TESTING getQuarter()
        //CASE 1
    timeMember.date = Date..stringToDate("1986-01-01");
    timeMember.getQuarter();
    quarterFound = timeMember.quarter;
    quarterComparator = Q1;
    assert(quarterFound == quarterComparator);
        //CASE 2
    timeMember.date = Date..stringToDate("2017-03-31");
    timeMember.getQuarter();
    quarterFound = timeMember.quarter;
    quarterComparator = Q1;
    assert(quarterFound == quarterComparator);
        //CASE 3
    timeMember.date = Date..stringToDate("2018-04-01");
    timeMember.getQuarter();
    quarterFound = timeMember.quarter;
    quarterComparator = Q2;
    assert(quarterFound == quarterComparator);
        //CASE 4
    timeMember.date = Date..stringToDate("2018-06-30");
    timeMember.getQuarter();
    quarterFound = timeMember.quarter;
    quarterComparator = Q2;
    assert(quarterFound == quarterComparator);
        //CASE 5
    timeMember.date = Date..stringToDate("2018-07-01");
    timeMember.getQuarter();
    quarterFound = timeMember.quarter;
    quarterComparator = Q3;
    assert(quarterFound == quarterComparator);
        //CASE 6
    timeMember.date = Date..stringToDate("2018-08-26");
    timeMember.getQuarter();
    quarterFound = timeMember.quarter;
    quarterComparator = Q3;
    assert(quarterFound == quarterComparator);
        //CASE 7
    timeMember.date = Date..stringToDate("2018-09-30");
    timeMember.getQuarter();
    quarterFound = timeMember.quarter;
    quarterComparator = Q3;
    assert(quarterFound == quarterComparator);
        //CASE 8
    timeMember.date = Date..stringToDate("2018-10-01");
    timeMember.getQuarter();
    quarterFound = timeMember.quarter;
    quarterComparator = Q4;
    assert(quarterFound == quarterComparator);
        //CASE 9
    timeMember.date = Date..stringToDate("2018-12-31");
    timeMember.getQuarter();
    quarterFound = timeMember.quarter;
    quarterComparator = Q4;
    assert(quarterFound == quarterComparator);
        //CASE 10
    timeMember.date = Date..stringToDate("2016-04-13");
    timeMember.getQuarter();
    quarterFound = timeMember.quarter;
    quarterComparator = Q2;
    assert(quarterFound == quarterComparator);

    logInfo("CASE TESTING getQuarter() passed");

    //CASE timeMember.period = PERIOD_DAY;
    timeMember.period = PERIOD_DAY;
    timeMember.date = Date..stringToDate("1986-01-01");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("1986-01-01");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("1986-01-01");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 1;
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
    logInfo("CASE timeMember.period = PERIOD_DAY passed");

    //CASE timeMember.period = PERIOD_MONTH;
    timeMember.period = PERIOD_MONTH;
        //CASE 1
    timeMember.date = Date..stringToDate("2018-02-01");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("2018-02-28");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2018-02-01");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 1;
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
        //CASE 2
    timeMember.date = Date..stringToDate("2020-02-01");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("2020-02-29");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2020-02-01");
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    logInfo("CASE timeMember.period = PERIOD_MONTH passed");
        //CASE 3
    timeMember.date = Date..stringToDate("2020-02-25");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 25;
    assert(dayCountFound == dayCountComparator);

    //CASE timeMember.period = PERIOD_YEAR;
    timeMember.period = PERIOD_YEAR;
    timeMember.date = Date..stringToDate("2017-04-20");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("2017-12-31");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2017-01-01");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 110;
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
    logInfo("CASE timeMember.period = PERIOD_YEAR passed");

    //CASE timeMember.period = PERIOD_QUARTER;
    timeMember.period = PERIOD_QUARTER;
        //CASE 1
    timeMember.date = Date..stringToDate("2018-03-20");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("2018-03-31");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2018-01-01");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 79;
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
        //CASE 2
    timeMember.date = Date..stringToDate("2018-03-31");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("2018-03-31");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2018-01-01");
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
        //CASE 3
    timeMember.date = Date..stringToDate("2018-01-02");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("2018-03-31");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2018-01-01");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 2;
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
        //CASE 4
    timeMember.date = Date..stringToDate("2018-04-02");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("2018-06-30");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2018-04-01");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 2;
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
        //CASE 5
    timeMember.date = Date..stringToDate("2018-08-15");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("2018-09-30");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2018-07-01");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 46;
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
        //CASE 6
    timeMember.date = Date..stringToDate("2018-10-25");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("2018-12-31");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2018-10-01");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 25;
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
        //CASE 7 LEAP YEAR
    timeMember.date = Date..stringToDate("2016-04-25");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 25;
    assert(dayCountFound == dayCountComparator);
        //CASE 8 NO LEAP YEAR
    timeMember.date = Date..stringToDate("2017-04-25");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 25;
    assert(dayCountFound == dayCountComparator);
    logInfo("CASE timeMember.period = PERIOD_QUARTER passed");
    
    //CASE timeMember.period = PERIOD_WEEK;
    timeMember.period = PERIOD_WEEK;
        // CASE 1
    timeMember.date = Date..stringToDate("2018-04-20");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("2018-04-22");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2018-04-16");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 5;
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
        // CASE 2
    timeMember.date = Date..stringToDate("2018-12-31");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("2019-01-06");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2018-12-31");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 1;
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
        // CASE 3
    timeMember.date = Date..stringToDate("2017-11-29");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("2017-12-03");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2017-11-27");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 3;
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
        // CASE 4
    timeMember.date = Date..stringToDate("2018-12-01");
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2018-11-26");
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
        // CASE 5
    timeMember.date = Date..stringToDate("2019-01-04");
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2018-12-31");
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
    logInfo("CASE timeMember.period = PERIOD_WEEK passed");

    //CASE PERIOD TO DATE
        //CASE YEAR
    timeMember.period = PERIOD_YTD;
    timeMember.date = Date..stringToDate("2017-04-20");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("2017-04-20");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2017-01-01");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 110;
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
        //CASE QUARTER
    timeMember.period = PERIOD_QTD;
    timeMember.date = Date..stringToDate("2018-03-20");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("2018-03-20");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2018-01-01");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 79;
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
        //CASE MONTH
    timeMember.period = PERIOD_MTD;
    timeMember.date = Date..stringToDate("2018-02-01");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("2018-02-01");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2018-02-01");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 1;
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
        // CASE WEEK
    timeMember.period = PERIOD_WTD;
    timeMember.date = Date..stringToDate("2018-04-20");
    dateFoundForLastDayOfPeriod = timeMember.getLastDayOfPeriod();
    dateFoundForFirstDayOfPeriod = timeMember.getFirstDayOfPeriod();
    dateComparatorForLastDayOfPeriod = Date..stringToDate("2018-04-20");
    dateComparatorForFirstDayOfPeriod = Date..stringToDate("2018-04-16");
    dayCountFound = timeMember.getDayCountOfPeriod();
    dayCountComparator = 5;
    assert(dateFoundForLastDayOfPeriod == dateComparatorForLastDayOfPeriod);
    assert(dateFoundForFirstDayOfPeriod == dateComparatorForFirstDayOfPeriod);
    assert(dayCountFound == dayCountComparator);
    logInfo("CASE TO DATE passed");

    logInfo("LibCube:Test:timeMember() passed");
}
;

function LibCube:Test:twoMeasuresOneFactComparison()
 local {
     LibCube:TwoMeasuresOneFactComparison twoMeasuresOneFactComparison

     LibCube:Fact comparingFact
     LibCube:FactMeasure comparingFactMeasure1
     LibCube:FactMeasure comparingFactMeasure2
     LibCube:Measure measure
     LibCube:Measure referenceMeasure

     LibCube:Member storeMember
 }
 --> action {
    logInfo("Testing twoMeasuresOneFactComparison");
    
    //Setting measures
    measure = new (LibCube:Measure);
    measure.label = "unitValue";
    referenceMeasure = new (LibCube:Measure);
    referenceMeasure.label = "soldUnits";

    //Setting factMeasures
    comparingFactMeasure1 = new(LibCube:FactMeasure);
    comparingFactMeasure1.value = 150000;
    comparingFactMeasure1.measure = measure;
    comparingFactMeasure2 = new(LibCube:FactMeasure);
    comparingFactMeasure2.value = 10;
    comparingFactMeasure2.measure = referenceMeasure;

    //Setting members
    storeMember = new(LibCube:Member);
    storeMember.dimension = DIMENSION_STORE;
    storeMember.label = "SuperStic Store";

    comparingFact = new(LibCube:Fact);
    comparingFact.members.add(storeMember);
    comparingFact.factMeasures.add(comparingFactMeasure1);
    comparingFact.factMeasures.add(comparingFactMeasure2);
    
    twoMeasuresOneFactComparison = new(LibCube:TwoMeasuresOneFactComparison);
    
    //CASE 1 areComparedValuesRelative = true
    twoMeasuresOneFactComparison.areComparedValuesRelative = true;
    twoMeasuresOneFactComparison.fact = comparingFact;
    twoMeasuresOneFactComparison.measure = measure;
    twoMeasuresOneFactComparison.referenceMeasure = referenceMeasure;
    twoMeasuresOneFactComparison.compute();
    assert(comparingFactMeasure1.value == twoMeasuresOneFactComparison.currentValue);
    assert(comparingFactMeasure2.value == twoMeasuresOneFactComparison.referenceValue);
    //change = value - referenceValue
    assert(comparingFactMeasure1.value - comparingFactMeasure2.value  == twoMeasuresOneFactComparison.change);
    //if areComparedValuesRelative == true then relativeChange = change
    assert(twoMeasuresOneFactComparison.relativeChange == twoMeasuresOneFactComparison.change);
    //absRelativeChange
    assert(twoMeasuresOneFactComparison.absRelativeChange == abs(twoMeasuresOneFactComparison.change));
    //absDiff = abs(change)
    assert(twoMeasuresOneFactComparison.absDiff == abs(twoMeasuresOneFactComparison.change));
    //relativeDiffWithMax
    assert(twoMeasuresOneFactComparison.relativeDiffWithMax == null);
    //relativeDiffWithAbsMax
    assert(twoMeasuresOneFactComparison.relativeDiffWithAbsMax == null);
    //relativeDiffWithAvg
    assert(twoMeasuresOneFactComparison.relativeDiffWithAvg == null);
    
    //CASE 2 areComparedValuesRelative = false referenceValue = 0
    twoMeasuresOneFactComparison.areComparedValuesRelative = false;
    twoMeasuresOneFactComparison.fact = comparingFact;
    twoMeasuresOneFactComparison.measure = measure;
    twoMeasuresOneFactComparison.referenceMeasure = referenceMeasure;
    //Changing values
    twoMeasuresOneFactComparison.fact.getMeasure(referenceMeasure).value =0;
    //Calling compute
    twoMeasuresOneFactComparison.compute();
    assert(comparingFactMeasure1.value == twoMeasuresOneFactComparison.currentValue);
    assert(comparingFactMeasure2.value == twoMeasuresOneFactComparison.referenceValue);
    //change = value - referenceValue
    assert(comparingFactMeasure1.value - comparingFactMeasure2.value  == twoMeasuresOneFactComparison.change);
    //absDiff = abs(change)
    assert(twoMeasuresOneFactComparison.absDiff == abs(twoMeasuresOneFactComparison.change));

    //if areComparedValuesRelative == false then relativeChange = change
    assert(twoMeasuresOneFactComparison.relativeChange == null);
    //absRelativeChange
    assert(twoMeasuresOneFactComparison.absRelativeChange == null);
    //relativeDiffWithMax = absDiff / abs( max(value, referenceValue) )
    assert(twoMeasuresOneFactComparison.relativeDiffWithMax == ( twoMeasuresOneFactComparison.absDiff / abs(max(twoMeasuresOneFactComparison.currentValue, twoMeasuresOneFactComparison.referenceValue) )));
    //relativeDiffWithAbsMax = absDiff / max( abs(value), abs(referenceValue) )
    assert(twoMeasuresOneFactComparison.relativeDiffWithAbsMax == ( twoMeasuresOneFactComparison.absDiff / max( abs(twoMeasuresOneFactComparison.currentValue), abs(twoMeasuresOneFactComparison.referenceValue) )));
    //relativeDiffWithAvg = absDiff / average( abs(value), abs(referenceValue) )
    assert(twoMeasuresOneFactComparison.relativeDiffWithAvg == ( twoMeasuresOneFactComparison.absDiff / average( abs(twoMeasuresOneFactComparison.currentValue) ,abs(twoMeasuresOneFactComparison.referenceValue) )));
    
    //CASE 3 areComparedValuesRelative = false, referenceValue = 0, value=0
    twoMeasuresOneFactComparison.areComparedValuesRelative = false;
    twoMeasuresOneFactComparison.fact = comparingFact;
    twoMeasuresOneFactComparison.measure = measure;
    twoMeasuresOneFactComparison.referenceMeasure = referenceMeasure;
    //Changing values
    twoMeasuresOneFactComparison.fact.getMeasure(referenceMeasure).value =0;
    twoMeasuresOneFactComparison.fact.getMeasure(measure).value =0;
    //Calling compute
    twoMeasuresOneFactComparison.compute();
    assert(comparingFactMeasure1.value == twoMeasuresOneFactComparison.currentValue);
    assert(comparingFactMeasure2.value == twoMeasuresOneFactComparison.referenceValue);
    //change = value - referenceValue
    assert(comparingFactMeasure1.value - comparingFactMeasure2.value  == twoMeasuresOneFactComparison.change);
    //absDiff = abs(change)
    assert(twoMeasuresOneFactComparison.absDiff == abs(twoMeasuresOneFactComparison.change));

    //if areComparedValuesRelative == false then relativeChange = change
    assert(twoMeasuresOneFactComparison.relativeChange == null);
    //absRelativeChange
    assert(twoMeasuresOneFactComparison.absRelativeChange == null);
    //relativeDiffWithMax = null
    assert(twoMeasuresOneFactComparison.relativeDiffWithMax == null );
    //relativeDiffWithAbsMax = null
    assert(twoMeasuresOneFactComparison.relativeDiffWithAbsMax == null );
    //relativeDiffWithAvg = absDiff / average( abs(value), abs(referenceValue) )
    assert(twoMeasuresOneFactComparison.relativeDiffWithAvg == null);
    
    //CASE 4 areComparedValuesRelative = false, referenceValue > 0, value >0
    twoMeasuresOneFactComparison.areComparedValuesRelative = false;
    twoMeasuresOneFactComparison.fact = comparingFact;
    twoMeasuresOneFactComparison.measure = measure;
    twoMeasuresOneFactComparison.referenceMeasure = referenceMeasure;
    //Changing values
    twoMeasuresOneFactComparison.fact.getMeasure(referenceMeasure).value =2;
    twoMeasuresOneFactComparison.fact.getMeasure(measure).value =4;
    //Calling compute
    twoMeasuresOneFactComparison.compute();
    assert(comparingFactMeasure1.value == twoMeasuresOneFactComparison.currentValue);
    assert(comparingFactMeasure2.value == twoMeasuresOneFactComparison.referenceValue);
    //change = value - referenceValue
    assert(comparingFactMeasure1.value - comparingFactMeasure2.value  == twoMeasuresOneFactComparison.change);
    //absDiff = abs(change)
    assert(twoMeasuresOneFactComparison.absDiff == abs(twoMeasuresOneFactComparison.change));

    //if areComparedValuesRelative == false then relativeChange = change / referenceValue
    assert(twoMeasuresOneFactComparison.relativeChange == twoMeasuresOneFactComparison.change / twoMeasuresOneFactComparison.referenceValue );
    //absRelativeChange = abs(relativeChange)
    assert(twoMeasuresOneFactComparison.absRelativeChange == abs(twoMeasuresOneFactComparison.relativeChange) );
    //relativeDiffWithMax = absDiff / abs( max(value, referenceValue) )
    assert(twoMeasuresOneFactComparison.relativeDiffWithMax == twoMeasuresOneFactComparison.absDiff / abs( max(twoMeasuresOneFactComparison.currentValue, twoMeasuresOneFactComparison.referenceValue)) );
    //relativeDiffWithAbsMax = absDiff / max( abs(value), abs(referenceValue) )
    assert(twoMeasuresOneFactComparison.relativeDiffWithAbsMax == twoMeasuresOneFactComparison.absDiff / max( abs(twoMeasuresOneFactComparison.currentValue), abs(twoMeasuresOneFactComparison.referenceValue)) );
    //relativeDiffWithAvg = absDiff / average( abs(value), abs(referenceValue) )
    assert(twoMeasuresOneFactComparison.relativeDiffWithAvg == twoMeasuresOneFactComparison.absDiff / average( abs(twoMeasuresOneFactComparison.currentValue), abs(twoMeasuresOneFactComparison.referenceValue) ) );
    
    logInfo("LibCube:Test:twoMeasuresOneFactComparison() passed");

 }
 ;

function LibCube:Test:twoFactsOneMesureComparison()
local {

     LibCube:TwoFactsOneMeasureComparison twoFactsOneMeasureComparison
     LibCube:Fact fact
     LibCube:FactMeasure factMeasure
     LibCube:Fact referenceFact
     LibCube:FactMeasure referenceFactMeasure
     LibCube:Measure comparingMeasure
     
     LibCube:Member storeMember
 }
 --> action {
    logInfo("Testing twoFactsOneMesureComparison");
    
    //Setting measures
    comparingMeasure = new (LibCube:Measure);
    comparingMeasure.label = "unitValue";

    //Setting factMeasures
    factMeasure = new(LibCube:FactMeasure);
    factMeasure.value = 150000;
    factMeasure.measure = comparingMeasure;
    referenceFactMeasure = new(LibCube:FactMeasure);
    referenceFactMeasure.value = 10;
    referenceFactMeasure.measure = comparingMeasure;

    //Setting members
    storeMember = new(LibCube:Member);
    storeMember.dimension = DIMENSION_STORE;
    storeMember.label = "SuperStic Store";

    //Setting the facts
    fact = new(LibCube:Fact);
    fact.members.add(storeMember);
    fact.factMeasures.add(factMeasure);

    referenceFact = new(LibCube:Fact);
    referenceFact.members.add(storeMember);
    referenceFact.factMeasures.add(referenceFactMeasure);
    
    twoFactsOneMeasureComparison = new(LibCube:TwoFactsOneMeasureComparison);
    
    //CASE 1 areComparedValuesRelative = true
    twoFactsOneMeasureComparison.areComparedValuesRelative = true;
    twoFactsOneMeasureComparison.fact = fact;
    twoFactsOneMeasureComparison.referenceFact = referenceFact;
    twoFactsOneMeasureComparison.measure = comparingMeasure;
    twoFactsOneMeasureComparison.compute();
    assert(factMeasure.value == twoFactsOneMeasureComparison.currentValue);
    assert(referenceFactMeasure.value == twoFactsOneMeasureComparison.referenceValue);
    //change = measureValue - referenceValue
    assert(factMeasure.value - referenceFactMeasure.value  == twoFactsOneMeasureComparison.change);
    //if areComparedValuesRelative == true then relativeChange = change
    assert(twoFactsOneMeasureComparison.relativeChange == twoFactsOneMeasureComparison.change);
    //absRelativeChange
    assert(twoFactsOneMeasureComparison.absRelativeChange == abs(twoFactsOneMeasureComparison.change));
    //absDiff = abs(change)
    assert(twoFactsOneMeasureComparison.absDiff == abs(twoFactsOneMeasureComparison.change));
    //relativeDiffWithMax
    assert(twoFactsOneMeasureComparison.relativeDiffWithMax == null);
    //relativeDiffWithAbsMax
    assert(twoFactsOneMeasureComparison.relativeDiffWithAbsMax == null);
    //relativeDiffWithAvg
    assert(twoFactsOneMeasureComparison.relativeDiffWithAvg == null);
    
    //CASE 2 areComparedValuesRelative = false referenceValue = 0
    twoFactsOneMeasureComparison.areComparedValuesRelative = false;
    twoFactsOneMeasureComparison.fact = fact;
    twoFactsOneMeasureComparison.measure = comparingMeasure;
    //Changing values
    twoFactsOneMeasureComparison.referenceFact.getMeasure(comparingMeasure).value =0;
    //Calling compute
    twoFactsOneMeasureComparison.compute();
    assert(factMeasure.value == twoFactsOneMeasureComparison.currentValue);
    assert(referenceFactMeasure.value == twoFactsOneMeasureComparison.referenceValue);
    //change = measureValue - referenceValue
    assert(factMeasure.value - referenceFactMeasure.value  == twoFactsOneMeasureComparison.change);
    //absDiff = abs(change)
    assert(twoFactsOneMeasureComparison.absDiff == abs(twoFactsOneMeasureComparison.change));

    //if areComparedValuesRelative == false then relativeChange = change
    assert(twoFactsOneMeasureComparison.relativeChange == null);
    //absRelativeChange
    assert(twoFactsOneMeasureComparison.absRelativeChange == null);
    //relativeDiffWithMax = absDiff / abs( max(measureValue, referenceValue) )
    assert(twoFactsOneMeasureComparison.relativeDiffWithMax == ( twoFactsOneMeasureComparison.absDiff / abs(max(twoFactsOneMeasureComparison.currentValue, twoFactsOneMeasureComparison.referenceValue) )));
    //relativeDiffWithAbsMax = absDiff / max( abs(measureValue), abs(referenceValue) )
    assert(twoFactsOneMeasureComparison.relativeDiffWithAbsMax == ( twoFactsOneMeasureComparison.absDiff / max( abs(twoFactsOneMeasureComparison.currentValue), abs(twoFactsOneMeasureComparison.referenceValue) )));
    //relativeDiffWithAvg = absDiff / average( abs(measureValue), abs(referenceValue) )
    assert(twoFactsOneMeasureComparison.relativeDiffWithAvg == ( twoFactsOneMeasureComparison.absDiff / average( abs(twoFactsOneMeasureComparison.currentValue) ,abs(twoFactsOneMeasureComparison.referenceValue) )));
    
    //CASE 3 areComparedValuesRelative = false, referenceValue = 0, value=0
    twoFactsOneMeasureComparison.areComparedValuesRelative = false;
    twoFactsOneMeasureComparison.fact = fact;
    twoFactsOneMeasureComparison.measure = comparingMeasure;
    //Changing values
    twoFactsOneMeasureComparison.fact.getMeasure(comparingMeasure).value =0;
    twoFactsOneMeasureComparison.referenceFact.getMeasure(comparingMeasure).value =0;
    //Calling compute
    twoFactsOneMeasureComparison.compute();
    assert(factMeasure.value == twoFactsOneMeasureComparison.currentValue);
    assert(referenceFactMeasure.value == twoFactsOneMeasureComparison.referenceValue);
    //change = measureValue - referenceValue
    assert(factMeasure.value - referenceFactMeasure.value  == twoFactsOneMeasureComparison.change);
    //absDiff = abs(change)
    assert(twoFactsOneMeasureComparison.absDiff == abs(twoFactsOneMeasureComparison.change));

    //if areComparedValuesRelative == false then relativeChange = change
    assert(twoFactsOneMeasureComparison.relativeChange == null);
    //absRelativeChange
    assert(twoFactsOneMeasureComparison.absRelativeChange == null);
    //relativeDiffWithMax = null
    assert(twoFactsOneMeasureComparison.relativeDiffWithMax == null );
    //relativeDiffWithAbsMax = null
    assert(twoFactsOneMeasureComparison.relativeDiffWithAbsMax == null );
    //relativeDiffWithAvg = absDiff / average( abs(measureValue), abs(referenceValue) )
    assert(twoFactsOneMeasureComparison.relativeDiffWithAvg == null);
    
    //CASE 4 areComparedValuesRelative = false, referenceValue > 0, value >0
    twoFactsOneMeasureComparison.areComparedValuesRelative = false;
    twoFactsOneMeasureComparison.fact = fact;
    twoFactsOneMeasureComparison.measure = comparingMeasure;
    //Changing values
    twoFactsOneMeasureComparison.fact.getMeasure(comparingMeasure).value =2;
    twoFactsOneMeasureComparison.referenceFact.getMeasure(comparingMeasure).value =4;
    //Calling compute
    twoFactsOneMeasureComparison.compute();
    assert(factMeasure.value == twoFactsOneMeasureComparison.currentValue);
    assert(referenceFactMeasure.value == twoFactsOneMeasureComparison.referenceValue);
    //change = measureValue - referenceValue
    assert(factMeasure.value - referenceFactMeasure.value  == twoFactsOneMeasureComparison.change);
    //absDiff = abs(change)
    assert(twoFactsOneMeasureComparison.absDiff == abs(twoFactsOneMeasureComparison.change));

    //if areComparedValuesRelative == false then relativeChange = change / referenceValue
    assert(twoFactsOneMeasureComparison.relativeChange == twoFactsOneMeasureComparison.change / twoFactsOneMeasureComparison.referenceValue );
    //absRelativeChange = abs(relativeChange)
    assert(twoFactsOneMeasureComparison.absRelativeChange == abs(twoFactsOneMeasureComparison.relativeChange) );
    //relativeDiffWithMax = absDiff / abs( max(measureValue, referenceValue) )
    assert(twoFactsOneMeasureComparison.relativeDiffWithMax == twoFactsOneMeasureComparison.absDiff / abs( max(twoFactsOneMeasureComparison.currentValue, twoFactsOneMeasureComparison.referenceValue)) );
    //relativeDiffWithAbsMax = absDiff / max( abs(measureValue), abs(referenceValue) )
    assert(twoFactsOneMeasureComparison.relativeDiffWithAbsMax == twoFactsOneMeasureComparison.absDiff / max( abs(twoFactsOneMeasureComparison.currentValue), abs(twoFactsOneMeasureComparison.referenceValue)) );
    //relativeDiffWithAvg = absDiff / average( abs(measureValue), abs(referenceValue) )
    assert(twoFactsOneMeasureComparison.relativeDiffWithAvg == twoFactsOneMeasureComparison.absDiff / average( abs(twoFactsOneMeasureComparison.currentValue), abs(twoFactsOneMeasureComparison.referenceValue) ) );
    
    logInfo("LibCube:Test:twoFactsOneMeasureComparison() passed");
 }
 ;

function LibCube:Test:getMeasuresComparison()
local {
    LibCube:TwoMeasuresOneFactComparison twoMeasuresOneFactComparison
    LibCube:Measure measure
    LibCube:Measure referenceMeasure
    LibCube:Fact comparingFact

    LibCube:FactMeasure comparingFactMeasure1
    LibCube:FactMeasure comparingFactMeasure2
    LibCube:Member storeMember
}
--> action {

    logInfo("Testing getMeasuresComparison");
    
    //Setting measures
    measure = new (LibCube:Measure);
    measure.label = "unitValue";
    referenceMeasure = new (LibCube:Measure);
    referenceMeasure.label = "soldUnits";

    //Setting factMeasures
    comparingFactMeasure1 = new(LibCube:FactMeasure);
    comparingFactMeasure1.value = 150000;
    comparingFactMeasure1.measure = measure;
    comparingFactMeasure2 = new(LibCube:FactMeasure);
    comparingFactMeasure2.value = 10;
    comparingFactMeasure2.measure = referenceMeasure;

    //Setting members
    storeMember = new(LibCube:Member);
    storeMember.dimension = DIMENSION_STORE;
    storeMember.label = "SuperStic Store";

    comparingFact = new(LibCube:Fact);
    comparingFact.members.add(storeMember);
    comparingFact.factMeasures.add(comparingFactMeasure1);
    comparingFact.factMeasures.add(comparingFactMeasure2);
    
    twoMeasuresOneFactComparison = getMeasuresComparison(measure,referenceMeasure,comparingFact);
    
    //CASE 4 areComparedValuesRelative = false, referenceValue > 0, value >0
    assert(comparingFactMeasure1.value == twoMeasuresOneFactComparison.currentValue);
    assert(comparingFactMeasure2.value == twoMeasuresOneFactComparison.referenceValue);
    //change = value - referenceValue
    assert(comparingFactMeasure1.value - comparingFactMeasure2.value  == twoMeasuresOneFactComparison.change);
    //absDiff = abs(change)
    assert(twoMeasuresOneFactComparison.absDiff == abs(twoMeasuresOneFactComparison.change));

    //if areComparedValuesRelative == false then relativeChange = change / referenceValue
    assert(twoMeasuresOneFactComparison.relativeChange == twoMeasuresOneFactComparison.change / twoMeasuresOneFactComparison.referenceValue );
    //absRelativeChange = abs(relativeChange)
    assert(twoMeasuresOneFactComparison.absRelativeChange == abs(twoMeasuresOneFactComparison.relativeChange) );
    //relativeDiffWithMax = absDiff / abs( max(value, referenceValue) )
    assert(twoMeasuresOneFactComparison.relativeDiffWithMax == twoMeasuresOneFactComparison.absDiff / abs( max(twoMeasuresOneFactComparison.currentValue, twoMeasuresOneFactComparison.referenceValue)) );
    //relativeDiffWithAbsMax = absDiff / max( abs(value), abs(referenceValue) )
    assert(twoMeasuresOneFactComparison.relativeDiffWithAbsMax == twoMeasuresOneFactComparison.absDiff / max( abs(twoMeasuresOneFactComparison.currentValue), abs(twoMeasuresOneFactComparison.referenceValue)) );
    //relativeDiffWithAvg = absDiff / average( abs(value), abs(referenceValue) )
    assert(twoMeasuresOneFactComparison.relativeDiffWithAvg == twoMeasuresOneFactComparison.absDiff / average( abs(twoMeasuresOneFactComparison.currentValue), abs(twoMeasuresOneFactComparison.referenceValue) ) );
    
    logInfo("LibCube:Test:getMeasuresComparison() passed");
}
;

function LibCube:Test:getFactsComparison()
local {

     LibCube:TwoFactsOneMeasureComparison twoFactsOneMeasureComparison
     LibCube:Fact fact
     LibCube:FactMeasure factMeasure
     LibCube:Fact referenceFact
     LibCube:FactMeasure referenceFactMeasure
     LibCube:Measure comparingMeasure
     
     LibCube:Member storeMember
 }
 --> action {
    logInfo("Testing getFactsComparison");
    
    //Setting measures
    comparingMeasure = new (LibCube:Measure);
    comparingMeasure.label = "unitValue";

    //Setting factMeasures
    factMeasure = new(LibCube:FactMeasure);
    factMeasure.value = 150000;
    factMeasure.measure = comparingMeasure;
    referenceFactMeasure = new(LibCube:FactMeasure);
    referenceFactMeasure.value = 10;
    referenceFactMeasure.measure = comparingMeasure;

    //Setting members
    storeMember = new(LibCube:Member);
    storeMember.dimension = DIMENSION_STORE;
    storeMember.label = "SuperStic Store";

    //Setting the facts
    fact = new(LibCube:Fact);
    fact.members.add(storeMember);
    fact.factMeasures.add(factMeasure);

    referenceFact = new(LibCube:Fact);
    referenceFact.members.add(storeMember);
    referenceFact.factMeasures.add(referenceFactMeasure);
    
    twoFactsOneMeasureComparison = getFactsComparison(fact,referenceFact,comparingMeasure);

    //CASE 4 areComparedValuesRelative = false, referenceValue > 0, value >0
    assert(factMeasure.value == twoFactsOneMeasureComparison.currentValue);
    assert(referenceFactMeasure.value == twoFactsOneMeasureComparison.referenceValue);
    //change = measureValue - referenceValue
    assert(factMeasure.value - referenceFactMeasure.value  == twoFactsOneMeasureComparison.change);
    //absDiff = abs(change)
    assert(twoFactsOneMeasureComparison.absDiff == abs(twoFactsOneMeasureComparison.change));

    //if areComparedValuesRelative == false then relativeChange = change / referenceValue
    assert(twoFactsOneMeasureComparison.relativeChange == twoFactsOneMeasureComparison.change / twoFactsOneMeasureComparison.referenceValue );
    //absRelativeChange = abs(relativeChange)
    assert(twoFactsOneMeasureComparison.absRelativeChange == abs(twoFactsOneMeasureComparison.relativeChange) );
    //relativeDiffWithMax = absDiff / abs( max(measureValue, referenceValue) )
    assert(twoFactsOneMeasureComparison.relativeDiffWithMax == twoFactsOneMeasureComparison.absDiff / abs( max(twoFactsOneMeasureComparison.currentValue, twoFactsOneMeasureComparison.referenceValue)) );
    //relativeDiffWithAbsMax = absDiff / max( abs(measureValue), abs(referenceValue) )
    assert(twoFactsOneMeasureComparison.relativeDiffWithAbsMax == twoFactsOneMeasureComparison.absDiff / max( abs(twoFactsOneMeasureComparison.currentValue), abs(twoFactsOneMeasureComparison.referenceValue)) );
    //relativeDiffWithAvg = absDiff / average( abs(measureValue), abs(referenceValue) )
    assert(twoFactsOneMeasureComparison.relativeDiffWithAvg == twoFactsOneMeasureComparison.absDiff / average( abs(twoFactsOneMeasureComparison.currentValue), abs(twoFactsOneMeasureComparison.referenceValue) ) );
    
    logInfo("LibCube:Test:getFactsComparison() passed");
 }
 ;

function LibCube:Test:getMeasureValue()
 local {
    LibCube:Measure valueMeasure
    LibCube:Measure valueMeasure2
    LibCube:Fact fact
    LibCube:FactMeasure factMeasure
    LibCube:FactMeasure factMeasure2
    LibCube:FactMeasure comparingFactMeasure
}
--> action {
    logInfo("Testing getMeasureValue");

    //Setting measures
    valueMeasure = new (LibCube:Measure);
    valueMeasure.label = "MEASURE_SOLD_UNITS";
    valueMeasure2 = new (LibCube:Measure);
    valueMeasure2.label = "MEASURE_VALUE";

    //Setting factMeasure
    factMeasure = new(LibCube:FactMeasure);
    factMeasure.value = 150000;
    factMeasure.measure = valueMeasure;
    factMeasure2 = new(LibCube:FactMeasure);
    factMeasure2.value = 321;
    factMeasure2.measure = valueMeasure2;

    //Setting the facts
    fact = new(LibCube:Fact);
    fact.factMeasures.add(factMeasure);
    fact.factMeasures.add(factMeasure2);

    comparingFactMeasure = fact.getMeasureValue();
    
    assert(factMeasure2 == comparingFactMeasure );

    logInfo("LibCube:Test:getMeasureValue() passed");
}
;

function LibCube:Test:getMember()
 local {
    LibCube:Fact fact
    LibCube:Member storeMember
    LibCube:Member cityMember
    LibCube:Member productMember
    LibCube:Member comparatorMember
    LibCube:Fact fact
}
--> action {
    logInfo("Testing getMember");
    //Setting members
    storeMember = new(LibCube:Member);
    storeMember.dimension = DIMENSION_STORE;
    storeMember.label = "SuperStic Store";
    
    cityMember = new(LibCube:Member);
    cityMember.dimension = DIMENSION_CITY;
    cityMember.label = "Bogota";

    productMember = new(LibCube:Member);
    productMember.dimension = DIMENSION_PRODUCT;
    productMember.label = "Product American";

    //Setting the facts
    fact = new(LibCube:Fact);
    fact.members.add(storeMember);
    fact.members.add(cityMember);
    fact.members.add(productMember);

    comparatorMember = fact.getMember(DIMENSION_PRODUCT);
    assert(comparatorMember == productMember);
    comparatorMember = fact.getMember(DIMENSION_CITY);
    assert(comparatorMember == cityMember);
    comparatorMember = fact.getMember(DIMENSION_STORE);
    assert(comparatorMember == storeMember);

    logInfo("LibCube:Test:getMember() passed");
}
;

function LibCube:Test:groupedFactsSelection()
--> local LibCube:JointureGroupedFactsSelection jointureGroupedFactsSelection,
          LibCube:Fact fact1,
          LibCube:Fact fact2,
          LibCube:Member cityMember,
          LibCube:Member cityMember2,
          HashMap _groupedSelectedFacts
--> action {
    logInfo("Testing groupedFactsSelection");

    cityMember = new(LibCube:Member);
    cityMember.dimension = DIMENSION_CITY;
    cityMember.label = "Bogota";

    cityMember2 = new(LibCube:Member);
    cityMember2.dimension = DIMENSION_CITY;
    cityMember2.label = "Dallas";

    fact1 = new(LibCube:Fact);
    fact1.members.add(cityMember);
    fact2 = new(LibCube:Fact);
    fact2.members.add(cityMember2);
    
    jointureGroupedFactsSelection = new(LibCube:JointureGroupedFactsSelection);
    jointureGroupedFactsSelection.groupingDimension = DIMENSION_CITY;
    jointureGroupedFactsSelection.selectedFacts.add(fact1);
    jointureGroupedFactsSelection.selectedFacts.add(fact2);
    _groupedSelectedFacts = jointureGroupedFactsSelection.getGroupedFacts();

    assert(jointureGroupedFactsSelection.getFactsOfMember(cityMember) == _groupedSelectedFacts[cityMember]);
    assert(fact1 == _groupedSelectedFacts[cityMember].toList().get(_FIRST));
    assert(fact2 == _groupedSelectedFacts[cityMember2].toList().get(_FIRST));
    
    logInfo("LibCube:Test:groupedFactsSelection() passed");
}
;

function LibCube:Test:jointureDimensionConditionTest()
--> local LibCube:JointureDimensionCondition jointureDimensionCondition,
          LibCube:Dimension dimension, 
          LibCube:TimeMember time2k18,
          LibCube:Hierarchy hierarchy,
          Text comparatorText
--> action {

    logInfo("Testing jointureDimensionConditionTest");

    //fact value and label to give them shape-----------------------------
    time2k18 = new(LibCube:TimeMember);
    //time2k18.dimension = DIMENSION_TIME;
    time2k18.label = "2018";
    time2k18.mdxName = "TimeMember2018MDX";
    time2k18.date = Date..stringToDate("2018-01-01");

    hierarchy = new(LibCube:Hierarchy);
    hierarchy.mdxName = "hierarchyMDX";

    dimension = new(LibCube:Dimension);
    dimension.members.add(time2k18);
    dimension.mdxName = "dimensionMDX";
    time2k18.dimension = dimension;
    dimension.hierarchies.add(hierarchy);
    
    //CASE 1 No members in jointure and acceptsAnyMembers = true
    jointureDimensionCondition = new(LibCube:JointureDimensionCondition);
    jointureDimensionCondition.dimension = dimension;
    jointureDimensionCondition.acceptsAnyMembers = true;
    jointureDimensionCondition.generateQueryFragment();

    comparatorText = concat("[",dimension.mdxName,  "]", ".members");
    
    assert(jointureDimensionCondition.queryFragment.mdxString == comparatorText);

    //CASE 2 Jointure with members and acceptsAnyMembers = FALSE
    jointureDimensionCondition = new(LibCube:JointureDimensionCondition);
    jointureDimensionCondition.dimension = dimension;
    jointureDimensionCondition.members.add(time2k18);
    jointureDimensionCondition.acceptsAnyMembers = false;
    jointureDimensionCondition.generateQueryFragment();

    comparatorText = concat("[",dimension.mdxName, ".",hierarchy.mdxName,  "]", ".",time2k18.mdxName);
    
    assert(jointureDimensionCondition.queryFragment.mdxString == comparatorText);

    //CASE 3 Jointure with members and acceptsAnyMembers = TRUE
    jointureDimensionCondition = new(LibCube:JointureDimensionCondition);
    jointureDimensionCondition.dimension = dimension;
    jointureDimensionCondition.members.add(time2k18);
    jointureDimensionCondition.acceptsAnyMembers = true;
    jointureDimensionCondition.generateQueryFragment();

    comparatorText = concat("[",dimension.mdxName, ".",hierarchy.mdxName,  "]", ".",time2k18.mdxName);

    assert(jointureDimensionCondition.queryFragment.mdxString == comparatorText);

    //CASE 4 Jointure with no members and acceptsAnyMembers = FALSE
    jointureDimensionCondition = new(LibCube:JointureDimensionCondition);
    jointureDimensionCondition.dimension = dimension;
    jointureDimensionCondition.acceptsAnyMembers = false;
    jointureDimensionCondition.generateQueryFragment();
    
    assert(jointureDimensionCondition.queryFragment.mdxString == null);

    logInfo("LibCube:Test:jointureDimensionConditionTest() passed");
}
;

function LibCube:Test:jointureFactsSelectionTest()
--> local LibCube:JointureFactsSelection jointureFactsSelection,
          LibCube:Jointure jointure,
          LibCube:JointureDimensionCondition jointureDimensionCondition,
          List dimensionConditions,

          LibCube:Dimension dimension, 
          LibCube:TimeMember time2k18,
          LibCube:Hierarchy hierarchy,
          
          Text cubeMdxName,
          Text comparatorText,
          Text comparatorRowsFilter,
          Text comparatorColsFilter
--> action {
    
    logInfo("Testing jointureFactsSelectionTest");

    //fact value and label to give them shape-----------------------------
    time2k18 = new(LibCube:TimeMember);
    //time2k18.dimension = DIMENSION_TIME;
    time2k18.label = "2018";
    time2k18.mdxName = "TimeMember2018MDX";
    time2k18.date = Date..stringToDate("2018-01-01");

    hierarchy = new(LibCube:Hierarchy);
    hierarchy.mdxName = "hierarchyMDX";

    dimension = new(LibCube:Dimension);
    dimension.members.add(time2k18);
    dimension.mdxName = "dimensionMDX";
    time2k18.dimension = dimension;
    dimension.hierarchies.add(hierarchy);
    
    jointureDimensionCondition = new(LibCube:JointureDimensionCondition);
    jointureDimensionCondition.dimension = dimension;
    jointureDimensionCondition.acceptsAnyMembers = true;

    dimensionConditions  = new(List);
    dimensionConditions.add(jointureDimensionCondition);
    jointure = new(LibCube:Jointure);
    jointure.dimensionConditions = dimensionConditions;

    jointureFactsSelection = new(LibCube:JointureFactsSelection);
    jointureFactsSelection.jointure = jointure;
    
    cubeMdxName = "cubeMdxGenericName";
    comparatorRowsFilter = concat("{[",dimension.mdxName,"].members} ON ROWS");
    comparatorColsFilter = "{[Measures].[SALE_VALUE],[Measures].[SOLD_UNITS]} ON COLUMNS";
    comparatorText = concat("SELECT ", comparatorColsFilter , " , " , comparatorRowsFilter ," FROM [",cubeMdxName,"]");

    jointureFactsSelection.generateQuery(cubeMdxName);

    assert(jointureFactsSelection.mdxQuery==comparatorText);
    logInfo("LibCube:Test:jointureFactsSelectionTest() passed");
}
;

function LibCube:Test:jointureLevelDimensionConditionTest()
--> local LibCube:JointureLevelDimensionCondition jointureLevelDimensionCondition,
          LibCube:Dimension dimension, 
          LibCube:TimeMember time2k18,
          LibCube:Hierarchy hierarchy,
          Text comparatorText
--> action {

    logInfo("Testing jointureLevelDimensionConditionTest");

    //fact value and label to give them shape-----------------------------
    time2k18 = new(LibCube:TimeMember);
    //time2k18.dimension = DIMENSION_TIME;
    time2k18.label = "2018";
    time2k18.mdxName = "TimeMember2018MDX";
    time2k18.date = Date..stringToDate("2018-01-01");

    hierarchy = new(LibCube:Hierarchy);
    hierarchy.mdxName = "hierarchyMDX";

    dimension = new(LibCube:Dimension);
    dimension.members.add(time2k18);
    dimension.mdxName = "dimensionMDX";
    time2k18.dimension = dimension;
    dimension.hierarchies.add(hierarchy);
    
    //CASE 1 No level , originMember != null
    jointureLevelDimensionCondition = new(LibCube:JointureLevelDimensionCondition);
    jointureLevelDimensionCondition.dimension = dimension;
    jointureLevelDimensionCondition.originMember = time2k18;
    jointureLevelDimensionCondition.acceptsAnyMembers = true;
    jointureLevelDimensionCondition.generateQueryFragment();

    comparatorText = concat("Descendants([", dimension.mdxName ,"." ,hierarchy.mdxName, "]." , time2k18.mdxName ,", )");
    assert(jointureLevelDimensionCondition.queryFragment.mdxString == comparatorText );
    
    //CASE 2 No level , originMember == null
    jointureLevelDimensionCondition = new(LibCube:JointureLevelDimensionCondition);
    jointureLevelDimensionCondition.dimension = dimension;
    jointureLevelDimensionCondition.acceptsAnyMembers = true;
    jointureLevelDimensionCondition.generateQueryFragment();

    comparatorText = concat("[", dimension.mdxName ,"." ,hierarchy.mdxName, "].Levels().Members");
    assert(jointureLevelDimensionCondition.queryFragment.mdxString == comparatorText );
    
    //CASE 3 No level , theHierarchy == null
    jointureLevelDimensionCondition = new(LibCube:JointureLevelDimensionCondition);
    dimension.hierarchies = null;
    jointureLevelDimensionCondition.dimension = dimension;
    jointureLevelDimensionCondition.acceptsAnyMembers = true;
    jointureLevelDimensionCondition.generateQueryFragment();

    comparatorText = concat("[", dimension.mdxName ,"].Levels().Members");
    assert(jointureLevelDimensionCondition.queryFragment.mdxString == comparatorText );

    //CASE 4 No level , areLeaves == true
    jointureLevelDimensionCondition = new(LibCube:JointureLevelDimensionCondition);
    jointureLevelDimensionCondition.areLeaves = true;
    jointureLevelDimensionCondition.dimension = dimension;
    jointureLevelDimensionCondition.acceptsAnyMembers = true;
    jointureLevelDimensionCondition.generateQueryFragment();

    comparatorText = concat("Descendants([", dimension.mdxName ,"].DefaultMember, -1, LEAVES)");
    assert(jointureLevelDimensionCondition.queryFragment.mdxString == comparatorText );

    //CASE 5 No level , includeOriginMember == true
    jointureLevelDimensionCondition = new(LibCube:JointureLevelDimensionCondition);
    jointureLevelDimensionCondition.includeOriginMember = true;
    jointureLevelDimensionCondition.dimension = dimension;
    jointureLevelDimensionCondition.acceptsAnyMembers = true;
    jointureLevelDimensionCondition.generateQueryFragment();

    comparatorText = concat("Union([", dimension.mdxName ,"].DefaultMember,[", dimension.mdxName ,"].Levels().Members)");
    assert(jointureLevelDimensionCondition.queryFragment.mdxString == comparatorText );
    logInfo("ask pedro what happen if the object JointureLevelDimensionCondition does not come with variable level");

    logInfo("LibCube:Test:jointureLevelDimensionConditionTest() passed");
}
;

function LibCube:Test:main()
--> action {
    //LibKPI:Test:ranges();
    logInfo("Running LibCube unit tests");
    
    LibCube:Test:factsSorter();//issue4
    
    LibCube:Test:factsDimensionSorterCaseTimeDimension();//issue15
    LibCube:Test:factsDimensionSorterCaseAnyDimension();//issue15
    LibCube:Test:factsDimensionSorterHelper();//issue15
    
    LibCube:Test:timeMember();//issue1
    
    LibCube:Test:twoMeasuresOneFactComparison();//issue3
    LibCube:Test:twoFactsOneMesureComparison();//issue3
    LibCube:Test:getMeasuresComparison();//issue3
    LibCube:Test:getFactsComparison();//issue3
    
    LibCube:Test:getMeasureValue();//issue21
    
    LibCube:Test:getMember();//issue20

    LibCube:Test:groupedFactsSelection();

    LibCube:Test:jointureDimensionConditionTest();

    LibCube:Test:jointureFactsSelectionTest();
    
    LibCube:Test:jointureLevelDimensionConditionTest();
}
;

