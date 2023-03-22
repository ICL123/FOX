@isTest
public class TestCountry {
	@testSetup
    static void setup() {
        
		Country__c countryObj = new Country__c();
			countryObj.Name ='INDIA';
		insert CountryObj ;
		
		City__c cityObj = new City__c();
			cityObj.Name='Delhi';
			cityObj.Country__c  ='INDIA';
		insert cityObj;
        
		City__c cityObj1 = new City__c();
			cityObj1.Name='Miami';
			cityObj1.Country__c  ='USA';
		insert cityObj1;
        
		City__c cityObj2 = new City__c();
			cityObj2.Name='Milan';
			cityObj2.Country__c  ='Italy';
		insert cityObj2;
        
        City__c cityObj3 = new City__c();
        	cityObj3.Name = 'Paris';
        	cityObj3.Country__c = 'France';
        insert cityObj3;
    }
    
    @isTest
    public static void testCountryList() {
        Test.startTest();
			CountryDependentController  countryObj = new CountryDependentController(); 
		  	List<SelectOption> countryList = countryObj.getCountrylist();
        	List<SelectOption> cityList = countryObj.getCityList();
		  	countryObj.country='INDIA';
		  	countryObj.getCityList();
        	countryObj.country = 'USA';
        	countryObj.getCityList();
        	countryObj.country = 'Italy';
        	countryObj.getCityList();
        	countryObj.country = 'France';
        	countryObj.getCityList();
        	countryObj.country = null;
        	countryObj.getCityList();
        Test.stopTest();
        System.assert(countryList != null);
        System.assert(cityList != null);
	}
}