@isTest
public  class TestRestAPI {
    
    @testSetup
    static void setupData() {
        List<Lead> leadList = new List<Lead>();
        for(Integer i = 0; i < 5; i++) {
        	leadList.add(new Lead(FirstName = 'Test' + i, LastName = 'Demo' + i, Company = 'ESPL', Status = 'Working Contacted'));    
        }
        insert leadList;
    }

	@isTest
    public static void testCreateLead(){
		RestRequest req = new RestRequest();
 		RestResponse restt = new RestResponse();

		req.requestURI = '/services/apexrest/LeadRecord/*';
		req.httpMethod = 'POST';
		RestContext.request = req;
		RestContext.response= restt;

		RestClass.Result  result = new RestClass.Result();
		result.isSuccess = True;
		result.lead = 'Lead';
		result.status = 'Success';
		Test.startTest();
 			result = RestClass.createLead('abd', 'cvr', 'abd@cvr.com', '9090909090','ABC');
        	System.assert(result.isSuccess = true);
        Test.stopTest();
        
	}
    
    @isTest
    private static void testUpdateLead() {
		Test.startTest();
			Lead leadToUpdate = [SELECT Id FROM Lead LIMIT 1];
        
        	Lead leadObj = new Lead();
        	leadObj.FirstName = 'Michael';
        	leadObj.LastName = 'Townley';
        
        	RestRequest leadRequest = new RestRequest();
        	RestResponse leadResponse = new RestResponse();
        
        	leadRequest.requestURI = 'https://empathetic-fox-gy5u3x-dev-ed/services/apexrest/LeadRecord/'+leadToUpdate.Id;
        	leadRequest.httpMethod = 'PATCH';
        	leadRequest.requestBody = Blob.valueOf(JSON.serialize(leadObj));
        	
        
        	RestContext.request = leadRequest;
        	RestContext.response = leadResponse;
        	RestClass.Result result = new RestClass.Result();
       	 
       		result = RestClass.updateLead();
        
        	Lead leadRecord = [SELECT FirstName, LastName FROM Lead WHERE Id =: leadToUpdate.Id];
        	System.assertEquals(leadToUpdate.Id, leadRecord.Id);
        	System.assert(result.isSuccess = true);
        
        Test.stopTest();
    }
    
    @isTest
    private static void testDeleteLead() {
		Test.startTest();
			Lead leadToDelete = [SELECT Id FROM Lead LIMIT 1];
        	RestRequest leadRequest = new RestRequest();
 			RestResponse leadResponse = new RestResponse();
        	
        	leadRequest.requestURI = 'https://empathetic-fox-gy5u3x-dev-ed/services/apexrest/LeadRecord' + leadToDelete.Id;
			leadRequest.httpMethod = 'DELETE';
			RestContext.request = leadRequest;
			RestContext.response = leadResponse;
        
        	RestClass.Result  result = new RestClass.Result();

       		RestRequest request = RestContext.request;
        	
        	result = RestClass.deleteLead();
        
  			Lead leadRecord = [select FirstName, Lastname from Lead where Id =: leadToDelete.Id ALL ROWS];  
        
        	System.assert(result.isSuccess = true);
        Test.stopTest();
    }
}