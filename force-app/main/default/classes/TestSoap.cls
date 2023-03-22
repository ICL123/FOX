@isTest
public class TestSoap {
    
    @testSetup
    static void setupData() {
        List<Lead> leadList = new List<Lead>();
        for(Integer i = 0; i < 5; i++) {
        	leadList.add(new Lead(FirstName = 'Test' + i, LastName = 'Demo' + i, Company = 'ESPL', Status = 'Working Contacted'));    
        }
        insert leadList;
    }
    
	@isTest
   	public static void testCreateLead() {

		SoapClass.ManipulationResponse result = new SoapClass.ManipulationResponse();
		result.isSuccess = True;
		result.lead = 'Lead';
		result.status = 'Success';
		
		Test.startTest();
 			result = SoapClass.createLead('abd', 'cvr','ABC', 'abd@cvr.com', '9090909090');
        	System.assert(result.isSuccess = true);
        Test.stopTest();
    
	}
    
    @isTest
    public static void testDeleteLead() {
       	Test.startTest();
        
        	Lead leadToDelete = [SELECT Id FROM Lead LIMIT 1];
			SoapClass.ManipulationResponse result = new SoapClass.ManipulationResponse();
			result.isSuccess = True;
			result.lead = 'Lead';
			result.status = 'Success';

			Lead leadRecord = [SELECT FirstName, LastName FROM Lead WHERE Id =: leadToDelete.Id];
 			result = SoapClass.deleteLead('abd', 'cvr', 'abd@cvr.com', '9090909090');
        	System.assert(result.isSuccess = true);
        
        Test.stopTest();
        
    }
    
    @isTest
    public static void testUpdateLead() {
       	Test.startTest();
        
        	Lead leadToUpdate = [SELECT Id FROM Lead LIMIT 1];
        
        	Lead leadObj = new Lead();
        	leadObj.FirstName = 'Michael';
        	leadObj.LastName = 'Townley';
        
			SoapClass.ManipulationResponse result = new SoapClass.ManipulationResponse();
			result.isSuccess = True;
			result.lead = 'Lead';
			result.status = 'Success';

			Lead leadRecord = [SELECT FirstName, LastName FROM Lead WHERE Id =: leadToUpdate.Id];
 			result = SoapClass.updateLead('Michael', 'Townley', 'michael.townley@cvr.com', '9090909090');
        	System.assert(result.isSuccess = true);
        	System.assertEquals(leadToUpdate.Id, leadRecord.Id);
        
        Test.stopTest();
    }
}