function LibGeography:retrieveCountry(Object input)
	--> domains LibGeography:Country
	--> local LibGeography:Country country
	--> action {
			// the input can be of different types: Country, int, or string
			if (input.isInstanceOf(LibGeography:Country) == true){
				country = input;
			}
			
			if (input.isInstanceOf(Number)==true){
				country = dummyCountry.getCountry(input);
			}
			
			if (input.isInstanceOf(Text) == true){
				// try to retrieve by code
					country = dummyCountry.findCountryByCode(input);
			}
			
			return country;
};

function LibGeography:retrieveCountryByLabel(Object input)
	--> domains LibGeography:Country
	--> local 
			LibGeography:Country country
	--> action {
			country = dummyCountry.findCountryByLibelle(input);	
			return country;
};

