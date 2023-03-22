public class CountryDependentController {
        Map<String, Country__c> countryMap = Country__c.getall();
        public String country{ get; set;}
    
    public List<SelectOption> getCountrylist() {

        List<SelectOption> selectoptionList = new List<SelectOption>();
        for(String country : countryMap.keySet()){
        selectoptionList.add(new selectoption(country,country));
        }
        return selectoptionList;
        }
 
    public List<SelectOption> getCityList() {      
    	List<SelectOption> selectoptionList = new List<SelectOption>();
        if( country == null ) {
            return selectoptionList;
        } 
        else {
    		List<City__c> cityList = [select Name,Country__c from City__c where Country__c =: country ];
            for(City__c city :cityList) {
                if(city.Country__c == country ) {
                    selectoptionList.add(new selectoption(city.Name, city.Name));
                } 
            }
        }
        return selectoptionList;
        }
}