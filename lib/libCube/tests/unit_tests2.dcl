function LibCube:Test:dimensionTest()
--> local 
          LibCube:Cube cube,
          LibCube:TimeMember memberYear,
          LibCube:TimeMember memberMonthJan,
          LibCube:TimeMember memberMonthFeb,
          LibCube:TimeMember memberWeek3,
          LibCube:TimeMember memberWeek2,
          LibCube:TimeMember memberWeek1,
          LibCube:TimeMember memberDay1,

          LibCube:Dimension _dimension,
          LibCube:Hierarchy dimensionHierarchies,
          
          LibCube:Hierarchy yearHierarchy,
          LibCube:Hierarchy monthJanHierarchy,
          LibCube:Hierarchy monthFebHierarchy,
          LibCube:Hierarchy week3Hierarchy,
          LibCube:Hierarchy week2Hierarchy,
          LibCube:Hierarchy week1Hierarchy,
          LibCube:Hierarchy day1Hierarchy,

          LibCube:HierarchyMembersAccesor theAccessor,

          LibCube:Member resMember,

          String getElemFullMdxNameResult,
          String fullMdxNameComparator
--> action {
    logInfo("Testing dimensionTest");
    //dimensions members---------------------------------
    memberYear = new(LibCube:TimeMember);
    memberYear.label = "2018";
    memberYear.mdxName = "mdxMem2018";
    memberYear.date = Date..stringToDate("2018-01-01");
    
    memberMonthJan = new(LibCube:TimeMember);
    memberMonthJan.label = "January";
    memberMonthJan.mdxName = "mdxMemJanuary";
    memberMonthJan.date = Date..stringToDate("2018-01-01");

    memberMonthFeb = new(LibCube:TimeMember);
    memberMonthFeb.label = "February";
    memberMonthFeb.mdxName = "mdxMemFebruary";
    memberMonthFeb.date = Date..stringToDate("2018-02-01");

    memberWeek3 = new(LibCube:TimeMember);
    memberWeek3.label = "Third Week";
    memberWeek3.mdxName = "mdxMemThirdWeek";
    memberWeek3.date = Date..stringToDate("2018-02-10");

    memberWeek2 = new(LibCube:TimeMember);
    memberWeek2.label = "Second Week";
    memberWeek2.mdxName = "mdxMemSecondWeek";
    memberWeek2.date = Date..stringToDate("2018-01-08");

    memberWeek1 = new(LibCube:TimeMember);
    memberWeek1.label = "First Week";
    memberWeek1.mdxName = "mdxMemFirstWeek";
    memberWeek1.date = Date..stringToDate("2018-01-05");

    memberDay1 = new(LibCube:TimeMember);
    memberDay1.label = "01";
    memberDay1.mdxName = "mdxMem01";
    memberDay1.date = Date..stringToDate("2018-01-01");
    
    //hierarchies -----------------------------------------
    day1Hierarchy = new(LibCube:Hierarchy);
    day1Hierarchy.label = "01";
    day1Hierarchy.value = memberDay1;
    day1Hierarchy.mdxName = "mdxNameday1Hierarchy";

    week3Hierarchy = new(LibCube:Hierarchy);
    week3Hierarchy.label = "Third week";
    week3Hierarchy.value = memberWeek3;
    week3Hierarchy.mdxName = "mdxNameweek3Hierarchy";
    week3Hierarchy.addChild(day1Hierarchy);

    week2Hierarchy = new(LibCube:Hierarchy);
    week2Hierarchy.label = "Second week";
    week2Hierarchy.value = memberWeek2;
    week2Hierarchy.mdxName = "mdxNameweek2Hierarchy";

    week1Hierarchy = new(LibCube:Hierarchy);
    week1Hierarchy.label = "First Week";
    week1Hierarchy.value = memberWeek1;
    week1Hierarchy.mdxName = "mdxNameweek1Hierarchy";

    monthJanHierarchy = new(LibCube:Hierarchy);
    monthJanHierarchy.label = "January";
    monthJanHierarchy.value = memberMonthJan;
    monthJanHierarchy.mdxName = "mdxNameMonthJanHierarchy";
    monthJanHierarchy.addChild(week2Hierarchy);
    monthJanHierarchy.addChild(week1Hierarchy);
    
    monthFebHierarchy = new(LibCube:Hierarchy);
    monthFebHierarchy.label = "February";
    monthFebHierarchy.value = memberMonthFeb;
    monthFebHierarchy.mdxName = "mdxNameFebHierarchy";
    monthFebHierarchy.addChild(week3Hierarchy);

    yearHierarchy = new(LibCube:Hierarchy);
    yearHierarchy.label = "2018"; 
    yearHierarchy.value = memberYear;
    yearHierarchy.mdxName = "mdxName2018Hierarchy";
    yearHierarchy.addChild(monthJanHierarchy);
    yearHierarchy.addChild(monthFebHierarchy);
    //---------------------------------------------------

    //dimension setting
    _dimension = new(LibCube:Dimension);
    _dimension.mdxName ="mdxNameYearHierarchy";
    _dimension.hierarchies.add(yearHierarchy);
    
    //---------------------------------------------------

    //---------------------------------------------------
    
    _dimension.processDimension();
    
    foreach(_member,_dimension>>members){
                
            if(_member.label == "01"){
                fullMdxNameComparator = concat("[", _dimension.mdxName, ".", day1Hierarchy.mdxName, "].", "[",memberYear.mdxName,"]" , "." , "[",memberMonthFeb.mdxName,"]" , "." , "[",memberWeek3.mdxName,"]", "." ,"[",_member.mdxName,"]");
                getElemFullMdxNameResult = _dimension.getElemFullMdxName(LibCube:HierarchyElement(_member),day1Hierarchy);
                assert(getElemFullMdxNameResult == fullMdxNameComparator);
            }
            if(_member.label == "January" || _member.label == "February"){
                if(_member.label == "January"){
                    fullMdxNameComparator = concat("[", _dimension.mdxName, ".", monthJanHierarchy.mdxName, "].", "[",memberYear.mdxName,"]" , "." ,"[",_member.mdxName,"]");
                    getElemFullMdxNameResult = _dimension.getElemFullMdxName(LibCube:HierarchyElement(_member),monthJanHierarchy);
                    assert(getElemFullMdxNameResult == fullMdxNameComparator);
                }
                if(_member.label == "February"){
                    fullMdxNameComparator = concat("[", _dimension.mdxName, ".", monthFebHierarchy.mdxName, "].", "[",memberYear.mdxName,"]" , "." ,"[",_member.mdxName,"]");
                    getElemFullMdxNameResult = _dimension.getElemFullMdxName(LibCube:HierarchyElement(_member),monthFebHierarchy);
                    assert(getElemFullMdxNameResult == fullMdxNameComparator);
                }
            }
            if(_member.label == "2018"){
                fullMdxNameComparator = concat("[", _dimension.mdxName, ".", yearHierarchy.mdxName, "].", "[",_member.mdxName,"]");
                getElemFullMdxNameResult = _dimension.getElemFullMdxName(LibCube:HierarchyElement(_member),yearHierarchy);
                assert(getElemFullMdxNameResult == fullMdxNameComparator);
            }
            if(_member.label == "First Week"){
                fullMdxNameComparator = concat("[", _dimension.mdxName, ".", week1Hierarchy.mdxName, "].", "[",memberYear.mdxName,"]" , "." , "[",memberMonthJan.mdxName,"]" , "." ,"[",_member.mdxName,"]");
                getElemFullMdxNameResult = _dimension.getElemFullMdxName(LibCube:HierarchyElement(_member),week1Hierarchy);
                assert(getElemFullMdxNameResult == fullMdxNameComparator);
            }
    }


    assert(_dimension.getHierarchyAccessor(yearHierarchy).maxHierarchyLevel == 4);
    
    assert(_dimension.getHierarchyAccessor(yearHierarchy).getMembersByLevel(3).toList().get(3) == memberWeek3);
    assert(_dimension.getHierarchyAccessor(yearHierarchy).getMembersByLevel(2).toList().get(1) == memberMonthJan);//month
    assert(_dimension.getHierarchyAccessor(yearHierarchy).getMembersByLevel(2).toList().get(2) == memberMonthFeb);//month
    assert(_dimension.getHierarchyAccessor(yearHierarchy).getMembersByLevel(1).toList().get(1) == memberYear);

    logInfo("LibCube:Test:dimensionTest() passed");
    
}
;

