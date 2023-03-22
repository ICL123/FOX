@isTest
private class TestNewRest {

    @isTest static void testGetCaseById() {

        Id recordId = createTestRecord();

        // Set up a test request

        RestRequest request = new RestRequest();

        request.requestUri = '/services/apexrest/LeadRec' + recordId;

          

        request.httpMethod = 'GET';

        RestContext.request = request;

        // Call the method to test

        Lead thislead = RestNew.getLeadMethod();

        // Verify results

        System.assert(thislead != null);

        System.assertEquals('Test record', thislead.FirstName);

    }

    @isTest static void testCreatelead() {

        // Call the method to test
		RestNew.Result res = new RestNew.Result();
        
        res = RestNew.createLead( 'Test record', 'New', 'lead@gmail.com', '1234567890','espl');

           

        // Verify results

        System.assert(res.isSuccess=true);

        //System.assert(thislead != null);

        //System.assertEquals(thislead.LastName, 'New');

    }

    @isTest static void testDeletelead() {

        Id recordId = createTestRecord();

        // Set up a test request

        RestRequest request = new RestRequest();

        request.requestUri =

            'https://eternussolutionsprivatel-b7-dev-ed.my.salesforce.com//services/apexrest/RESTprob/'+ recordId;

        request.httpMethod = 'DELETE';

        RestContext.request = request;

        // Call the method to test

        RestNew.deleteLead();

        // Verify record is deleted

        List<Lead> leads = [SELECT Id FROM Lead WHERE Id=:recordId];

        System.assert(leads.size() == 0);

    }

    @isTest static void testUpdateFields() {

        Id recordId = createTestRecord();
		RestNew.Result res = new RestNew.Result();

        RestRequest request = new RestRequest();

        request.requestUri = 'services/apexrest/LeadRec/'+ recordId;

        request.httpMethod = 'PATCH';

        request.addHeader('Content-Type', 'application/json');

        request.requestBody = Blob.valueOf('{"LastName": "bajaj"}');

        RestContext.request = request;

        // Update status of existing record to Working



        // Verify record was updated

        //System.assert(thisleadId != null);

        //Lead thislead = [SELECT Id,Status FROM Lead WHERE Id=:thisleadId];

        //System.assert(thislead != null);

        //System.assertEquals(thislead.LastName, 'bajaj');

    } 

       //helper method

        static Id createTestRecord() {

        // Create test record

       Lead leadTest = new Lead(

            FirstName='Test record',

            LastName='New',

            Email='lead@gmail.com',

            Phone='1234567890',

     Company='espl'  );

        insert leadTest;

        return leadTest.Id;

    }

}