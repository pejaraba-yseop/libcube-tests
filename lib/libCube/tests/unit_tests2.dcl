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

          //LibCube:HierarchyMembersAccesor theAccessor,

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
    //--------------------------------------getMembersByLevel----------------------------------------------------------------
    assert(_dimension.getHierarchyAccessor(yearHierarchy).getMembersByLevel(3).toList().get(3) == memberWeek3);
    assert(_dimension.getHierarchyAccessor(yearHierarchy).getMembersByLevel(2).toList().get(1) == memberMonthJan);//month
    assert(_dimension.getHierarchyAccessor(yearHierarchy).getMembersByLevel(2).toList().get(2) == memberMonthFeb);//month
    assert(_dimension.getHierarchyAccessor(yearHierarchy).getMembersByLevel(1).toList().get(1) == memberYear);
    //------------------------------------------------------------------------------------------------------------------------
    //--------------------------------------getChildren-----------------------------------------------------------------------
    assert(_dimension.getHierarchyAccessor(yearHierarchy).getChildren(memberYear).contains(memberMonthJan) == true);
    assert(_dimension.getHierarchyAccessor(yearHierarchy).getChildren(memberYear).contains(memberMonthFeb) == true);
    
    //------------------------------------------------------------------------------------------------------------------------

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

    logInfo("LibCube:Test:getDimensionNameFromMdxNameTest() passed");
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
          LibCube:Measure anotherValueMeasure,
          LibCube:FactsSorter factsSorter,
          Number multipleMeasuresComparatorFuncResult,
          Number oneMeasureComparatorFuncResult,
          List facts,
          LibCube:Member storeMember,
          LibCube:Member cityMember,
          LibCube:Member productMember

--> action {

    logInfo("Testing factsSorterTest");

    //label for the measure for any fact
    valueMeasure = new(LibCube:Measure);
    valueMeasure.label = "value";
    //-----------------------------------------------------------------------------------
    storeMember = new(LibCube:Member);
    storeMember.dimension = DIMENSION_STORE;
    storeMember.label = "SuperStic Store";
    
    cityMember = new(LibCube:Member);
    cityMember.dimension = DIMENSION_CITY;
    cityMember.label = "Bogota";

    productMember = new(LibCube:Member);
    productMember.dimension = DIMENSION_PRODUCT;
    productMember.label = "Product American";

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
    fact1.members.add(storeMember);
    fact2 = new(LibCube:Fact);
    fact2.factMeasures.add(factMeasure2);
    fact2.members.add(cityMember);
    fact3 = new(LibCube:Fact);
    fact3.factMeasures.add(factMeasure3);
    fact3.members.add(productMember);

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
        //CASE 1
    facts.add(fact2);
    factsSorter.facts = facts;
    factsSorter.sortFacts();
    
    assert(factsSorter.getFactsGreaterThan(11).size() == 0);
    assert(factsSorter.getFactsGreaterThan(-9).size() == 3);
        //CASE 2
    factsSorter.sortType = SORT_TYPE_MULTIPLE_MEASURES;
    assert(factsSorter.getFactsGreaterThan(0).size() == 2);
    assert(factsSorter.getFactsGreaterThan(-11).size() == 3);

    //-------------------------------------------------------------------------------------------------------------
    //---------------------getFactsLowerThan-----------------------------------------------------------------------
    assert(factsSorter.getFactsLowerThan(11).size() == 3);
    assert(factsSorter.getFactsLowerThan(-9).size() == 0);
        //CASE 2
    factsSorter.sortType = SORT_TYPE_MULTIPLE_MEASURES;
    assert(factsSorter.getFactsLowerThan(0).size() == 1);
    assert(factsSorter.getFactsLowerThan(-11).size() == 0);
    //-------------------------------------------------------------------------------------------------------------
    //---------------------getFactsSumUnderTotalPercentage---------------------------------------------------------
        //CASE 1
    factsSorter.measure = valueMeasure;
    assert(factsSorter.getFactsSumUnderTotalPercentage(150,11).size() == 2);
    assert(factsSorter.getFactsSumUnderTotalPercentage(150,11).get(_FIRST) == fact3);
    assert(factsSorter.getFactsSumUnderTotalPercentage(10,11).size() == 0);
        //CASE 2
    assert(factsSorter.getFactsSumUnderTotalPercentage(150).size() == 1);
    assert(factsSorter.getFactsSumUnderTotalPercentage(150).get(_FIRST) == fact3);
    assert(factsSorter.getFactsSumUnderTotalPercentage(10).size() == 0);
    //-------------------------------------------------------------------------------------------------------------
    //---------------------getRank---------------------------------------------------------------------------------
    assert(factsSorter.getRank(storeMember) == 2);
    assert(factsSorter.getRank(productMember) == 1);
    //-------------------------------------------------------------------------------------------------------------
    logInfo("LibCube:Test:factsSorterTest() passed");
}
;