function LibCube:Test:getDimensionNameFromMdxNameTest()
--> local LibCube:Fact fact,
          Text dimensionName
--> action {

    logInfo("Testing getDimensionNameFromMdxNameTest");

    fact = new(LibCube:Fact);
    dimensionName = fact.getDimensionNameFromMdxName("[mdxName].dimensionMdxName");
    assert(dimensionName == "dimensionMdxName");

    logInfo("LibCube:Test:dimensionTest() passed");
}
;

function LibCube:Test:getDateTest()
--> local LibCube:Fact fact,
          LibCube:TimeMember member
--> action{
    logInfo("Testing getDateTest");

    member = new(LibCube:TimeMember);
    member.dimension = DIMENSION_TIME;
    member.date = Date..stringToDate("2019-01-14");
    
    fact = new(LibCube:Fact);
    fact.members.add(member);

    assert(fact.getDate() == member.date);

    logInfo("LibCube:Test:getDateTest() passed");
}
;

function LibCube:Test:checkDimensionsTest()
--> local LibCube:Fact fact,
          LibCube:TimeMember member,
          LibCube:Member defaultMember,
          LibCube:Member anotherMember,
          LibCube:Member memberCity,
          LibCube:Member memberProduct,
          LibCube:Member memberStore,
          LibCube:Member memberTime,
          LibCube:Dimension dimension,
          LibCube:Dimension anotherDimension
