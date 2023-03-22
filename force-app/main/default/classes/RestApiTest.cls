@isTest
public  class RestApiTest {
	@isTest
    public static void testCreateLead(){
		RestRequest req = new RestRequest();
 		RestResponse restt = new RestResponse();

		req.requestURI = '/services/apexrest/LeadRecord';
		req.httpMethod = 'POST';
		RestContext.request = req;
		RestContext.response= restt;

		RestClass.Result  result = new RestClass.Result();
		result.isSuccess = True;
		result.lead = 'Lead';
		result.status = 'Success';
		Test.startTest();
 			result = RestClass.createLead('abd', 'cvr', 'abd@cvr.com', '9090909090','ABC');
        	System.assert(result.isSuccess = True);
        Test.stopTest();
        
	}
    
    /*@isTest
    private static void testUpdateLead() {
		
        Lead leadInst = new Lead(FirstName = 'Omkar', LastName = 'Gaikwad', Email = 'omkar@gmail.com', Phone = '7899656321');
        System.debug('Before insert line 43');
        insert leadInst;
        
        List<Lead> leadObj = [select Id, Email, FirstName, Lastname from Lead where Id =: leadInst.Id LIMIT 1];
		Lead ld = [SELECT Id FROM Lead WHERE Id =: leadObj];
        RestRequest req = new RestRequest();
 		RestResponse restt = new RestResponse();
        
		req.requestURI = 'https://empathetic-fox-gy5u3x-dev-ed.lightning.force.com//services/apexrest/LeadRecord' + ld.Id;
		req.httpMethod = 'PATCH';
		RestContext.request = req;
		RestContext.response = restt;

		RestClass.Result  result = new RestClass.Result();
        
		RestRequest request = RestContext.request;

        String leadId = request.requestURI.substring(request.requestURI.lastindexof('/') + 1);
        
        leadObj[0].FirstName = 'Rohan';
        leadObj[0].LastName = 'Gaikwad';
        leadObj[0].Email = 'rohan.gaikwad@gmail.com';
        leadObj[0].Phone = '7899656321';
        result = RestClass.updateLead(leadInst.FirstName = 'Rohan', leadInst.LastName = 'Gaikwad', leadInst.Email = 'rohan.gaikwad@gmail.com', leadInst.Phone = '7899656321'); 
  		System.debug('Before update line 52');
        update leadInst;
		
        result.isSuccess = True;
        result.lead = leadObj[0].Id;
        result.status = 'Success';
        
    }*/

    @isTest
    static void testUpdateContact() {
        Test.startTest();
        // Querying the contact to update
        Lead contactToUpdate = [SELECT Id FROM Lead LIMIT 1];
        // Updating the first name of contact
        Lead leadObj = new Lead();
        leadObj.FirstName = 'Gavin';
        // Forming the request
        RestClass.Result result = new RestClass.Result();
        RestRequest contactRequest = new RestRequest();
        contactRequest.requestUri = 'https://empathetic-fox-gy5u3x.com/services/apexrest/LeadRecord/' + contactToUpdate.Id;
        contactRequest.httpMethod = 'PATCH';
        contactRequest.requestBody = Blob.valueOf(JSON.serialize(leadObj));
        RestContext.request = contactRequest;
 
        result = RestClass.updateContact();
        
        Lead queriedContact = [SELECT FirstName, LastName FROM Lead WHERE Id =: contactToUpdate.Id];
        	System.assertEquals(leadObj.Id, queriedContact.Id);
        	System.assert(result.isSuccess = True);
        	System.assertEquals('Gavin', queriedContact.FirstName);
        	System.assertEquals('Hendricks', queriedContact.LastName);
        Test.stopTest();
    }
    
    
    
    @isTest
    private static void testDeleteLead() {

		Lead ld = [SELECT Id FROM Lead];
        RestRequest req = new RestRequest();
 		RestResponse restt = new RestResponse();
        
        RestClass.Result  result = new RestClass.Result();
        req.requestURI = '/services/apexrest/LeadRecord' + ld.Id;
		req.httpMethod = 'DELETE';
		RestContext.request = req;
		RestContext.response = restt;
        
       	RestRequest request = RestContext.request;
       	String leadId = request.requestURI.substring(request.requestURI.lastindexof('/') + 1);       	
        Lead leadInst = new Lead(FirstName = 'Omkar', LastName = 'Kadam', Email = 'omkar@gmail.com', Phone = '7899656321');
        insert leadInst;
  		List<Lead> leadObj = [select Id, Email, FirstName, Lastname from Lead where Id =: leadInst.Id];  
  		result = RestClass.deleteLead();
        System.assert(result.isSuccess = True);
    }
}