function LibCube:Test:jointureChildParentDimensionCondition()
--> local LibCube:JointureChildParentDimensionCondition jointureChildParentDimensionCondition,
          LibCube:TimeMember time2k18,
          LibCube:Hierarchy hierarchy,
          LibCube:Dimension dimension,
          LibCube:HierarchyElement parentElem,
          String mdxStringComparator
--> action {
    logInfo("Testing jointureChildParentDimensionCondition");
    
    //------------------------------------------
    time2k18 = new(LibCube:TimeMember);
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
    //--------------------------------------------

    parentElem = new(LibCube:HierarchyElement);
    parentElem.mdxName = "parentElem.mdxName";
    parentElem.mdxFullName = "parentElem.mdxFullName";

    jointureChildParentDimensionCondition = new(LibCube:JointureChildParentDimensionCondition);
    jointureChildParentDimensionCondition.dimension = dimension;
    jointureChildParentDimensionCondition.parentElem = parentElem;
    
    //-------CHILDREN_RELATIONSHIP
        //CASE 1.1 includeParent = true
    jointureChildParentDimensionCondition.relationship = CHILDREN_RELATIONSHIP;
    jointureChildParentDimensionCondition.includeParent = true;
    jointureChildParentDimensionCondition.generateQueryFragment();
    mdxStringComparator = concat("Union(", parentElem.getMdxFullName(hierarchy), "," , parentElem.getMdxFullName(hierarchy), ".Children)");
    
    assert( jointureChildParentDimensionCondition.queryFragment.mdxString == mdxStringComparator);
        //CASE 1.2 includeParent = false
    jointureChildParentDimensionCondition.includeParent = false;
    jointureChildParentDimensionCondition.generateQueryFragment();
    mdxStringComparator = concat(parentElem.getMdxFullName(hierarchy), ".Children");
    
    assert( jointureChildParentDimensionCondition.queryFragment.mdxString == mdxStringComparator);
    //-------DESCENDANTS_RELATIONSHIP
        //CASE 2.1 includeParent = true
    jointureChildParentDimensionCondition.relationship = DESCENDANTS_RELATIONSHIP;
    jointureChildParentDimensionCondition.includeParent = true;
    jointureChildParentDimensionCondition.generateQueryFragment();
    mdxStringComparator = concat("Descendants(", parentElem.getMdxFullName(hierarchy), ")");
    
    assert( jointureChildParentDimensionCondition.queryFragment.mdxString == mdxStringComparator);
        //CASE 2.2 includeParent = false
    jointureChildParentDimensionCondition.includeParent = false;
    jointureChildParentDimensionCondition.generateQueryFragment();
    mdxStringComparator = concat("Descendants(", parentElem.getMdxFullName(hierarchy), ", 0.0, AFTER)");
    
    assert( jointureChildParentDimensionCondition.queryFragment.mdxString == mdxStringComparator);
    
    logInfo("LibCube:Test:jointureChildParentDimensionCondition() passed");
}
;