--> action{
    logInfo("Testing checkDimensionsTest");

    dimension = new(LibCube:Dimension);
    dimension.defaultMember = defaultMember;
    
    anotherDimension = new(LibCube:Dimension);
    anotherDimension.defaultMember = new(LibCube:Member);
    anotherDimension.defaultMember.label = "MemberOut of the Fact";
    anotherDimension.defaultMember.dimension = anotherDimension;
    anotherDimension.isOptional = false;
    
    anotherMember = new(LibCube:Member);
    anotherMember.dimension = anotherDimension;

    member = new(LibCube:TimeMember);
    member.dimension = dimension;
    member.date = Date..stringToDate("2019-01-14");

    memberCity = new(LibCube:TimeMember);
    memberCity.dimension = DIMENSION_CITY;

    memberProduct = new(LibCube:TimeMember);
    memberProduct.dimension = DIMENSION_PRODUCT;

    memberStore = new(LibCube:TimeMember);
    memberStore.dimension = DIMENSION_STORE;
    memberStore.dimension.isOptional = false;

    memberTime = new(LibCube:TimeMember);
    memberTime.dimension = DIMENSION_TIME;

    fact = new(LibCube:Fact);
    fact.members.add(member);
    fact.members.add(memberTime);
    fact.members.add(memberStore);
    fact.members.add(memberProduct);
    fact.members.add(memberCity);

    fact.checkDimensions();
    
    assert( anotherDimension.defaultMember == fact.getMember(anotherDimension.defaultMember.dimension) );

    logInfo("LibCube:Test:checkDimensionsTest() passed");
}
;

function LibCube:Test:getRemovePendingFactSelectionTest()
--> local LibCube:FactsRequestsManager factsRequestsManager,
          OrderedSet requestingFactsSelections,
          LibCube:JointureFactsSelection requestingFactsSelection1,
          LibCube:JointureFactsSelection requestingFactsSelection2,
          LibCube:JointureFactsSelection requestingFactsSelection3
