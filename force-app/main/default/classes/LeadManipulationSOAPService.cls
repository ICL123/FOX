global class LeadManipulationSOAPService { 
 

    global class ManipulationResponse { 
        webservice Boolean isSuccess; 
        webservice String lead; 
        webservice String status; 
    } 
 
 
  webservice static ManipulationResponse createLead( 
    String firstName,  
        String lastName,  
        String company, 
        String email,  
        String phone 
  ){ 
    Lead leadRecord = new Lead(); 
        ManipulationResponse returnResponse = new ManipulationResponse(); 
        returnResponse.isSuccess = false; 
        returnResponse.lead = ''; 
             
        if( lastName == null || lastName.equals('') ) { 
            returnResponse.status = 'Lead : Last Name is missing.'; 
            return returnResponse; 
        } else if( company == null || company.equals('') ) { 
            returnResponse.status = 'Lead : Company is missing.'; 
            return returnResponse; 
        } 
 
        leadRecord.FirstName = firstName; 
        leadRecord.LastName = lastName; 
        leadRecord.Email = email; 
        leadRecord.Phone = phone; 
        leadRecord.Company = company; 
 
        try { 
            insert leadRecord; 
        } catch (DMLException ex) { 
            returnResponse.status = 'Lead: Insertion Exception'; 
            return returnResponse; 
        } 
 
        returnResponse.isSuccess = true; 
        returnResponse.lead = leadRecord.id; 
        returnResponse.status = 'Success'; 
 
        return returnResponse; 
  } 
 

    webservice static ManipulationResponse updateLead( 
        String firstName, 
        String lastName, 
        String newEmail, 
        String newPhone 
    ) { 
        ManipulationResponse returnResponse = new ManipulationResponse(); 
        returnResponse.isSuccess = false; 
        returnResponse.lead = ''; 
        List<Lead> leadList; 
        
        leadList = [ 
            SELECT 
                id, 
                Email, 
                Phone 
            FROM 
                Lead 
            WHERE 
                FirstName = :firstName  
            AND 
                LastName = :lastName 
        ]; 
         
 
    if(leadList.size() == 0) { 
            returnResponse.status = 'Lead Update : No Lead found for Input Parameters.'; 
            return returnResponse; 
        } 
 
        for( Lead leadRecord : leadList ) { 
            leadRecord.Email = newEmail; 
            leadRecord.Phone = newPhone; 
        } 
 
        try { 
            update leadList; 
        } catch(DMLException ex) { 
            returnResponse.status = 'Lead Updation : Failed'; 
            return returnResponse; 
        } 
 
        returnResponse.isSuccess = true; 
        returnResponse.lead = leadList[0].id; 
        returnResponse.status = 'Success'; 
        return returnResponse; 
    } 
 
 
 
 
  /** 
        This Method deletes Lead using SOAP Webservice. 
        @return ManipulationResponse - Response for external system. 
     */ 
    webservice static ManipulationResponse deleteLead( 
    String firstName, 
        String lastName, 
        String email, 
        String phone 
  ) { 
        List<Lead> leadList; 
        ManipulationResponse returnResponse = new ManipulationResponse(); 
        returnResponse.isSuccess = false; 
        returnResponse.lead = ''; 
 
        leadList = [ 
            SELECT 
                id 
            FROM 
                Lead 
            WHERE 
                FirstName = :firstName  
            AND 
                LastName = :lastName 
            AND  
                Email = :email 
            AND 
                Phone = :phone 
        ];         
         
        if(leadList.size() == 0) { 
            returnResponse.status = 'Lead Deletion : No Lead found for Input Parameters.'; 
            return returnResponse; 
        } 
 
        try { 
            delete leadList; 
        } catch(DMLException ex) { 
            returnResponse.status = 'Lead Deletion : Failed'; 
            return returnResponse; 
        } 
 
        returnResponse.isSuccess = true; 
        returnResponse.lead = firstName + ' ' + lastName ; 
        returnResponse.status = 'Success'; 
        return returnResponse; 
    } 
 
}