function LibCube:Test:measureGetMdxFullNameTest()
--> local LibCube:Measure measure
--> action {

    logInfo("Testing measureGetMdxFullNameTest");

    measure = new(LibCube:Measure);
    //CASE 1
    assert(measure.getMdxFullName() == null);
    //CASE 2
    measure.mdxFullName = "measure.mdxFullName";
    assert(measure.getMdxFullName() == measure.mdxFullName);
    //CASE 3
    measure.mdxFullName = null;
    measure.mdxName = "measure.mdxName";
    assert(measure.getMdxFullName() == concat("[Measures].[", measure.mdxName, "]"));
    
    logInfo("LibCube:Test:measureGetMdxFullNameTest() passed");
}
;

function LibCube:Test:multidimensionalTotalFactsCreatorTest()
--> local LibCube:MultidimensionalTotalFactsCreator multidimensionalTotalFactsCreator,
          LibCube:Dimension dimensionStore,
          LibCube:Dimension dimensionCity,
          LibCube:Dimension dimensionProduct,
          Collection facts, 
          Collection dimensions,

          LibCube:Fact fact1,
          LibCube:Fact fact2,
          LibCube:Fact fact3,

          LibCube:FactMeasure factMeasure1,
          LibCube:FactMeasure factMeasure2,
          LibCube:FactMeasure factMeasure3,

          LibCube:Measure valueMeasure,
          LibCube:Measure theTotalMeasure,

          LibCube:Member storeMember,
          LibCube:Member cityMember,
          LibCube:Member productMember
--> action {
    logInfo("Testing multidimensionalTotalFactsCreatorTest");

    //label for the measure for any fact
    valueMeasure = new(LibCube:Measure);
    valueMeasure.label = "value";

    theTotalMeasure = new(LibCube:Measure);
    theTotalMeasure.label = "totalvalue";
    //-----------------------------------------------------------------------------------
    storeMember = new(LibCube:Member);
    storeMember.dimension = DIMENSION_STORE;
    storeMember.label = "SuperStic Store";
    
    cityMember = new(LibCube:Member);
    cityMember.dimension = DIMENSION_CITY;
    cityMember.label = "Bogota";

    productMember = new(LibCube:Member);
    productMember.dimension = DIMENSION_PRODUCT;
    productMember.label = "Product American";

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

    //----------
    fact1.members.add(storeMember);
    fact1.members.add(cityMember);
    fact1.members.add(productMember);
    
    fact2.members.add(storeMember);
    fact2.members.add(cityMember);
    fact2.members.add(productMember);

    fact3.members.add(storeMember);
    fact3.members.add(cityMember);
    fact3.members.add(productMember);
    //-------------------------------------------------------------------

    multidimensionalTotalFactsCreator = new(LibCube:MultidimensionalTotalFactsCreator);
    //--------------------addDimension-----------------------------------------------------
        //CASE 1
    assert(multidimensionalTotalFactsCreator.dimensions.size()==0);
        //CASE 2
    dimensionStore = new(LibCube:Dimension);
    dimensionStore.mdxName = "dimension1.mdxName";
    multidimensionalTotalFactsCreator.addDimension(dimensionStore);
    assert(multidimensionalTotalFactsCreator.dimensions.size()==1);
    assert(multidimensionalTotalFactsCreator.dimensions.get(_FIRST)==dimensionStore);
    //--------------------------------------------------------------------------------------
    //--------------------calculateTotals--------------------------------------------------
    dimensions = new(List);
    dimensions.add(DIMENSION_CITY);
    dimensions.add(DIMENSION_STORE);
    dimensions.add(DIMENSION_PRODUCT);

    facts = new(List);
    facts.add(fact1);
    facts.add(fact2);
    facts.add(fact3);

    multidimensionalTotalFactsCreator.facts = facts;
    multidimensionalTotalFactsCreator.dimensions = dimensions;
    multidimensionalTotalFactsCreator.measureForTotal = valueMeasure;
    multidimensionalTotalFactsCreator.totalMeasure = theTotalMeasure;
    multidimensionalTotalFactsCreator.calculateTotals();

    foreach(_factMeasures,multidimensionalTotalFactsCreator.totalFacts.get(1).factMeasures){
        assert(_factMeasures.value == factMeasure1.value + factMeasure2.value + factMeasure3.value );
    }
    //--------------------------------------------------------------------------------------
    logInfo("LibCube:Test:multidimensionalTotalFactsCreatorTest() passed");
}
;

