@RestResource(urlMapping='/Lead/*') 
global class LeadManipulationService { 
     
    global class Result { 
        public Boolean isSuccess; 
        public String lead; 
        public String status; 
    } 
     
  	@HttpPost 
    global static Result createLead(String firstName, String lastName, String email, String phone, String company) { 
        Result res= new Result(); 
        res.isSuccess = false; 
        res.status = 'Error'; 
         
        Lead l = new Lead(); 
        l.FirstName = firstName; 
        l.LastName = lastName; 
        l.Email = email; 
        l.Phone = phone; 
        l.Company = company; 
         
         
        try { 
            insert l; 
        }catch(DMLException e) { 
            return res; 
        } 
         
     res.isSuccess = true; 
        res.status = 'Success'; 
        res.lead = l.Id; 
        return res;    
         
    } 
     
     
    @HttpPatch 
    global static Result updateLead(String firstName, String lastName, String email, String phone) { 
        Result res= new Result(); 
        res.isSuccess = false; 
        res.status = 'Error'; 
    
        RestRequest request = RestContext.request;
        String leadId = request.requestURI.substring(request.requestURI.lastindexof('/') + 1);
         
        List<Lead> l = [ 
            SELECT 
              FirstName, 
              LastName, 
              Email, 
              Phone 
            FROM 
              Lead 
            WHERE 
 
            Id =: leadId
            LIMIT 1 
        ]; 
        l[0].FirstName = firstName; 
        l[0].LastName = lastName; 
        l[0].Email = email; 
        l[0].Phone = phone; 
         
         
        try { 
            update l; 
        }catch(DMLException e) { 
            return res; 
        } 
         
     res.isSuccess = true; 
        res.status = 'Success'; 
        res.lead = l[0].Id; 
        return res;    
         
    } 
  
    @HttpDelete 
   	global static Result deleteLead() { 
        Result res= new Result(); 
        res.isSuccess = false; 
        res.status = 'Error'; 
        RestRequest request = RestContext.request;
        String leadId = request.requestURI.substring(request.requestURI.lastindexof('/') + 1);
         
        String firstName = RestContext.request.params.get('firstName'); 
        String lastName = RestContext.request.params.get('lastName'); 
        String email = RestContext.request.params.get('email'); 
        String phone = RestContext.request.params.get('phone'); 
         
 
        List<Lead> leadList = [ 
            SELECT 
                id 
            FROM 
                Lead 
            WHERE 
                FirstName =:firstName  
            AND 
                LastName =:lastName 
            AND  
                Email =:email 
            AND 
                Phone =:phone 
            AND Id =: leadId
        ]; 
         
        try { 
            delete leadList; 
        }catch(DMLException e) { 
            return res; 
        } 
         
     res.isSuccess = true; 
        res.status = 'Success'; 
        res.lead = leadList[0].Id; 
        return res;    
         
    } 	     
}