global class SoapClass {

    global class ManipulationResponse {
        webservice Boolean isSuccess;
        webservice String lead;
        webservice String status;
    }

  	webservice static ManipulationResponse createLead(String firstName, String lastName, String company, String email, String phone) {
    	
        Lead leadObj = new Lead();
        ManipulationResponse manipulateResponseObj = new ManipulationResponse();
        manipulateResponseObj.isSuccess = false;
        manipulateResponseObj.lead = '';

        leadObj.FirstName = firstName;
        leadObj.LastName = lastName;
        leadObj.Email = email;
        leadObj.Phone = phone;
        leadObj.Company = company;
       
        insert leadObj;

        manipulateResponseObj.isSuccess = true;
        manipulateResponseObj.lead = leadObj.id;
        manipulateResponseObj.status = 'Success';

        return manipulateResponseObj;
  }
    
    webservice static ManipulationResponse updateLead(String firstName, String lastName, String newEmail, String newPhone) {
        
        ManipulationResponse manipulateResponseObj = new ManipulationResponse();
        manipulateResponseObj.isSuccess = false;
        manipulateResponseObj.lead = '';
        List<Lead> leadList;
       
        leadList = [SELECT Id, Email, Phone FROM Lead WHERE FirstName =: firstName AND LastName =: lastName];
        
    	if(leadList.size() == 0) {
            manipulateResponseObj.status = 'Lead Update : No Lead found for Input Parameters.';
            return manipulateResponseObj;
        }

        for( Lead leadRecord : leadList ) {
            leadRecord.Email = newEmail;
            leadRecord.Phone = newPhone;
        }

        update leadList;

        manipulateResponseObj.isSuccess = true;
        manipulateResponseObj.lead = leadList[0].id;
        manipulateResponseObj.status = 'Success';
        return manipulateResponseObj;
    }

    webservice static ManipulationResponse deleteLead(String firstName, String lastName, String email, String phone) {
        List<Lead> leadList;
        ManipulationResponse manipulateResponseObj = new ManipulationResponse();
        manipulateResponseObj.isSuccess = false;
        manipulateResponseObj.lead = '';

        leadList = [SELECT Id FROM Lead WHERE FirstName = :firstName AND LastName = :lastName AND  Email = :email AND Phone = :phone];        

        delete leadList;
 
        manipulateResponseObj.isSuccess = true;
        manipulateResponseObj.status = 'Success';
        return manipulateResponseObj;
    }
}