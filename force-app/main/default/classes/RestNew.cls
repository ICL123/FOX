@RestResource(urlMapping='/LeadRec/*')

global with sharing class RestNew {

              global class Result {

        public Boolean isSuccess;

        public String lead;

        public String status;

    }

    @HttpGet

    global static Lead getLeadMethod(){

        RestRequest request = RestContext.request;

        string leadId= request.requestURI.substring(

        request.requestURI.lastindexof('/')+1

        );

 

        List<Lead> listleads = [SELECT Id, Name,FirstName,Email,LastName, MobilePhone, Rating, Title, Company FROM Lead WHERE Id =: leadId];

       

        if(listleads.isEmpty()== false)

            return listleads[0];

         return null;

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

       

        insert l;

        //return l.Id;

       

        

     	res.isSuccess = true;

        res.status = 'Success';

        res.lead = l.Id;

        return res;   

       

       

    }

      @HttpDelete

   global static void deleteLead() {

         RestRequest request = RestContext.request;

        string leadId= request.requestURI.substring(

        request.requestURI.lastindexof('/')+1);

Lead leadlist =[select Id from Lead where Id=:leadId];

delete leadlist;

}

       

        

@HttpPatch

    global static Result updateLead() {
        Result res= new Result();

        res.isSuccess = false;

        res.status = 'Error';

        RestRequest request = RestContext.request;

        string leadId= request.requestURI.substring(

        request.requestURI.lastindexof('/') + 1);

Lead leadlist =[select Id from Lead where Id=:leadId];

       Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());

        // Iterate through each parameter field and value

        for(String fieldName : params.keySet()) {

            // Set the field and value on the Case sObject

            leadlist.put(fieldName, params.get(fieldName));

        }

        update leadlist;
     	res.isSuccess = true;

        res.status = 'Success';

        res.lead = leadlist.Id;

        return res;

       

    }

}