function LibCube:Test:memberGetMdxFullNameTest()
--> local 
          LibCube:Member member,
          LibCube:Dimension dimension,
          LibCube:Hierarchy hierarchy

--> action {

    logInfo("Testing memberGetMdxFullNameTest");

    member = new(LibCube:Member);
    
    //CASE 1
    member.mdxFullName = "member.mdxFullName";
    assert(member.getMdxFullName(null) == member.mdxFullName);
    //CASE 2
    member.mdxFullName = null;
    member.mdxName = null;
    assert(member.getMdxFullName(null) == null);
    //CASE 3
    member.mdxFullName = null;
    member.mdxName = "member.mdxName";
    dimension = new(LibCube:Dimension);
    dimension.mdxName = null;
    member.dimension = dimension;
    assert(member.getMdxFullName(null) == null);
    //CASE 4
    member.mdxFullName = null;
    member.mdxName = "member.mdxName";
    dimension = new(LibCube:Dimension);
    dimension.mdxName = "dimension.mdxName";
    member.dimension = dimension;
    assert(member.getMdxFullName(null) == concat("[", dimension.mdxName, "].", member.mdxName , ""));
    //CASE 5
    member.mdxFullName = null;
    member.mdxName = "member.mdxName";
    dimension = new(LibCube:Dimension);
    dimension.mdxName = "dimension.mdxName";
    member.dimension = dimension;
    hierarchy = new(LibCube:Hierarchy);
    hierarchy.mdxName = null;
    assert(member.getMdxFullName(hierarchy) == null);
    //CASE 6
    member.mdxFullName = null;
    member.mdxName = "member.mdxName";
    dimension = new(LibCube:Dimension);
    dimension.mdxName = "dimension.mdxName";
    member.dimension = dimension;
    hierarchy = new(LibCube:Hierarchy);
    hierarchy.mdxName = "hierarchy.mdxName";
    assert(member.getMdxFullName(hierarchy) == concat("[", dimension.mdxName, ".", hierarchy.mdxName , "].", member.mdxName , "" ));
    
    logInfo("LibCube:Test:memberGetMdxFullNameTest() passed");
}
;

function LibCube:Test:NonIndicatorMembersIdTest()
--> local 
           LibCube:NonIndicatorMembersId nonIndicatorMembersId,
           LibCube:NonIndicatorMembersId nonIndicatorMembersIdComparator,
           HashSet nonIndicatorMembers,
           LibCube:Member member1,
           LibCube:Member member2,
           LibCube:Member member3
--> action {
    logInfo("Running NonIndicatorMembersIdTest tests");
    member1 = new(LibCube:Member);
    member1.label = "member1.label";
    member2 = new(LibCube:Member);
    member2.label = "member2.label";
    member3 = new(LibCube:Member);
    member3.label = "member3.label";
    //---------------isEqualTo,equalMembers--------------------------------------------
    nonIndicatorMembersId = new(LibCube:NonIndicatorMembersId);
    nonIndicatorMembersIdComparator = new(LibCube:NonIndicatorMembersId);
    nonIndicatorMembers = new(HashSet);
    nonIndicatorMembers.add(member1);
    nonIndicatorMembers.add(member2);
    nonIndicatorMembers.add(member3);
    nonIndicatorMembersId.nonIndicatorMembers = nonIndicatorMembers;
    nonIndicatorMembersIdComparator.nonIndicatorMembers = new(HashSet);
    assert( nonIndicatorMembersId.isEqualTo(nonIndicatorMembersIdComparator) == false );
    nonIndicatorMembersIdComparator.nonIndicatorMembers = nonIndicatorMembers;
    assert( nonIndicatorMembersId.isEqualTo(nonIndicatorMembersIdComparator) == true );
    //----------------------------------------------------------------------------------
    assert(nonIndicatorMembersId.getText() == concat(member1.label,member2.label,member3.label));
    logInfo("LibCube:Test:NonIndicatorMembersIdTest() passed");
}
;

