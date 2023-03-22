@isTest
public class TestRest {
	public static testmethod void testCreateMethod() {
		RestRequest request=new RestRequest();
        request.requestURI='/services/apexrest/Lead';
        request.httpMethod='POST';
        RestContext.request=request;
        String strId=LeadManipulationService.createLead('Anand','Bahirat','ab@gmail.com','123321','Infosys');
        System.assert(strId!=null);
	}
}