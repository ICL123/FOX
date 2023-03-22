@isTest
public class DuplicateLeadTest {
    
    @testSetup
    static void setup() {
		List<Lead> testLeadList = new List<Lead>();
        for(Integer i = 0; i < 5 ; i++) {
            testLeadList.add(new Lead(LastName = 'Gaikwad'+i, Email = 'gaikwad@gmail.com', Company = 'MNC' + i));
        }
        insert testLeadList;
        
        LeadCriteria__c leadCriteriaObj = new LeadCriteria__c();
        leadCriteriaObj.IsActive__c = true;
        leadCriteriaObj.Name = 'Email';
        insert leadCriteriaObj;
    }
    
	@isTest
    private static void testDuplicateLead() {

            List<Lead> leadList = new List<Lead>();
            for(Integer i = 1; i <= 10; i++)
            {
                Lead leadObj=new Lead();
                leadObj.LastName='Test';
                leadObj.LeadSource='Dreamforce';
                leadObj.Company='SF';
                leadObj.Email = 'abc@gmail.com';
                leadObj.Status='Working - Contacted';
                leadList.add(leadObj);
            }
            insert leadList;
            
            Test.startTest();
            	DuplicateLeadBatch  rdp = new DuplicateLeadBatch();
            	Id batchId = Database.executeBatch(rdp);
            Test.stopTest();
 
    }
}