function LibCube:Test:positiveNegativeFactsSorterTest()
--> local 
          LibCube:PositiveNegativeFactsSorter positiveNegativeFactsSorter,
          LibCube:Measure valueMeasure,
          LibCube:TimeMember time2k19,
          LibCube:TimeMember time2k18,
          LibCube:TimeMember time2k17,
          LibCube:TimeMember time2k16,
          LibCube:TimeMember time2k15,
          LibCube:FactMeasure factMeasure2k15,
          LibCube:FactMeasure factMeasure2k16,
          LibCube:FactMeasure factMeasure2k17,
          LibCube:FactMeasure factMeasure2k18,
          LibCube:FactMeasure factMeasure2k19,
          LibCube:Fact fact2k15,
          LibCube:Fact fact2k16,
          LibCube:Fact fact2k17,
          LibCube:Fact fact2k18,
          LibCube:Fact fact2k19,
          List facts
--> action{

    logInfo("Running positiveNegativeFactsSorterTest tests");
    //fact value and label to give them shape-------------------------------------------------
    time2k19 = new(LibCube:TimeMember);
    time2k19.dimension = DIMENSION_TIME;
    time2k19.label = "2018";
    time2k19.date = Date..stringToDate("2018-01-01");

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

    //-----------------------------------------------------------------------------------------
    
    //label for the measure for any fact
    valueMeasure = new(LibCube:Measure);
    valueMeasure.label = "value";
    //-----------------------------------------------------------------------------------

    //setting fact measure values
    factMeasure2k15 = new(LibCube:FactMeasure);
    factMeasure2k15.measure = valueMeasure;
    factMeasure2k15.value = -8;

    factMeasure2k16 = new(LibCube:FactMeasure);
    factMeasure2k16.measure = valueMeasure;
    factMeasure2k16.value = 8;

    factMeasure2k17 = new(LibCube:FactMeasure);
    factMeasure2k17.measure = valueMeasure;
    factMeasure2k17.value = 5;

    factMeasure2k18 = new(LibCube:FactMeasure);
    factMeasure2k18.measure = valueMeasure;
    factMeasure2k18.value = 10;

    factMeasure2k19 = new(LibCube:FactMeasure);
    factMeasure2k19.measure = valueMeasure;
    factMeasure2k19.value = -9;

    //-----------------------------------------------------------------------------------

    //init of every fact that will be inside the factSorter class
    fact2k15 = new(LibCube:Fact);
    fact2k15.timeMember = time2k15;//setting the fact shape 
    fact2k15.members.add(time2k15);//setting the fact shape
    fact2k15.factMeasures = factMeasure2k15;

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

    fact2k19 = new(LibCube:Fact);
    fact2k19.timeMember = time2k19;//setting the fact shape 
    fact2k19.members.add(time2k18);//setting the fact shape
    fact2k19.factMeasures = factMeasure2k19;

    //---------------------------------------------------------------------------------------

    //Adding the every fact to facts list
    facts = new(List); 
    facts.add(fact2k16);
    facts.add(fact2k17);
    facts.add(fact2k18);

    positiveNegativeFactsSorter = new(LibCube:PositiveNegativeFactsSorter);
    positiveNegativeFactsSorter.sortType = SORT_TYPE_ONE_MEASURE;
    positiveNegativeFactsSorter.useAbsoluteValue = true;
    positiveNegativeFactsSorter.measure = valueMeasure;
    positiveNegativeFactsSorter.facts = facts;

    //-----------------------sortFacts-----------------------------------------------
    positiveNegativeFactsSorter.sortFacts();
    assert(positiveNegativeFactsSorter.positiveSortedFacts.size() == 3);
    assert(positiveNegativeFactsSorter.negativeSortedFacts.size() == 0);
    assert(positiveNegativeFactsSorter.positiveSortedFacts.get(_FIRST) == fact2k18);
    //CASE 2
    facts.add(fact2k15);
    positiveNegativeFactsSorter.facts = facts;
    positiveNegativeFactsSorter.sortFacts();
    assert(positiveNegativeFactsSorter.positiveSortedFacts.size() == 3);
    assert(positiveNegativeFactsSorter.negativeSortedFacts.size() == 1);
    assert(positiveNegativeFactsSorter.negativeSortedFacts.get(_FIRST) == fact2k15);
    //--------------------------------------------------------------------------------
    //-----------------------getTopNPositiveFacts-------------------------------------
    facts.remove(fact2k17);
    positiveNegativeFactsSorter.facts = facts;
    positiveNegativeFactsSorter.sortFacts();
    assert(positiveNegativeFactsSorter.getTopNPositiveFacts(2).get(2) == fact2k16);
    //--------------------------------------------------------------------------------
    //-----------------------getTopNNegativeFacts-------------------------------------
    assert(positiveNegativeFactsSorter.getTopNNegativeFacts(2).get(_FIRST) == fact2k15);
    //--------------------------------------------------------------------------------
    //-----------------------getTopPositiveFact-------------------------------------
    assert(positiveNegativeFactsSorter.getTopPositiveFact() == fact2k18);
    facts.remove(fact2k18);
    positiveNegativeFactsSorter.facts = facts;
    positiveNegativeFactsSorter.sortFacts();
    assert(positiveNegativeFactsSorter.getTopPositiveFact() == fact2k16);
    //---------------------------------------------------------------------------------
    //-----------------------getTopNegativeFact----------------------------------------
    facts = new(List); 
    facts.add(fact2k15);
    facts.add(fact2k16);
    facts.add(fact2k17);
    facts.add(fact2k19);
    facts.add(fact2k18);
    positiveNegativeFactsSorter.facts = facts;
    positiveNegativeFactsSorter.sortFacts();
    assert(positiveNegativeFactsSorter.getTopNegativeFact() == fact2k19);
    //---------------------------------------------------------------------------------
    //-----------------------getPositiveFact-------------------------------------------
    assert(positiveNegativeFactsSorter.getPositiveFact(1) == fact2k18);
    assert(positiveNegativeFactsSorter.getPositiveFact(2) == fact2k16);
    //---------------------------------------------------------------------------------
    //-----------------------getNegativeFact-------------------------------------------
    assert(positiveNegativeFactsSorter.getNegativeFact(1) == fact2k19);
    assert(positiveNegativeFactsSorter.getNegativeFact(2) == fact2k15);
    //---------------------------------------------------------------------------------
    //-----------------------getPositiveFactsGreaterThan-------------------------------
    assert(positiveNegativeFactsSorter.getPositiveFactsGreaterThan(10).size() == 0);
    assert(positiveNegativeFactsSorter.getPositiveFactsGreaterThan(5).size() == 2);
    assert(positiveNegativeFactsSorter.getPositiveFactsGreaterThan(0).size() == 3);
    //---------------------------------------------------------------------------------
    //-----------------------getNegativeFactsGreaterThan-------------------------------
    assert(positiveNegativeFactsSorter.getNegativeFactsGreaterThan(10).size() == 0);
    assert(positiveNegativeFactsSorter.getNegativeFactsGreaterThan(-5).size() == 0);
    assert(positiveNegativeFactsSorter.getNegativeFactsGreaterThan(-10).size() == 2);
    assert(positiveNegativeFactsSorter.getNegativeFactsGreaterThan(-9).size() == 1);
    //---------------------------------------------------------------------------------
    logInfo("LibCube:Test:positiveNegativeFactsSorterTest() passed");

}
;

