NlgAdjective BEAU_FR
	//--> root \(beau\)
	--> masculineSingular 	"beau"
	--> masculinePlural		"beaux"			
	--> feminineSingular 	"belle"
	--> femininePlural		"belles"
;

NlgAdjective BEAU_EN
	--> root \(beautiful\)
;

	
NlgAdjective ETENDU_FR
	--> root "étendu"
;

NlgAdjective ETENDU_EN
	--> root "large"
;

NlgAdjective GRAND_EN
	--> root "great"
;

NlgAdjective GRAND_FR
	--> root "grand"
;	



Function testAssert ()
--> action {

	//**************************************************************************
	//******************************** FR **************************************
	//**************************************************************************
	if(TEXT_PARAM_CONTEXT.kBLanguage == LANG_fr){

		assertText (\(	\value(LibGeography:retrieveCountry("FR"))  \), "la France");
		assertText (\(	\value(LibGeography:retrieveCountry("MC"))  \), "Monaco");
		assertText (\(	\value(LibGeography:retrieveCountry("VG"))  \), "les Îles Vierges britanniques");
		 
		assertText (\(	\value(LibGeography:retrieveCountry("FR"), _ADJECTIVE: BEAU_FR, _ADJECTIVE_POSITION: _AFTER_NOUN)  \), "la France belle");
		assertText (\(	\value(LibGeography:retrieveCountry("MC"), _ADJECTIVE: BEAU_FR)  \), "le beau Monaco");
		assertText (\(	\value(LibGeography:retrieveCountry("VG"), _ADJECTIVE: BEAU_FR)  \), "les belles Îles Vierges britanniques");
		
		assertText (\(	\thirdAction ( LibGeography:retrieveCountry("FR"), VERB_FR_ÊTRE, _ADJECTIVE: BEAU_FR)  \), "la France est belle");
		assertText (\(	\thirdAction ( LibGeography:retrieveCountry("MC"), VERB_FR_ÊTRE, _ADJECTIVE: BEAU_FR)  \), "Monaco est beau");
		assertText (\(	\thirdAction ( LibGeography:retrieveCountry("VG"), VERB_FR_ÊTRE, _ADJECTIVE: BEAU_FR)  \), "les Îles Vierges britanniques sont belles");
		
		assertText (\(	   
				\thirdAction ( 
						LibGeography:retrieveCountry("FR"),
						_DETERMINER: DEMONSTRATIVE_DETERMINER,
						_ADJECTIVE: GRAND_FR,
						VERB_FR_ÊTRE,
						_ADVERB: "vraiment",
						PRESENT_INDICATIVE_FR,
						_ADJECTIVE: BEAU_FR
					), et 
					\thirdAction ( 
						LibGeography:retrieveCountry("FR"), 
						VERB_FR_ÊTRE, 
						_ADJECTIVE: ETENDU_FR
					)
				\), "cette grande France est vraiment belle, et elle est étendue");
		
		assertText (\(	  
				\thirdAction ( 
						LibGeography:retrieveCountry("MC"),
						_DETERMINER: DEMONSTRATIVE_DETERMINER,
						_ADJECTIVE: GRAND_FR,
						VERB_FR_ÊTRE,
						_ADVERB: "vraiment",
						PRESENT_INDICATIVE_FR,
						_ADJECTIVE: BEAU_FR
					), et 
					\thirdAction ( 
						LibGeography:retrieveCountry("MC"), 
						VERB_FR_ÊTRE, 
						_ADJECTIVE: ETENDU_FR
					)
				\), "ce grand Monaco est vraiment beau, et il est étendu");		
		
		assertText (\(	  
				\thirdAction ( 
						LibGeography:retrieveCountry("VG"),
						_DETERMINER: DEMONSTRATIVE_DETERMINER,
						_ADJECTIVE: GRAND_FR,
						VERB_FR_ÊTRE,
						_ADVERB: "vraiment",
						PRESENT_INDICATIVE_FR,
						_ADJECTIVE: BEAU_FR
					), et 
					\thirdAction ( 
						LibGeography:retrieveCountry("VG"), 
						VERB_FR_ÊTRE, 
						_ADJECTIVE: ETENDU_FR
					)
				\), "ces grandes Îles Vierges britanniques sont vraiment belles, et elles sont étendues");		
					
	}
				
				
	//**************************************************************************
	//******************************** EN **************************************
	//**************************************************************************
	if(TEXT_PARAM_CONTEXT.kBLanguage == LANG_en){
		assertText (\(	\value(LibGeography:retrieveCountry("FR"))  \), "France");
		assertText (\(	\value(LibGeography:retrieveCountry("MC"))  \), "Monaco");
		assertText (\(	\value(LibGeography:retrieveCountry("VG"))  \), "the British Virgin Islands");
		
		assertText (\(	\value(LibGeography:retrieveCountry("FR"), _ADJECTIVE: BEAU_EN)  \), "beautiful France");
		assertText (\(	\value(LibGeography:retrieveCountry("MC"), _ADJECTIVE: BEAU_EN)  \), "beautiful Monaco");
		assertText (\(	\value(LibGeography:retrieveCountry("VG"), _ADJECTIVE: BEAU_EN)  \), "the beautiful British Virgin Islands");
		
		assertText (\(	
				\thirdAction ( 
						LibGeography:retrieveCountry("FR"),
						_DETERMINER: DEMONSTRATIVE_DETERMINER,
						_ADJECTIVE: GRAND_EN,

						VERB_EN_BE,
						_ADVERB: "really",
						PRESENT_EN,

						_ADJECTIVE: BEAU_EN
					), and 
					\thirdAction ( 
						LibGeography:retrieveCountry("FR"), 
						VERB_EN_BE, 
						_ADJECTIVE: ETENDU_EN
					)					  
				\), "this great France is really beautiful, and it is large");
		
		assertText (\(	
			\thirdAction ( 
					LibGeography:retrieveCountry("MC"),
					_DETERMINER: DEMONSTRATIVE_DETERMINER,
					_ADJECTIVE: GRAND_EN,
	
					VERB_EN_BE,
					_ADVERB: "really",
					PRESENT_EN,
	
					_ADJECTIVE: BEAU_EN
				), and 
				\thirdAction ( 
					LibGeography:retrieveCountry("MC"), 
					VERB_EN_BE, 
					_ADJECTIVE: ETENDU_EN
			)					  
		\), "this great Monaco is really beautiful, and it is large");		

		assertText (\(	
				\thirdAction ( 		
					LibGeography:retrieveCountry("VG"),
					_DETERMINER: DEMONSTRATIVE_DETERMINER,
					_ADJECTIVE: GRAND_EN,
	
					VERB_EN_BE,
					_ADVERB: "really",
					PRESENT_EN,
	
					_ADJECTIVE: BEAU_EN
				), and 
				\thirdAction ( 
					LibGeography:retrieveCountry("VG"), 
					VERB_EN_BE, 
					_ADJECTIVE: ETENDU_EN
				)					  
		\), "these great British Virgin Islands are really beautiful, and they are large");
		

	}
}
;



