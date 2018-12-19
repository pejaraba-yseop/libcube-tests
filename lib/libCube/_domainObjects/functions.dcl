function getFactsComparison(LibCube:Fact fact, LibCube:Fact referenceFact, LibCube:Measure comparingMeasure)
--> domains LibCube:TwoFactsOneMeasureComparison 
--> local LibCube:TwoFactsOneMeasureComparison comparison
--> action {
    comparison = new(LibCube:TwoFactsOneMeasureComparison)
    comparison.fact = fact
    comparison.referenceFact = referenceFact
    comparison.measure = comparingMeasure
    comparison.compute()
    return comparison;
}
;

function getPercentageFactsComparison(LibCube:Fact fact, LibCube:Fact referenceFact, LibCube:Measure comparingMeasure)
--> domains LibCube:TwoFactsOneMeasureComparison 
--> local LibCube:TwoFactsOneMeasureComparison comparison
--> action {
    comparison = new(LibCube:TwoFactsOneMeasureComparison)
    comparison.fact = fact
    comparison.referenceFact = referenceFact
    comparison.measure = comparingMeasure
    comparison.areComparedValuesRelative = true
    comparison.compute()
    return comparison;
}
;

function getRatioFactsComparison(LibCube:Fact fact, LibCube:Fact referenceFact, LibCube:Measure comparingMeasure)
--> domains LibCube:TwoFactsOneMeasureComparison 
--> local LibCube:TwoFactsOneMeasureComparison comparison
--> action {
    return getPercentageFactsComparison(fact, referenceFact, comparingMeasure);
}
;

function getOneMeasureSorter
args{
    Collection          facts

    LibCube:Measure     comparingMeasure

    Boolean             useAbsoluteValue
    --> key             _USE_ABSOLUTE_VALUE
    --> defaultValue    false

    Boolean             isAscendant
    --> key             _IS_ASCENDANT
    --> defaultValue    false
}
local {
    LibCube:FactsSorter sorter
}
--> domains LibCube:FactsSorter
--> action {
    sorter = new(LibCube:FactsSorter)
    sorter.facts = facts
    sorter.sortType = SORT_TYPE_ONE_MEASURE
    sorter.measure = comparingMeasure
    sorter.sortFacts()
    return sorter;
}
;

function getOneDimensionSorter
args{
    Collection          facts

    LibCube:Dimension comparingDimension
}
local {
    LibCube:FactsSorter sorter
}
--> domains LibCube:FactsSorter
--> action {
    sorter = new(LibCube:FactsSorter)
    sorter.facts = facts
    sorter.sortType = SORT_TYPE_DIMENSION
    sorter.dimension = comparingDimension
    sorter.sortFacts()
    return sorter;
}
;

function getComparisonAttributeSorter
args{
    Collection          facts

    Attribute           twoFactsComparisonAttr

    Attribute           twoFactsDifferenceAttr

    Boolean             useAbsoluteValue
    --> key             _USE_ABSOLUTE_VALUE
    --> defaultValue    false

    Boolean             isAscendant
    --> key             _IS_ASCENDANT
    --> defaultValue    false
}
local {
    LibCube:FactsSorter sorter
}
--> domains LibCube:FactsSorter
--> action {
    sorter = new(LibCube:FactsSorter)
    sorter.facts = facts
    sorter.sortType = SORT_TYPE_COMPARISON_ATTRIBUTE
    sorter.twoFactsComparisonAttribute = twoFactsComparisonAttr
    sorter.twoFactsDifferenceAttribute = twoFactsDifferenceAttr
    sorter.useAbsoluteValue = false
    sorter.sortFacts()
    return sorter;
}
;

function buildFactSelection
args {
    List conditions
}
local {
    List conditionList
    LibCube:Jointure jointure
    LibCube:JointureFactsSelection selection
}
--> domains LibCube:JointureFactsSelection
--> action {
    
    // build jointure and fact selection
    jointure = new(LibCube:Jointure);
    jointure.dimensionConditions = conditions;
    
    selection = new(LibCube:JointureFactsSelection);
    selection.jointure = jointure;
    return selection;
}
;

function buildOneFactSelection
args {
    List conditions
}
local {
    List conditionList
    LibCube:Jointure jointure
    LibCube:JointureFactsSelection selection
}
--> domains LibCube:JointureOneFactSelection
--> action {
    
    // build jointure and fact selection
    jointure = new(LibCube:Jointure);
    jointure.dimensionConditions = conditions;
    
    selection = new(LibCube:JointureOneFactSelection);
    selection.jointure = jointure;
    return selection;
}
;