function LibCube:Test:requestContextTest()
--> local 
            LibCube:RequestContext requestContext,
            LibCube:DimensionRequestContext dimContext,
            LibCube:MeasureRequestContext mesContext
--> action{
    logInfo("Running requestContextTest tests");
    requestContext = new(LibCube:RequestContext);
    //-----------------------addDimensionContext-------------------------------
    requestContext.addDimensionContext("dimensionContextMdxName", "dimensionContextYseopId", "dimensionContextYseopMembersClass");
    dimContext = requestContext.dimensionContexts.get(_FIRST);
    assert(dimContext.mdxName == "dimensionContextMdxName");
    assert(dimContext.yseopId == "dimensionContextYseopId");
    assert(dimContext.yseopMembersClass == "dimensionContextYseopMembersClass");
    //---------------------------------------------------------------------------------
    //-----------------------addMeasureContext---------------------------------------
    requestContext.addMeasureContext("measureContextMdxName", "measureContextYseopId");
    mesContext = requestContext.measureContexts.get(_FIRST);
    assert(mesContext.mdxName == "measureContextMdxName");
    assert(mesContext.yseopId == "measureContextYseopId");
    //---------------------------------------------------------------------------------
    logInfo("LibCube:Test:requestContextTest() passed");
}
;

function LibCube:Test:timeDimensionTest()
--> local LibCube:TimeDimension timeDimension,
          LibCube:TimeMember time2k19,
          LibCube:TimeMember time2k18,
          LibCube:TimeMember time2k18_2,
          LibCube:TimeMember time2k17,
          LibCube:TimeMember time2k16,
          LibCube:TimeMember time2k15,
          LibCube:TimeMember comparator