--> action {
    logInfo("Testing getPendingFactSelectionTest");
    //
    requestingFactsSelection1 = new(LibCube:JointureFactsSelection);
    requestingFactsSelection1.mdxQuery = "requestingFactsSelection1.mdxQuery";
    requestingFactsSelection2 = new(LibCube:JointureFactsSelection);
    requestingFactsSelection2.mdxQuery = "requestingFactsSelection2.mdxQuery";
    requestingFactsSelection3 = new(LibCube:JointureFactsSelection);
    requestingFactsSelection3.mdxQuery = "requestingFactsSelection3.mdxQuery";

    requestingFactsSelections = new(OrderedSet);
    requestingFactsSelections.add(requestingFactsSelection1);
    requestingFactsSelections.add(requestingFactsSelection2);
    requestingFactsSelections.add(requestingFactsSelection3);

    //
    factsRequestsManager = new(LibCube:FactsRequestsManager);
    factsRequestsManager.requestingFactsSelections = requestingFactsSelections;

    assert(factsRequestsManager.getPendingFactSelection() == requestingFactsSelection1);

    factsRequestsManager.removePendingFactSelection();
    assert(factsRequestsManager.getPendingFactSelection() == requestingFactsSelection2);

    logInfo("LibCube:Test:getPendingFactSelectionTest() passed");
}
;

function LibCube:Test:factsSorterTest()
--> local LibCube:Fact fact1,
          LibCube:Fact fact2,
          LibCube:Fact fact3,
          LibCube:SortingOptions sortingOptions,
          LibCube:FactMeasure factMeasure1,
          LibCube:FactMeasure factMeasure2,
          LibCube:FactMeasure factMeasure3,
          LibCube:Measure valueMeasure,
          LibCube:FactsSorter factsSorter,
          Number multipleMeasuresComparatorFuncResult,
          Number oneMeasureComparatorFuncResult,
          List facts
