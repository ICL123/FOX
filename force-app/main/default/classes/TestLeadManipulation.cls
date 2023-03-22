@isTest
public class TestLeadManipulation{
	public static testmethod void testService(){
		RestRequest req = new RestRequest();
		RestResponse res = new RestResponse();	
		req.requestURI = '/services/apexrest/Lead/*';
		req.httpMethod = 'POST';
		RestContext.request = req;
		RestContext.response= res;
        RestRequest request = RestContext.request;
        String leadId = request.requestURI.substring(request.requestURI.lastindexof('/') + 1);
		LeadManipulationService.Result result = new LeadManipulationService.Result();
		result.isSuccess = True;
		result.lead = 'Lead';
		result.status = 'Success';
		LeadManipulationService lm = new LeadManipulationService();
		result = LeadManipulationService.createLead('Vara', 'prasad', 'vara@abc.com', '9090909090', 'ABC');
		result = LeadManipulationService.updateLead('Vara', 'prasad', 'vara@abc.com', '9090909090');
		result = LeadManipulationService.deleteLead();
		System.assert(result.isSuccess==true);
}
}