--> action {
    logInfo("Running timeDimensionTest tests");

    time2k19 = new(LibCube:TimeMember);
    time2k19.dimension = DIMENSION_TIME;
    time2k19.label = "2019";
    time2k19.date = Date..stringToDate("2019-01-21");

    time2k18 = new(LibCube:TimeMember);
    time2k18.dimension = DIMENSION_TIME;
    time2k18.label = "2018-11";
    time2k18.date = Date..stringToDate("2018-11-01");

    time2k18_2 = new(LibCube:TimeMember);
    time2k18_2.dimension = DIMENSION_TIME;
    time2k18_2.label = "2018-06";
    time2k18_2.date = Date..stringToDate("2018-06-16");

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

    timeDimension = new(LibCube:TimeDimension);
    timeDimension.members.add(time2k17);
    timeDimension.members.add(time2k18_2);
    timeDimension.members.add(time2k16);
    timeDimension.members.add(time2k18);
    timeDimension.members.add(time2k15);
    
    comparator = timeDimension.getCurrentTimeMember();
    assert(comparator.label == time2k18.label);
    timeDimension.members.add(time2k19);
    comparator = timeDimension.getCurrentTimeMember();
    assert(comparator.label == time2k19.label);

    logInfo("LibCube:Test:timeDimensionTest() passed");
}
;



function LibCube:Test:getParentByLevelTest()
--> local 
          LibCube:Cube cube,
          LibCube:TimeMember memberYear,
          LibCube:TimeMember memberMonthJan,
          LibCube:TimeMember memberMonthFeb,
          LibCube:TimeMember memberWeek3,
          LibCube:TimeMember memberWeek2,
          LibCube:TimeMember memberWeek1,
          LibCube:TimeMember memberDay1,

          LibCube:Dimension dimension,
          LibCube:Hierarchy dimensionHierarchies,
          
          LibCube:Hierarchy yearHierarchy,
          LibCube:Hierarchy monthJanHierarchy,
          LibCube:Hierarchy monthFebHierarchy,
          LibCube:Hierarchy week3Hierarchy,
          LibCube:Hierarchy week2Hierarchy,
          LibCube:Hierarchy week1Hierarchy,
          LibCube:Hierarchy day1Hierarchy,

          LibCube:Member resMember
