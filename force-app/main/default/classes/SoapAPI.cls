global class SoapAPI {
    
    WebService static String newLead(String firstName, String lastName, String email, String phone, String company){
        System.JSONGenerator j = JSON.createGenerator(true);
        j.writeStartObject();
        j.writeFieldName('Status');
        try{
            Lead ld = new Lead();
            ld.FirstName = firstName;
            ld.LastName = lastName;
            ld.Email = email;
            ld.Phone = phone;
            ld.Company = company;
            insert ld;
            j.writeString('Success');
            j.writeIdField('Id', ld.Id);
        }catch(Exception e) {
            j.writeString('Failed');
            j.writeStringField('Error', e.getMessage());
        }
        j.writeEndObject();
        String result = j.getAsString();
        return result;
    }
    
    
    WebService static String deleteLead(String firstName, String lastName, String email, String phone){
      /*  firstName = RestContext.request.params.get('firstName');
        lastName = RestContext.request.params.get('lastName');
        email = RestContext.request.params.get('email');
        phone = RestContext.request.params.get('phone');  */
        
        System.JSONGenerator j = JSON.createGenerator(true);
        j.writeStartObject();
        j.writeFieldName('Status');
        
        try{
            String query ='Select id from Lead where FirstName= :firstName and LastName= :lastName and Email= :email and Phone= :phone';
            List<Lead> leadList= Database.query(query);
            delete leadList;
            j.writeString('Success');
           // j.writeIdField('Id', leadLst[0].Id);
            
        }catch(Exception e) {
            j.writeString('Failed');
            j.writeStringField('Error', e.getMessage());
        }
        j.writeEndObject();
        String result = j.getAsString();
        return result;
        
    }
    
    
    WebService static String updateLead(String firstName, String lastName, String email, String phone, String company){
        System.JSONGenerator j = JSON.createGenerator(true);
        j.writeStartObject();
        j.writeFieldName('Status');
        
        try{
            String query ='Select FirstName, LastName, Email,Phone,company From Lead where FirstName =:firstName and LastName =:lastName limit 1';
            List<Lead> leadLst= Database.query(query);
            leadLst[0].Email = email;
            leadLst[0].Phone = phone;
            update leadLst;
            j.writeString('Success');
            j.writeIdField('Id', leadLst[0].Id);
            
        }catch(Exception e) {
            j.writeString('Failed');
            j.writeStringField('Error', e.getMessage());
        }
        j.writeEndObject();
        String result = j.getAsString();
        return result;
    }
}