--> action {

    logInfo("Testing factsSorterTest");

    //label for the measure for any fact
    valueMeasure = new(LibCube:Measure);
    valueMeasure.label = "value";
    //-----------------------------------------------------------------------------------

    //setting fact measure values
    factMeasure1 = new(LibCube:FactMeasure);
    factMeasure1.measure = valueMeasure;
    factMeasure1.value = 5;

    factMeasure2 = new(LibCube:FactMeasure);
    factMeasure2.measure = valueMeasure;
    factMeasure2.value = -8;

    factMeasure3 = new(LibCube:FactMeasure);
    factMeasure3.measure = valueMeasure;
    factMeasure3.value = 10;
    //------------------------
    fact1 = new(LibCube:Fact);
    fact1.factMeasures.add(factMeasure1);
    fact2 = new(LibCube:Fact);
    fact2.factMeasures.add(factMeasure2);
    fact3 = new(LibCube:Fact);
    fact3.factMeasures.add(factMeasure3);

    sortingOptions = new(LibCube:SortingOptions);
    sortingOptions.measures.add(valueMeasure);
    sortingOptions.measure = valueMeasure;
    sortingOptions.useAbsoluteValue = true;

    factsSorter = new(LibCube:FactsSorter);
    //---------------------multipleMeasuresComparatorFunc-------------------------------------------------------
    //CASE 1
    sortingOptions.useAbsoluteValue = true;
    multipleMeasuresComparatorFuncResult = factsSorter.multipleMeasuresComparatorFunc(fact1,fact2,sortingOptions);
    assert(multipleMeasuresComparatorFuncResult == -1);
    
    //CASE 2
    factMeasure2.value = 8;
    fact2 = new(LibCube:Fact);
    fact2.factMeasures.add(factMeasure2);
    multipleMeasuresComparatorFuncResult = factsSorter.multipleMeasuresComparatorFunc(fact1,fact2,sortingOptions);
    assert(multipleMeasuresComparatorFuncResult == -1);
    
    //CASE 3
    sortingOptions.useAbsoluteValue = true;
    multipleMeasuresComparatorFuncResult = factsSorter.multipleMeasuresComparatorFunc(fact2,fact1,sortingOptions);
    assert(multipleMeasuresComparatorFuncResult == 1);

    //CASE 4
    sortingOptions.useAbsoluteValue = false;
    multipleMeasuresComparatorFuncResult = factsSorter.multipleMeasuresComparatorFunc(fact1,fact2,sortingOptions);
    assert(multipleMeasuresComparatorFuncResult == -1);

    //CASE 5
    factMeasure2.value = -8;
    fact2 = new(LibCube:Fact);
    fact2.factMeasures.add(factMeasure2);
    sortingOptions.useAbsoluteValue = false;
    multipleMeasuresComparatorFuncResult = factsSorter.multipleMeasuresComparatorFunc(fact1,fact2,sortingOptions);
    assert(multipleMeasuresComparatorFuncResult == 1);
    //-------------------------------------------------------------------------------------------------------------
    //---------------------oneMeasureComparatorFunc-------------------------------------------------------
    //CASE 1
    sortingOptions.useAbsoluteValue = true;
    oneMeasureComparatorFuncResult = factsSorter.oneMeasureComparatorFunc(fact1,fact2,sortingOptions);
    assert(oneMeasureComparatorFuncResult == -3);
    //CASE 2
    sortingOptions.useAbsoluteValue = false;
    oneMeasureComparatorFuncResult = factsSorter.oneMeasureComparatorFunc(fact1,fact2,sortingOptions);
    assert(oneMeasureComparatorFuncResult == 13);
    //CASE 3
    sortingOptions.useAbsoluteValue = false;
    oneMeasureComparatorFuncResult = factsSorter.oneMeasureComparatorFunc(fact2,fact1,sortingOptions);
    assert(oneMeasureComparatorFuncResult == -13);
    //-------------------------------------------------------------------------------------------------------------

    /*test = new(LibCube:Fact);
    testAttribute = LibCube:Fact.newAttribute();
    test.newOAVTriplet(testAttribute, sortingOptions);
    logInfo(sortingOptions);
    logInfo(test.getAttributeValue(testAttribute));
    sortingOptions.comparisonAttribute = LibCube:Fact.newAttribute();
    sortingOptions.comparisonAttribute.defaultValue = fact2;
    sortingOptions.differenceAttribute = LibCube:Fact.newAttribute();
    sortingOptions.differenceAttribute.defaultValue = fact1;
    factsSorter.comparisonAttributeComparatorFunc(fact1,fact2,sortingOptions);*/

    //---------------------addMeasure-----------------------------------------------------------------------------
    factsSorter.addMeasure(valueMeasure);
    assert(factsSorter.measures.get(_FIRST) == valueMeasure);

    //-------------------------------------------------------------------------------------------------------------
    //---------------------getTopNFacts----------------------------------------------------------------------------
    factsSorter.measure = valueMeasure;
    factsSorter.sortType = SORT_TYPE_ONE_MEASURE;
    facts = new(List);
    facts.add(fact1);
    facts.add(fact3);
    factsSorter.facts = facts;
    factsSorter.sortFacts();
    assert(factsSorter.getTopNFacts(1).get(_FIRST) == fact3);
    //-------------------------------------------------------------------------------------------------------------
    //---------------------getFact---------------------------------------------------------------------------------
    assert(factsSorter.getFact(2) == fact1);
    //-------------------------------------------------------------------------------------------------------------
    //---------------------getFactsGreaterThan---------------------------------------------------------------------
    facts.add(fact2);
    factsSorter.facts = facts;
    factsSorter.sortFacts();
    
    assert(factsSorter.getFactsGreaterThan(11).size() == 0);
    //-------------------------------------------------------------------------------------------------------------
    factsSorter.sortType = SORT_TYPE_ONE_MEASURE;
    logInfo("LibCube:Test:factsSorterTest() passed");
}
;

function LibCube:Test:main2()
--> action {
    logInfo("Running LibCube unit tests");
    
    LibCube:Test:dimensionTest();
    LibCube:Test:getDimensionNameFromMdxNameTest();
    LibCube:Test:getDateTest();
    LibCube:Test:checkDimensionsTest();
    LibCube:Test:getRemovePendingFactSelectionTest();
    
    LibCube:Test:factsSorterTest();
}
;