--> action {
    logInfo("Testing getParentByLevelTest");
    //dimensions members---------------------------------
    memberYear = new(LibCube:TimeMember);
    memberYear.label = "2018";
    memberYear.date = Date..stringToDate("2018-01-01");
    
    memberMonthJan = new(LibCube:TimeMember);
    memberMonthJan.label = "January";
    memberMonthJan.date = Date..stringToDate("2018-01-01");

    memberMonthFeb = new(LibCube:TimeMember);
    memberMonthFeb.label = "February";
    memberMonthFeb.date = Date..stringToDate("2018-02-01");

    memberWeek3 = new(LibCube:TimeMember);
    memberWeek3.label = "Third Week";
    memberWeek3.date = Date..stringToDate("2018-02-10");

    memberWeek2 = new(LibCube:TimeMember);
    memberWeek2.label = "Second Week";
    memberWeek2.date = Date..stringToDate("2018-01-08");

    memberWeek1 = new(LibCube:TimeMember);
    memberWeek1.label = "First Week";
    memberWeek1.date = Date..stringToDate("2018-01-05");

    memberDay1 = new(LibCube:TimeMember);
    memberDay1.label = "01";
    memberDay1.date = Date..stringToDate("2018-01-01");
    
    //hierarchies -----------------------------------------
    day1Hierarchy = new(LibCube:Hierarchy);
    day1Hierarchy.label = "01";
    day1Hierarchy.value = memberDay1;

    week3Hierarchy = new(LibCube:Hierarchy);
    week3Hierarchy.label = "Third week";
    week3Hierarchy.value = memberWeek3;
    week3Hierarchy.addChild(day1Hierarchy);

    week2Hierarchy = new(LibCube:Hierarchy);
    week2Hierarchy.label = "Second week";
    week2Hierarchy.value = memberWeek2;

    week1Hierarchy = new(LibCube:Hierarchy);
    week1Hierarchy.label = "First Week";
    week1Hierarchy.value = memberWeek1;

    monthJanHierarchy = new(LibCube:Hierarchy);
    monthJanHierarchy.label = "January";
    monthJanHierarchy.value = memberMonthJan;
    monthJanHierarchy.addChild(week2Hierarchy);
    monthJanHierarchy.addChild(week1Hierarchy);
    
    monthFebHierarchy = new(LibCube:Hierarchy);
    monthFebHierarchy.label = "February";
    monthFebHierarchy.value = memberMonthFeb;
    monthFebHierarchy.addChild(week3Hierarchy);

    yearHierarchy = new(LibCube:Hierarchy);
    yearHierarchy.label = "2018"; 
    yearHierarchy.value = memberYear;
    yearHierarchy.addChild(monthJanHierarchy);
    yearHierarchy.addChild(monthFebHierarchy);
    //---------------------------------------------------

    //dimension setting
    dimension = new(LibCube:Dimension);
    dimension.hierarchies.add(yearHierarchy);
    
    //---------------------------------------------------
    cube = new(LibCube:Cube);
    cube.dimensions.add(dimension);
    
    cube.initDimensions();
    
    foreach(_dimension , cube>>dimensions){
        foreach(_member,_dimension>>members){
                
            if(_member.label == "01"){
                assert(_member.getParentByLevel(3) == memberYear);
                assert(_member.getParentByLevel(2) == memberMonthFeb);
                assert(_member.getParentByLevel(1) == memberWeek3);
            }
            if(_member.label == "January" || _member.label == "February"){
                assert(_member.getParentByLevel(1) == memberYear);
                assert(_member.getParentByLevel(2) == null);
            }
            if(_member.label == "2018"){
                assert(_member.getParentByLevel(1) == null);
            }
            if(_member.label == "First Week"){
                assert(_member.getParentByLevel(1) == memberMonthJan);
                assert(_member.getParentByLevel(2) == memberYear);
                assert(_member.getParentByLevel(3) == null);
            }
        }
    }
    logInfo("LibCube:Test:getParentByLevelTest() passed");
    
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
    LibCube:Test:jointureChildParentDimensionCondition();
    LibCube:Test:measureGetMdxFullNameTest();
    LibCube:Test:memberGetMdxFullNameTest();
    LibCube:Test:NonIndicatorMembersIdTest();

    LibCube:Test:positiveNegativeFactsSorterTest();
    LibCube:Test:requestContextTest();
    LibCube:Test:timeDimensionTest();
    LibCube:Test:getParentByLevelTest();//issue22
    //LibCube:Test:multidimensionalTotalFactsCreatorTest();
    
}
;



