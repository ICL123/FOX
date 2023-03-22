@RestResource(urlMapping = '/LeadRecord/*')
global class RestClass {
   
    global class Result {
        public Boolean isSuccess;
        public String lead;
        public String status;
    }
    
    @HttpPost
    global static Result createLead(String firstName, String lastName, String email, String phone, String company) {
        Result resultObj = new Result();
        resultObj.isSuccess = false;
        resultObj.status = 'Error';
        
        Lead leadObj = new Lead();
        leadObj.FirstName = firstName;
        leadObj.LastName = lastName;
        leadObj.Email = email;
        leadObj.Phone = phone;
        leadObj.Company = company;
        insert leadObj;

     	resultObj.isSuccess = true;
        resultObj.status = 'Success';
        resultObj.lead = leadObj.Id;
        return resultObj;   
    }

    @HTTPPatch
    global static Result updateLead() {
        
        Result resultObj = new Result();
        resultObj.isSuccess = false;
        resultObj.status = 'Error';
        
        RestRequest leadRequest = RestContext.request;

        String leadRequestURI = leadRequest.requestURI;

        String leadId = leadRequestURI.substring(leadRequestURI.lastIndexOf('/') + 1);

        String requestBody = leadRequest.requestBody.toString();

        Lead leadObj;

        if(String.isNotEmpty(leadId)) {
            leadObj = (Lead) JSON.deserialize(requestBody, Lead.class);
            leadObj.Id = leadId;
            update leadObj;
        }

     	resultObj.isSuccess = true;
        resultObj.status = 'Success';
        resultObj.lead = leadObj.Id;
        return resultObj;
    }
        
    @HttpDelete
   	global static Result deleteLead() {
    	Result resultObj = new Result();
        resultObj.isSuccess = false;
        resultObj.status = 'Error';
       
       	RestRequest request = RestContext.request;
       	String leadId = request.requestURI.substring(request.requestURI.lastindexof('/') + 1);
       	List<Lead> leadList = [select Id from lead where Id =: leadId];
       	delete leadList;
	
     	resultObj.isSuccess = true;
        resultObj.status = 'Success';
        return resultObj;   
    }
}