public class ApplicatinSettingMultiPick {
    public String country {get;set;}
    public String city {get; set;}
	public List<SelectOption> getCountries() {
		List<SelectOption> options = new List<SelectOption>();
		options.add(new SelectOption('None','--- Select ---'));
		for(Country__c countryObj: [select Name from Country__c ]) {
			options.add(new SelectOption(countryObj.Name,countryObj.Name));
		}

		return options;
	}
 
	public List<SelectOption> getCities() {
		List<SelectOption> optionsList = new List<SelectOption>();
		if(country == 'USA') {
			for(City__c cityObj: [select Name,Country__c from City__c where Country__c='USA' ]) {
				optionsList.add(new SelectOption(cityObj.Name,cityObj.Name));
			}	
		}
		else if(country == 'India') {
			for(City__c cityObj: [select Name,Country__c from City__c where Country__c='India' ]) {
				optionsList.add(new SelectOption(cityObj.Name,cityObj.Name));
			}
		}
    	else if(country == 'France') {
			for(City__c cityObj: [select Name,Country__c from City__c where Country__c='France' ]) {
				optionsList.add(new SelectOption(cityObj.Name,cityObj.Name));
			}
		}
    	else if(country == 'Italy') {
			for(City__c cityObj: [select Name,Country__c from City__c where Country__c='Italy' ]) {
				optionsList.add(new SelectOption(cityObj.Name,cityObj.Name));
			}
		}
		else {
			optionsList.add(new SelectOption('None','--- Select ---'));
		}		
		return optionsList;
	}
}