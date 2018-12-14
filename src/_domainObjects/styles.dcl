Style styleOrdinal
    --> numeralStyle _ORDINAL_NUMERAL
;

Style styleCapitalizeFirstLetter
   --> case _LOWERCASE_AND_CAPITALIZE_ALL_WORDS
   	--> interpretSentenceEnd false
	--> insertSpaceAfterPoint true
;

Style nameStyle
	--> interpretSentenceEnd false
	--> insertSpaceAfterPoint true
;

Style lowerCaseSegment
    --> case _LOWERCASE
;


Style zeroDigitStyle
	--> decimalsCount 0
	--> separateThousands true
;	
	
Style oneDigitStyle
	--> decimalsCount 1
;

Style twoDigitStyle
	--> decimalsCount 2
;

Style basisPoint
	--> decimalsCount 0
    --> numeralStyle _CARDINAL_NUMERAL
;

Style megaOneDigitStyle
	--> decimalsCount 1
	--> scale _KILO_MEGA_GE_1000_1000000
;

Style kiloOneDigitStyle
	--> decimalsCount 1
	--> scale _KILO_GE_1000
;

Style seperateThousandsStyle
    --> separateThousands true
;

Style styleWithInterpretFalse
    --> interpretSentenceEnd false
;